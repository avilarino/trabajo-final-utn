const express = require('express');
const router = express.Router();


const socios = (req, res) => {
  res.render('socios')
}







router.get('/', socios);



module.exports = router;