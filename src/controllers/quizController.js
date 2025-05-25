var usuarioModel = require("../models/quizModel");

function checkClass(req, res) {
    var classe = req.body.quizServer;
    var id = req.body.idServer;
    if (id == undefined) {
        res.status(400).send("Seu id está undefined!");
    }
    else {
        usuarioModel.checkClass(id) // chama o model select pra ver se o usuário já fez o quiz ou nao
            .then(
                function (resultado) {
                    res.json(resultado);
                    if (resultado.length > 0) {
                        console.log("update"); // tem usuario no select
                        usuarioModel.attClass(classe, id)
                    } else {
                        console.log("insert"); // não tem usuario no select
                        usuarioModel.insertClass(classe, id);
                    }
                }
            ).catch(
                function (erro) { // reza pra nao dar erro
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o select! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    checkClass,
}