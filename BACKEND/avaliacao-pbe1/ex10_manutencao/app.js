const entrada = require("readline-sync")

const manutencao = require('./funcoesManutencao')

const nome_maquina = entrada.question("Digite o nome da maquina: ")
const valor_peca = entrada.questionFloat("Digite o valor das pecas: ")
const horas = entrada.questionInt("Digite as horas de servico: ")
const meses = entrada.questionInt("Digite quantos meses desde a ultima manutencao: ")

const mao_de_obra = manutencao.calcularMaoDeObra(horas)
const total = manutencao.calcularTotal(valor_peca, horas)
const situacao_garantia = manutencao.verificarGarantia(meses)

console.log(`Maquina: ${nome_maquina}, Valor peca: ${valor_peca}, Mão de obra: ${mao_de_obra}, Total: ${total}, Messes: ${meses} Situacao garantia: ${situacao_garantia}`)