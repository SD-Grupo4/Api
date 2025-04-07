const express = require('express');
const router = express.Router();
const {
  obtenerVuelos,
  obtenerVueloPorId
} = require('../controllers/vuelos.controller');

// Rutas
router.get('/', obtenerVuelos);
router.get('/:id', obtenerVueloPorId);

module.exports = router;
