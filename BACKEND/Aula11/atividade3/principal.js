const entrada = require('readline-sync');
const sensor = require('./sensor');

const temperatura = entrada.questionFloat("Digite a temperatura: ");
const umidade = entrada.questionFloat("Digite a umidade: ");

console.log(sensor.checarTemperatura(temperatura));
console.log(sensor.checarUmidade(umidade)); 