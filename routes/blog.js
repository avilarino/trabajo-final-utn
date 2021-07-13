const express = require('express');
const router = express.Router();


const blog = (req, res) => {
  res.render('blog')
}







router.get('/', blog);



module.exports = router;