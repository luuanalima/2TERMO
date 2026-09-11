function calcularMaoDeObra(horas) {
    const valor_hora = 80;
    return horas * valor_hora;
}

function calcularTotal(valorPecas, horas) {
    const maoDeObra = calcularMaoDeObra(horas);
    return valorPecas + maoDeObra;
}

function verificarGarantia(meses) {
    if (meses <= 6) {
        return 'EM GARANTIA';
    } else {
        return 'FORA DA GARANTIA';
    }
}

module.exports = {
    calcularMaoDeObra,
    calcularTotal,
    verificarGarantia
};