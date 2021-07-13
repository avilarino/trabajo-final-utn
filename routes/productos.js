const express = require('express');
const router = express.Router();
const {getAll, getSingle, createproducto, getNombre} = require('./../models/productos');

const get = async(req, res) => {
    const productos = await getAll();
    console.log(productos);
    res.render('productos', {productos});
}

/* Obtener Id -----------------------------*/

const single = async(req, res) => {
    const {id} = req.params;
    const [producto] = await getSingle(id);
    res.render('producto', {producto});
}

/* Crear Producto -----------------------------------*/

const create = async (req, res) => {
   const {body: producto} = req;
   await createproducto(producto);
   res.redirect("/")
}

const getcreate = async (req, res) => {
   res.render("createproductos");
}

/* buscador-------------------------------------------- */
const buscador = async(req, res) => {
    let {aBuscar} = req.body;
    aBuscar = '%' + aBuscar + '%';
    const productos = await getNombre(aBuscar);
    console.log(productos);
    res.render('productos', {productos});
}


router.post ("/create", create)
router.get ("/create", getcreate)



/* buscador */
router.post ('/', buscador)


router.get('/', get);
router.get('/single/:id', single);
module.exports = router;

