const entrada = require("readline-sync")
function calcularArea(largura, comprimento) {
    return largura * comprimento;
}
console.log("--- CALCULADORA DE AREA DE TERRENOS ---");
for (let i = 1; i <= 3; i++) {
    const largura = entrada.questionFloat(`Digite a largura do terreno ${i} (em metros): `);
    const comprimento = entrada.questionFloat(`Digite o comprimento do terreno ${i} (em metros): `);
    const areaTotal = calcularArea(largura, comprimento);
    console.log(`A area total do Terreno ${i} e: ${areaTotal}metros quadrados`);
}
