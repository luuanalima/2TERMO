const entrada = require('readline-sync');
const conversorDolar = require('./conversor');

const valorDolar = entrada.questionFloat("Digite o valor em dolar: ");
const valorReal = conversorDolar(valorDolar);

console.log(`Valor convertido para real: R$ ${valorReal.toFixed(2)}`);