const entrada = require("readline-sync")

const componentes = []

const produtos = [
    {nome: "parafuso", qtd:700 , estoqueMinimo:500},
    {nome: "porca", qtd:250 , estoqueMinimo:500},
    {nome: "Martelo", qtd:50 , estoqueMinimo:500},
    {nome: "Abraçadeira", qtd:10 , estoqueMinimo:500},
]; 
componentes.push(produtos)

for (let i = 0; i < produtos.length; i++) {
    if (produtos[i].qtd < produtos[i].estoqueMinimo) {
        console.log(`${produtos[i].nome}: REPOR ESTOQUE`);
    } else {
        console.log(`${produtos[i].nome}: ESTOQUE OK`);
    }
}
