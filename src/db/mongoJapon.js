// src/db/mongoJapon.js
const mongoose = require("mongoose");
require("dotenv").config();

const connectMongoJapon = async () => {
  try {
    await mongoose.connect(process.env.MONGO_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log("✅ Conectado a MongoDB Japón");
  } catch (error) {
    console.error("❌ Error al conectar a MongoDB Japón:", error);
  }
};

module.exports = connectMongoJapon;
