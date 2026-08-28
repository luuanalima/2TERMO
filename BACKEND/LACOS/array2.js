const entrada = require('readline-sync');

console.log("=== SISTEMA DE CONTROLE DE QUALIDADE - PESAGEM ===")

// 1.Definição de variaveis
const pesos = []; // Array para guardar o histórico (dia 4)
let somaTotal = 0; // Acumulador (dia 3)

const qtdPecas = entrada.questionInt("Quantas pecas deseja avaliar? ");

// 2. Loop para coletar dados
for (let i = 0; i < qtdPecas; i++) {
    let peso = entrada.questionFloat(`Digite o peso da peca ${i + 1} (kg): `);

    pesos.push(peso);  //Guardar no prédio/Array
    somaTotal += peso; // Soma no cofre/Acumulador
}

// 3.Calculos
const media = somaTotal / qtdPecas;

//4. Exibição de relatório
console.log("\n--- RELATORIO DE AUDITORIA ---");
console.log(`Pesos registrados: [ ${pesos.join(" kg | ")} kg ]`);
console.log(`Media de peso do lote : ${media.toFixed(2)} kg`);

// 5. Decisão (Lógica combinada da semana 2)
if (media >= 4.8 && media <= 5.2) {
    console.log("STATUS FINAL: LOTE APROVADO!");
} else {
    console.log("STATUS FINAL: LOTE REPROVADO (Fora do padrão");
}