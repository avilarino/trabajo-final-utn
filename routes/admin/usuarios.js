const express = require('express');
const router = express.Router();
const {all, single, create, update} = require ('./../../models/usuarios')
const model = require('./../../models/usuarios');



const allusu =  async (req, res) => {
  const usuarios = await all();
  res.render("adminUsuarios", {usuarios})
}

const singleusu = async (req, res) => {
  const {id} = req.params;
  const usuario = await single(id);
  console.log(usuario)
  res.render("usuario", {usuario})
}

const createusu = async (req, res) => {
  const {body: usuario} = req;
  const messageIdcat = await create(usuario);
  console.log(messageIdcat);
  res.redirect("/admin/usuarios");
}

const getcreateusu = async (req, res) => {
  res.render("createUsuarios")
}

const updateusu = async (req, res) => {
  const {id} = req.params;
  const usuario = req.body;
  console.log(usuario);
  const {insertId} = await update(id, usuario);
  console.log(insertId);
  res.redirect('/admin/usuarios');
}
const showUpdateUsu = async (req, res) => {
  const {id} = req.params;
  const [usuario] = await single(id);
  res.render('updateUsuario', {usuario});
}

const delusuario = async (req, res) => {
  const {id} = req.params;
  const {insertId} = await model.delusuario(id);
  console.log(insertId);
  res.redirect('/admin/usuarios');
}




router.get('/delete/:id', delusuario);

router.get('/update/:id', showUpdateUsu);
router.post('/update/:id', updateusu);

router.get("/single/:id", singleusu);
router.get("/", allusu);

router.get("/create", getcreateusu)
router.post("/create", createusu)

module.exports = router;