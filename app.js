const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const dotenv = require('dotenv')
/* sessions */
const session = require('express-session')
const {verifyUser} = require('./middlewares/auth')

dotenv.config()
const indexRouter = require('./routes/index');
const usersRouter = require('./routes/users');
const registroRouter = require('./routes/registro');
const productosRouter = require('./routes/productos');
const blogRouter = require('./routes/blog');
const SociosRouter = require('./routes/socios');
const redesRouter = require('./routes/redes');
const loginRouter = require('./routes/login');
const usuarios = require('./routes/usuarios');


const adminindex = require('./routes/admin/index');
const adminproductos = require('./routes/admin/productos');
const adminusuarios = require('./routes/admin/usuarios');
const admincategorias = require('./routes/admin/categorias');
const adminEmpleados = require('./routes/admin/empleados');




const app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
/* Poner antes de para que aplique como el process.env*/
app.use(session({
  secret : 'secreto',
  cookie : {maxAge: null},
  resave: true,
  saveUninitialized : false
}))



/* all */
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/registro', registroRouter);
app.use('/productos', productosRouter);
app.use('/blog', blogRouter);
app.use('/socios', SociosRouter);
app.use('/redes', redesRouter);
app.use('/login', loginRouter);

/* usuarios */
app.use('/usuarios', verifyUser, usuarios);

/* admin */
app.use('/admin', verifyUser, adminindex);
app.use('/admin/productos', adminproductos);
app.use('/admin/usuarios',   adminusuarios);
app.use('/admin/categorias', admincategorias);
app.use('/admin/empleados',  adminEmpleados);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
