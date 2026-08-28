const entrada = require('readline-sync');
console.log("--- SIMULADOR DE EMPRESTIMO --- ");

const renda = entrada.question("Digite o valor da sua renda: ");
const nome_sujo = entrada.keyInYNStrict("Seu nome esta sujo? ");

if (renda >= 2000 && ( nome_sujo === false)) {
    console.log(`\nPARABENS, seu emprestimo foi APROVADO!`);
} else {
    console.log(`\nSinto muito, seu emprestimo foi NEGADO. `);
}