const entrada = require("readline-sync")

const peso_peca = entrada.questionFloat("Digite o peso da peca: \n")

if (peso_peca > 95 && peso_peca < 105) {
    console.log(`PECA APROVADA com o peso ${peso_peca}g`)
}
else {
    console.log(`PECA REPROVADA com o peso ${peso_peca}g`)
}