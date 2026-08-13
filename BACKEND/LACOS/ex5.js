const entrada = require("readline-sync");
let total = 0;
let preco = -1;

while (preco !==0) {
    preco = entrada.questionFloat("Preco; R$ ");

    if(preco !==0) {
        total +=preco ;
        console.log(`Subtotal: R$ ${total.toFixed(2)}`);
    
    }
}