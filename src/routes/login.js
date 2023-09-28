const express = require("express");
const bodyParser = require('body-parser')
const rotaHome = require("./home")
const conn = require("../models/database/connect")
const rotas = express.Router();
const usuariosAutenticados = require("../models/users");

rotas.use(bodyParser.urlencoded({extended:true}))

rotas.post("/login", (req, res) => {
  const { username, senha } = req.body;

  console.log("username:", username);
  console.log("senha:", senha);

  const query = 'SELECT matricula, usuario FROM logsfuncionarios WHERE usuario = ? AND senha = ?';
  conn.query(query, [username, senha], (error, results) => {
    if (error) {
      console.error('Erro ao executar a consulta:', error);
      conn.end(); 
      const error_login = "Erro ao verificar o login.";
      res.render("login", { error_login });
    } else if (results.length > 0) {
      const { matricula, usuario } = results[0];
      console.log(`Login bem-sucedido. Usuário: ${usuario} (Matrícula: ${matricula})`);
      conn.end(); 
      res.redirect("/");
    } else {
      
      console.log("Autenticação falhou");
      conn.end(); 
      const error_login = "Credenciais inválidas";
      res.render("login", { error_login });
    }
  });
});

rotas.get("/login", (req, res) => {
    const error_login = ""

    res.render("login", {error_login});
});

module.exports = rotas;
