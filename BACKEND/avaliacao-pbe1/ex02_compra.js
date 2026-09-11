const entrada = require("readline-sync")

const material = entrada.question("Digite o nome do material: \n")
const qtd_comprada = entrada.questionInt("Digite a quantidade comprada:")
const preco = entrada.questionFloat("Digite o preco do material: ")

const total_compra = qtd_comprada * preco

console.log(`Sua compra de ${material}, ficou o total de R$ ${total_compra.toFixed(2)}`)