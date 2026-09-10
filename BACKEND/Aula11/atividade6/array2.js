const entrada = require('readline-sync');
const listaVisitantes = [];

while (true) {
    const resposta = entrada.question("Deseja cadastrar um novo visitante? (s/n)\n");


    if(resposta === "s") {
        let nome = entrada.question("Digite o nome:");
        let empresa = entrada.question("Digite a empresa:");
        listaVisitantes.push({
            nome: nome,
            empresa: empresa
        });
    } 
    if (resposta === "n") {
        console.log("Lista de visitantes cadastrados hoje:");
        console.log(listaVisitantes);
        break;
    }} 