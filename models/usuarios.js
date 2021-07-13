const pool = require('./../utils/bd');
const T_USUARIOS = "usuarios"

const create = async(obj) => {
    const query = "INSERT INTO ?? SET ?";
    const params = [T_USUARIOS, obj];
    return await pool.query(query, params);
}

const verify = async(uid) => {
    const query = "UPDATE ?? SET habilitado = 1 WHERE confirmacionCorreo = ?"
    const params = [T_USUARIOS, uid];
    return await pool.query(query, params);
}
const auth = async(username, pass) => {
    const query = "SELECT id, admin FROM ?? WHERE username = ? AND pass = ? AND habilitado = 1 AND eliminado = 0";
    const params = [T_USUARIOS, username, pass];
    return await pool.query(query, params);
}

/* se hace el modulo en caso de usarlo */ 
const single = async(id) => {
    const query = "SELECT * FROM ?? WHERE id = ?";
    const params = [T_USUARIOS, id];
    return await pool.query(query, params);
}

const update = async(id, obj) => {
    const query = "UPDATE ?? SET ? WHERE id = ?";
    const params = [T_USUARIOS, obj, id];
    return await pool.query(query, params);
}
const all = async() => {
    const query = "SELECT * FROM ??";
    const params = [T_USUARIOS];
    return await pool.query(query, params);
}

const delusu = async(id) => {
    const query = "UPDATE ?? SET eliminado = 1 WHERE id = ?";
    const params = [T_USUARIOS, id];
    return await pool.query(query, params);
}





module.exports = {create, verify, auth, single, update, all, delusu}
