var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.get("/classes", function (req, res) {
    dashController.dadosClasse(req, res);
});

router.get("/fezQuiz", function (req, res) {
    dashController.dadosCadastro(req, res);
});


module.exports = router;