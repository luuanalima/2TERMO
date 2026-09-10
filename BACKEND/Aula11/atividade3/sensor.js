function checarTemperatura(valor) {
    if (valor > 40) {
        return "ALERTA: Caldeira Superaquecida!";
    } else {
        return "Tudo certo com a temperatura.";
    }}

function checarUmidade(valor) {
    if (valor < 20) {
        return "ALERTA: Ar muito seco!";
    } else {
        return "Tudo certo com a umidade da caldeira.";
    }}

module.exports = {
    checarTemperatura,
    checarUmidade
};
