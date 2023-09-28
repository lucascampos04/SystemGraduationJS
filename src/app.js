const express = require("express");
const routerLogin = require("./routes/login")
const routerHome = require("./routes/home")
const app = express();
const bodyParser = require("body-parser")

const router = [routerHome, routerLogin]

app.set('view engine', 'ejs')
app.set('views', './views')


app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())
app.use(express.json())
app.use(router)

const PORT = 3030
app.listen(PORT, () =>{
    console.log(`Servidor rodando na porta : http://localhost:${PORT}`)
})