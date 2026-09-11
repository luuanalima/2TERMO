const entrada = require("readline-sync")

let medida = 0


for (let i = 0; i < 5; i++) {
    const num = entrada.questionInt(`Digite a medida ${i + 1}: \n`)
    medida = num + medida
}

media = medida / 5

console.log(`A soma final foi de ${medida} e a media entre elas foi de ${media}`)