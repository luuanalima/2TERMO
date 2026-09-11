const entrada = require("readline-sync")

const temperatura = entrada.questionFloat("Digite a temperatura atual da maquina: ")

if (temperatura <= 60) {
    console.log(`situacao: NORMAL maquina de temperatura de ${temperatura}°C`)
}
else if (temperatura > 60 && temperatura <= 80) {
    console.log(`situacao: ATENCAO maquina de temperatura de ${temperatura}°C`)
}
else {
    console.log(`situacao: CRITICA maquina de temperatura de ${temperatura}°C`)
}