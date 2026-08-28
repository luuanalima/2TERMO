// Criando a "maquina" de calcular media
const entrada = require("readline-sync")
function calcularMedia(n1, n2) {
    return (n1 + n2) / 2;
}

// Usando a maquina
const numero1 = entrada.questionFloat("Digite sua primeira nota: ");
const numero2 = entrada.questionFloat("Digite sua segunda nota: ");
const resultado1 = calcularMedia(numero1, numero2);
console.log(`A media calculada foi: ${resultado1}` );

