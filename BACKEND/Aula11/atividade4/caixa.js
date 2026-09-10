const entrada = require('readline-sync');
const calculosVenda = require('./calculosVenda');

const nome = entrada.question("Digite o nome do cliente: ");
const preco = entrada.questionFloat("Digite o preco do produto: ");
const qtd = entrada.questionInt("Digite a quantidade de produtos: ");

const total = calculosVenda.calcularTotal(preco, qtd);
const cupom = calculosVenda.gerarCupom(nome, total);
console.log(cupom);