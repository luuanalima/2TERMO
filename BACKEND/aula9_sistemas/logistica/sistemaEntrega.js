const entrada = require('readline-sync');
const logistica = require('./calculadoraFrete');

console.log("=== SISTEMAS DE GERENCIAMENTO DE PROCESSOS LOGISTICOS ===");

const nomeProduto = entrada.question("Digite o nome do produto: ")
const distanciaEntrega = entrada.questionFloat("Digite a distancia de entrega em KM: ")
const valorCargaTotal = entrada.questionFloat("Digite o valor total da carga: ")

const totalBase = logistica.calcularBase(distanciaEntrega);
const prazoTotal = logistica.verificarPrazo(distanciaEntrega);
const seguroTotal = logistica.calcularSeguro(valorCargaTotal)

console.log("\n--- RELATORIO FINAL ---");
console.log(`Valor total do frete: R$ ${totalBase.toFixed(2)}`);
console.log(`Status do prazo: ${prazoTotal}`);
console.log(`Valor do seguro: R$ ${seguroTotal.toFixed(2)}`);
