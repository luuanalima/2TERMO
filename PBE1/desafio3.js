const entrada = require('readline-sync');
console.log("--- ÁLCOOL OU GASOLINA? --- ");

const preco_alcool = entrada.questionINT("Digite o preco do litro do alcool: ");
const preco_gasolina = entrada.questionInt("Digite o preco do litro da gasolina: ");

total = (preco_alcool / preco_gasolina)
if (total < 0.7) {
    console.log(`\n Abasteca com ALCOOL.`);
}else if (total > 0.7) {
    console.log(`\n Abasteca com GASOLINA.`);
}