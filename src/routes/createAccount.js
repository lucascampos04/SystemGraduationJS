const express = require("express")
const bodyParser = require('body-parser')
const conn = require("../models/database/connect")

const rotas = express.Router()
rotas.use(bodyParser.urlencoded({extended:true}))

rotas.post("/criar-conta", (req, res) => {
    const { nome, curso, faculdade, whatsapp } = req.body;

    if (!nome || !curso || !faculdade || !whatsapp) {
        console.log("Todos os campos devem ser preenchidos.");
    } else {
        console.log("Foi");

        const query = "INSERT INTO curso (curso) VALUES (?)";
        conn.query(query, [curso], (error, results) => {
            if (error) {
                console.error('Erro ao executar a consulta:', error);
                const error_login = "Erro ao verificar o login.";
            } else {
                res.redirect("/principal");
                console.log("usuario criado.")
            }
        });
    }
});

rotas.get("/criar-conta", (req, res) => {
    res.render("criar-conta")
})

module.exports = rotas