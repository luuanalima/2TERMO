const entrada = require ("readline-sync")
const verificarPeso = require("./funcoesbalanca");
while (true) {
    const peso = entrada.question("Digite o peso da peca (gramas) ou digite 'sair' para sair: ");
    if (peso.toLowerCase() === "sair") break;
    
    try {
        const resultado = verificarPeso.verificarPeso(peso);
        console.log(resultado);
    } catch (error) {
        console.log(`\n⚠️  ALERTA: ${error.message}`);
    }
}