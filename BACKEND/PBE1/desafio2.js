const entrada = require('readline-sync');
console.log("--- CÁLCULO COM DECISÃO ---");
const conta = entrada.questionINT("Digite o valor da sua conta: ");

desconto = conta - (conta * 0.10)

if (conta > 100) {
    console.log(`\n você teve desconto! Seu valor a pagar com desconto é de ${desconto} reais.`);
}else if (conta <= 100) {
    console.log(`\n você não teve desconto! Seu valor a pagar sem desconto é de ${conta} reais.`);
}