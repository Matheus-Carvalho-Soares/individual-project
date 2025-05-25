var express = require("express");
var router = express.Router();

var dashController = require("../controllers/dashController");

router.get("/grafico", function (req, res) {
    dashController.dadosClasse(req, res);
});

module.exports = router;