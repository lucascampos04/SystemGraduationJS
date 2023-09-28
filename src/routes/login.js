const express = require("express");
const rotas = express.Router();

// Importe o objeto de usuários com as credenciais corretas
const usuariosAutenticados = require("../models/users");

rotas.post("/login", (req, res) => {
   const { username, senha } = req.body;

  console.log("username:", username);
  console.log("senha:", senha);

  if (username === usuariosAutenticados.username && senha === usuariosAutenticados.senha) {
    res.json(usuariosAutenticados);
  } else {
    console.log("Autenticação falhou");
    res.status(401).json({ error_login: "Credenciais inválidas" });
  }
});

rotas.get("/login", (req, res) => {
    const error_login = ""

    res.render("index", {error_login});
});

module.exports = rotas;
