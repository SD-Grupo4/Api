const db = require('../db/mysqlBolivia');

// ✅ Este estaba faltando
const obtenerPasajesPorVuelo = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await db.query(
      'SELECT Asiento, Estado FROM pasajes WHERE FlightID = ?',
      [id]
    );
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ mensaje: 'Error al obtener asientos' });
  }
};

const crearPasaje = async (req, res) => {
  try {
    const {
      FlightID,
      PasajeroID,
      Asiento,
      Clase,
      Estado,
      EpochCompra,
      ServerConected,
      RelojVectorial,
      NombreCompleto
    } = req.body;

    let [rows] = await db.query(
      'SELECT Id FROM pasajeros WHERE Pasaporte = ?',
      [PasajeroID]
    );

    let pasajeroRealID;
    if (rows.length === 0) {
      const insert = await db.query(
        'INSERT INTO pasajeros (Pasaporte, NombreCompleto) VALUES (?, ?)',
        [PasajeroID, NombreCompleto || 'Pasajero desconocido']
      );
      pasajeroRealID = insert[0].insertId;
    } else {
      pasajeroRealID = rows[0].Id;
    }

    const [existente] = await db.query(
      'SELECT * FROM pasajes WHERE FlightID = ? AND Asiento = ?',
      [FlightID, Asiento]
    );

    if (existente.length > 0) {
      return res.status(409).json({ mensaje: 'Asiento ya reservado o vendido' });
    }

    await db.query(
      `INSERT INTO pasajes (
        FlightID, PasajeroID, Asiento, Clase, Estado, EpochCompra, ServerConected, RelojVectorial
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
      [
        FlightID,
        pasajeroRealID,
        Asiento,
        Clase,
        Estado,
        EpochCompra,
        ServerConected,
        JSON.stringify(RelojVectorial)
      ]
    );

    res.status(201).json({ mensaje: 'Pasaje creado exitosamente' });
  } catch (err) {
    console.error('❌ Error al crear pasaje:', err);
    res.status(500).json({ mensaje: 'Error al crear pasaje' });
  }
};

module.exports = {
  obtenerPasajesPorVuelo,
  crearPasaje
};
