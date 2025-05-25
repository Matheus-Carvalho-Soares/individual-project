var database = require("../database/config");

function dadosClasse(limite_linhas) {

    var instrucaoSql =
        `select p.classe, COUNT(p.classe) as qtd FROM personalidade p
JOIN res_quiz r ON p.idClasse = r.fkPersonalidade GROUP BY p.classe LIMIT ${limite_linhas};
    `

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
module.exports = {
    dadosClasse
}
