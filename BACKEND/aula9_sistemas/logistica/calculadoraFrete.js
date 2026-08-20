function calcularBase(km) {
    return km * 2.10;
}

function verificarPrazo(km) {
    if (km<=100) {
        return "1 dia util";
    }else{
        return "3 a 5 dias uteis";
    }
}

function calcularSeguro(valorCarga) {
    return valorCarga * 1.01;
}
module.exports = {
    calcularBase,
    verificarPrazo,
    calcularSeguro
}