const entrada = require("readline-sync")

function calcularEficiencia(real, prevista) {
    const percentual = real / prevista * 100
    return percentual
}
function classificarEficiencia(percentual) {
    if (percentual >= 90){
        console.log(`META ATINGIDA`)
    }
    else if ( percentual >= 70 && percentual <= 89.99){
        console.log(`ATENCAO`)
    }
    else {
        console.log(`ABAIXO DA META`)
    }
}


const prevista = entrada.questionInt("Digite a producao prevista: \n")
const real = entrada.questionInt("Digite a producao real: \n")

const percentual = calcularEficiencia(real, prevista)
const classificacao = classificarEficiencia(percentual)

console.log(`Producao prevista: ${prevista}, Producao real: ${real}, Percentual: ${percentual} e Classificacao: ${classificacao}`)

