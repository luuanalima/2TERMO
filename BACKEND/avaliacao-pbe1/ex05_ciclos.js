const entrada = require("readline-sync")

const peca_ciclo = entrada.questionInt("Digite quantas pecas a maquina produz por ciclo: \n ");
let total_peca = peca_ciclo 

for (let i = 0; i < 10; i++) {
    console.log(`A maquina produziu no ciclo ${i + 1}, ${peca_total} pecas`)
    total_peca = total_peca + peca_ciclo
}