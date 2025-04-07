const db = require('../db/mysqlBolivia');

// Obtener todos los vuelos o filtrar por ciudad de origen y destino
const obtenerVuelos = async (req, res) => {
  try {
    const { origen, destino } = req.query;

    let sql = `
      SELECT v.Id, v.OutDepartureTime, v.InDepartureTime, v.Gate,
             o.Ciudad AS Origen, d.Ciudad AS Destino
      FROM vuelos v
      JOIN destinos o ON v.RutaIDOrigin = o.DestinoID
      JOIN destinos d ON v.RutaIDDestination = d.DestinoID
    `;

    const params = [];
    if (origen && destino) {
      sql += ' WHERE o.Ciudad = ? AND d.Ciudad = ?';
      params.push(origen, destino);
    }

    const [rows] = await db.query(sql, params);
    res.json(rows);
  } catch (error) {
    console.error('❌ Error al obtener vuelos:', error);
    res.status(500).json({ mensaje: 'Error al obtener vuelos' });
  }
};

// Obtener vuelo por ID
const obtenerVueloPorId = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM vuelos WHERE Id = ?', [req.params.id]);
    if (rows.length === 0) {
      return res.status(404).json({ mensaje: 'Vuelo no encontrado' });
    }
    res.json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ mensaje: 'Error al obtener vuelo' });
  }
};

module.exports = {
  obtenerVuelos,
  obtenerVueloPorId,
};
