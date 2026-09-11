const entrada = require("readline-sync")

const nome = []

for (let i = 0; i < 5; i++) {
    const nome_operador = entrada.question(`Digite o nome do operador ${i + 1}:`);
    nome.push(nome_operador);
}
 for (i = 0; i < nome.length; i++) {
    console.log( i + 1 + ": " + nome[i])
 }