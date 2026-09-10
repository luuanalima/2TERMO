const entrada = require('readline-sync');
console.log("--- O VERIFICADOR DE VOTAÇÃO ---");

const nome = entrada.question("Digite o nome do usuário: ");
const ano_nascimento = entrada.questionInt("Digite o ano do seu nascimento: ");

idade = (2026 - ano_nascimento)
if (idade < 16) {
    console.log(`\n${nome}, você tem ${idade} anos e não pode votar!`);
}else if (idade >= 16) {
    console.log(`\n${nome}, você tem ${idade} anos e pode votar!`);
}