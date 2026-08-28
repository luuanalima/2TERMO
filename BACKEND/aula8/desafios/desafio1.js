const entrada = require ("readline-sync")
console.log("--- O VERIFICADOR DE APOSENTADORIA ---");

const nome = entrada.question("Digite o seu nome: ");
const idade = entrada.questionInt("Digite a sua idade: ");
const tempo_contribuicao = entrada.questionInt("Digite quantos anos de contribuicao a empresa voce tem:")

if (idade >= 65 && tempo_contribuicao >= 30) {
    console.log(`\n${nome}, você tem ${tempo_contribuicao
    } anos de contribuiçao e ${idade} anos de idade e ja pode se aposentar!`);
}else {
    console.log(`\n${nome}, você tem ${tempo_contribuicao} anos de contribuiçao e ${idade} anos de idade e nao pode se aposentar!`);
}

