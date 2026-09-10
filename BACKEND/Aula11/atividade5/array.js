const entrada = require('readline-sync');
const pecasDefeituosas = [];
const qtdPecas = entrada.questionInt("Quantas pecas com defeito foram encontradas?\n");
for (let i = 0; i < qtdPecas; i++) {
    const peca = entrada.question(`Digite o numero da peca ${i + 1}: `);
    pecasDefeituosas.push(peca);
}

console.log(`Total de pecas: ${qtdPecas} - Numeros de serie: ${pecasDefeituosas.join(" | ")}`);