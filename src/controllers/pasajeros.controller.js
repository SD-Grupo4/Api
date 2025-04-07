const db = require('../db/mysqlBolivia');

const obtenerPasajeroPorPasaporte = async (req, res) => {
    try {
        const { pasaporte } = req.params;
        const [rows] = await db.query('SELECT * FROM pasajeros WHERE Pasaporte = ?', [pasaporte]);
        if (rows.length > 0) {
            res.json(rows[0]);
        } else {
            res.status(404).json({ mensaje: 'Pasajero no encontrado' });
        }
    } catch (err) {
        console.error(err);
        res.status(500).json({ mensaje: 'Error al buscar pasajero' });
    }
};

const crearPasajero = async (req, res) => {
    try {
        const { Pasaporte, NombreCompleto } = req.body;
        await db.query('INSERT INTO pasajeros (Pasaporte, NombreCompleto) VALUES (?, ?)', [Pasaporte, NombreCompleto]);
        res.status(201).json({ mensaje: 'Pasajero registrado' });
    } catch (err) {
        console.error(err);
        res.status(500).json({ mensaje: 'Error al registrar pasajero' });
    }
};
module.exports = { obtenerPasajeroPorPasaporte, crearPasajero };