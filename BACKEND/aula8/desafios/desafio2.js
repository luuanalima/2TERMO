const entrada = require("readline-sync")
console.log("--- O GERADOR DE PARCELAS ---");

const valor_total = entrada.questionInt("Qual o valor total do produto? ");
const parcelas = entrada.questionInt("Quantas parcelas? ");
const valor_parcela = valor_total / parcelas;

for (let i = 1; i <= parcelas; i++) {
    console.log(`Parcela ${i}: R$ ${valor_parcela.toFixed(2)}`);
}



