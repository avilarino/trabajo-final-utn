const express = require('express');
const router = express.Router();
const model = require('./../models/usuarios');

// requerimos los modulos instalados //
const sha1 = require('sha1');
const {v4: uuid} = require('uuid');
// requerimos el send de los servicios mail //
const { send } = require('./../services/mail')

//validamos el registro para que no queden datos vacios //
const {validateRegistro} = require('./../middlewares/usuarios');

const showRegistro = (req, res) => {
    res.render('registro');
}
const create = async (req, res) => {
    const usuario = req.body;
    console.log(usuario);
    let duplicado = false;
    const uid = uuid();
    console.log(uid)
    const usuarioFinal = { 
        username: usuario.username,
        pass: sha1(usuario.pass), // encriptamos la password para que no la vea el usuario//
        mail: usuario.mail,
        confirmacionCorreo: uid,
        telefono: usuario.telefono
    }
    const usuariosExistentes = await model.all(); 
    usuariosExistentes.forEach(usuario => {
        if (usuario.username == usuarioFinal.username || usuario.mail == usuarioFinal.mail) duplicado = true;
    })
    if (!duplicado) {
        const agregado = await model.create(usuarioFinal);
        console.log(agregado);
        send({
            mail : usuarioFinal.mail, 
            cuerpo:
            `<h1> Bienvenido ${usuarioFinal.username}</h1>
            <a href="${process.env.URL_SERVER}:${process.env.PORT}/registro/verify/${usuarioFinal.confirmacionCorreo}">Link magico</a>`,
            });
        res.redirect('/');
    }
    else {
        res.render('registro', {message : "el nombre de usuario y/o mail ingresado ya extisten"})
    }
}
const verify = async(req, res) => {
    const {uid} = req.params;
    console.log(uid);
    const messageId = await model.verify(uid);
    res.redirect('/');
}
router.get('/', showRegistro);
router.post('/', validateRegistro, create);
router.get('/verify/:uid', verify);
module.exports = router;