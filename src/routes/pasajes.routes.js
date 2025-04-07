const express = require('express');
const router = express.Router();
const { crearPasaje, obtenerPasajesPorVuelo } = require('../controllers/pasajes.controller');

router.post('/', crearPasaje);
router.get('/vuelo/:id', obtenerPasajesPorVuelo);

module.exports = router;
