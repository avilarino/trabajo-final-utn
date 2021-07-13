const express = require('express');
const router = express.Router();


const redes = (req, res) => {
  res.render('redes')
}







router.get('/', redes);



module.exports = router;