const express = require('express');
const router = express.Router();
const {get, getsinglecat, crearcat, updatecate, delcategoria} = require ('./../../models/categorias')

const allcat =  async (req, res) => {
  const categorias = await get();
  res.render("admincategorias", {categorias})
}

const singlecat = async (req, res) => {
  const {id} = req.params;
  const categoria = await getsinglecat(id);
  console.log(categoria)
  res.render("categoria", {categoria})
}

const createcat = async (req, res) => {
  const {body: categoria} = req;
  const messageIdcat = await crearcat(categoria);
  console.log(messageIdcat);
  res.redirect("/admin/categorias");
}

const getcreatecat = async (req, res) => {
  res.render("createcategorias")
}


const updatecat = async (req, res) => {
  const {id} = req.params;
  const categoria = req.body;
  console.log(categoria);
  const {insertId} = await updatecate(id, categoria);
  console.log(insertId);
  res.redirect('/');
}

const showUpdatecat = async (req, res) => {
  const {id} = req.params;
  const [categoria] = await getsinglecat(id);
  res.render('updateCategoria', {categoria});
}

const del = async (req, res) => {
  const {id} = req.params;
  const {messageId} = await delcategoria(id);
  console.log(messageId);
  res.redirect('/admin/categorias');
}

router.get('/delete/:id', del);

router.get('/update/:id', showUpdatecat);
router.post('/update/:id', updatecat);



router.get("/single/:id", singlecat);
router.get("/", allcat);

router.get("/create", getcreatecat)
router.post("/create", createcat)

module.exports = router;








