const pool = require('./../utils/bd');
const T_PRODUCTOS = "productos";
const T_CATEGORIAS = "categorias";

const getAll = async() => {
    const query = "SELECT p.id, p.nombre, p.descripcion, p.precio, p.stock, c.nombre AS nombreCategoria FROM ?? AS p JOIN ?? AS c ON p.id_categoria = c.id WHERE p.eliminado = 0";
    const params = [T_PRODUCTOS, T_CATEGORIAS];
    const rows = await pool.query(query, params);
    return rows;
}

const getSingle = async(id) => {
    const query = "SELECT p.id, p.nombre, p.descripcion, p.precio, p.stock, p.id_categoria, c.nombre AS nombreCategoria FROM ?? AS p JOIN ?? AS c ON p.id_categoria = c.id WHERE p.id = ? AND p.eliminado = 0";
    const params = [T_PRODUCTOS, T_CATEGORIAS, id];
    const rows = await pool.query(query, params);
    return rows;
}
const createproducto = async(obj) => {
    const query = "INSERT INTO ?? SET ?";
    const params = [T_PRODUCTOS, obj];
    return await pool.query(query, params);
}

const update = async(id, obj) => {
    const query = "UPDATE ?? SET ? WHERE id = ?";
    const params = [T_PRODUCTOS, obj, id];
    return await pool.query(query, params);
}
const del = async(id) => {
    const query = "UPDATE ?? SET eliminado = 1 WHERE id = ?";
    const params = [T_PRODUCTOS, id];
    return await pool.query(query, params);
}

const getNombre = async(nombre) => {
    const query = "SELECT p.id, p.nombre, p.descripcion, p.precio, p.stock, p.id_categoria, c.nombre AS nombreCategoria FROM ?? AS p JOIN ?? AS c ON p.id_categoria = c.id WHERE p.nombre LIKE ? AND p.eliminado = 0";
    const params = [T_PRODUCTOS, T_CATEGORIAS, nombre];
    const rows = await pool.query(query, params);
    return rows;
}



module.exports = {getAll, getSingle, createproducto, update, del, getNombre}

