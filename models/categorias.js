const pool = require('./../utils/bd');
const T_CATEGORIAS = "categorias"

const get = async () => {
  const query = "SELECT * FROM categorias ";
  return await pool.query (query);
}

const getsinglecat = async (id) => {
  const query = "SELECT * FROM categorias WHERE categorias.id = ?";
  const params = [id];
  return await pool.query (query, params);
}

const crearcat = async (obj) => {
  const query = "INSERT INTO ?? SET ?";
  const params = [T_CATEGORIAS, obj];
  return await pool.query (query, params);
}

const updatecate = async(id, obj) => {
  const query = "UPDATE ?? SET ? WHERE id = ?";
  const params = [T_CATEGORIAS, obj, id];
  return await pool.query(query, params);
}

const delcat = async(id) => {
  const query = "UPDATE ?? SET eliminado = 1 WHERE id = ?";
  const params = [T_CATEGORIAS, id];
  return await pool.query(query, params);
}


module.exports= {get, getsinglecat, crearcat, updatecate, delcat}