const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const vuelosRoutes = require('./routes/vuelos.routes');
const pasajesRoutes = require('./routes/pasajes.routes');
const pasajerosRoutes = require('./routes/pasajeros.routes');


dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

// Rutas
app.use('/api/vuelos', vuelosRoutes);
app.use('/api/pasajes', pasajesRoutes);
app.use('/api/pasajeros', pasajerosRoutes);


// Iniciar servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`🚀 Servidor Express corriendo en http://localhost:${PORT}`);
});
