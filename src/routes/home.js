const express = require("express")
const rotas = express.Router()

rotas.get("/principal", (req, res) => {
    res.render("home")
})

module.exports = rotas