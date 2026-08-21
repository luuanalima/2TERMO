const entrada = require('readline-sync');
console.log("--- CLASSIFICAÇÃO DE ATLETA--- ");

const idade = entrada.questionINT("Digite a idade do aluno: ");

if (idade < 5){
    console.log("O aluno é muito jovem para a competicao!")
}
if (idade >= 5 && idade <= 10) {
    console.log(`\n Categoria Infantil.`);
}if (idade >= 11 && idade <= 17) {
    console.log(`\n Categoria Juvenil.`);
}
if (idade >= 18 && idade <= 60) {
    console.log(`\n Categoria Adulto.`);
}else if (idade > 60) {
    console.log(`\n Categoria Senhor.`);
}
