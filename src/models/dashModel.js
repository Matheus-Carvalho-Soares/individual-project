var database = require("../database/config");

function dadosClasse() {

    var instrucaoSql =
        `select p.classe, COUNT(p.classe) as qtd FROM personalidade p
JOIN res_quiz r ON p.idClasse = r.fkPersonalidade GROUP BY p.classe;
    `

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function dadosCadastro() {

    var instrucaoSql =
        `select count(fkUsuario) as FezQuiz, (select count(idUsuario) from usuario)-(count(fkUsuario)) as 'Diferença' from res_quiz;`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    dadosClasse,
    dadosCadastro
}
