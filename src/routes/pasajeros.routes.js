const express = require('express');
const router = express.Router();
const {
  obtenerPasajeroPorPasaporte,
  crearPasajero
} = require('../controllers/pasajeros.controller');

router.get('/:pasaporte', obtenerPasajeroPorPasaporte);
router.post('/', crearPasajero);

module.exports = router;
