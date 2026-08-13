# 2º Semestre - Repositório de Estudos e Exercícios

## Descrição do projeto

Este repositório reúne atividades, exercícios e projetos desenvolvidos durante o 2º termo do curso, com foco em:

- programação em JavaScript com Node.js;
- lógica de programação;
- arrays e estruturas de controle;
- HTML e CSS;
- modelagem de banco de dados conceitual.

O projeto reúne materiais de diferentes áreas do curso, organizados em pastas temáticas para facilitar o estudo e a revisão dos conteúdos.

## Tecnologias utilizadas

- JavaScript
- Node.js
- HTML5
- CSS3
- Git e GitHub
- readline-sync
- modelagem conceitual de banco de dados (BrModelo)

## Estrutura de pastas

```text
2TERMO/
├── .git/
├── BACKEND/
│   ├── aula1/
│   │   └── package.json
│   ├── aula3/
│   │   └── ex.js
│   ├── LACOS/
│   │   ├── array.js
│   │   ├── array2.js
│   │   ├── ex5.js
│   │   ├── package.json
│   │   └── node_modules/
│   ├── PBE1/
│   │   ├── desafio1.js
│   │   ├── desafio2.js
│   │   ├── desafio3.js
│   │   ├── desafio4.js
│   │   ├── desafio5.js
│   │   ├── package.json
│   │   └── desafios/
│   ├── README
│   └── texto_readme
├── BCD/
│   └── AULA3/
│       ├── MODELO_RELACIONAMENTO_CONCEITUAL.brM
│       └── PROJETO_ESCOLA_CONCEITUAL.brM
├── LIMA/
│   ├── AULA1/
│   │   ├── index.html
│   │   ├── css.html
│   │   ├── desafio.html
│   │   └── ...
│   └── AULA2/
│       └── index.html
├── README.md
└── .gitignore (se existir no repositório)
```

## Resumo dos exercícios por pasta

### BACKEND

#### aula1
- Arquivo de configuração do projeto com dependência do pacote `readline-sync`.
- Estrutura básica de ambiente para execução de scripts em Node.js.

#### aula3
- Exercício simples de lógica em JavaScript.
- Demonstra uso de loop `while` para contagem e impressão no console.

#### LACOS
- `array.js`: exemplo de utilização de arrays.
- `array2.js`: exercício com entrada de dados e cálculo de média de pesos.
- `ex5.js`: prática com array e lógica de controle.

#### PBE1
- `desafio1.js`: identificando elementos em arrays e acessando posição específica.
- `desafio2.js`: cálculo do subtotal de compras com entrada de preços.
- `desafio3.js`: verificador de votação por idade.
- `desafio4.js`: cálculo de desconto de conta conforme valor informado.
- `desafio5.js`: classificação por faixa etária e categoria.
- `desafio6.js` não foi encontrado no workspace, mas a estrutura de desafios indica continuidade das atividades de lógica condicionada.

> Observação: alguns arquivos apresentam pequenas variações de sintaxe e nomes de variáveis, mas seguem a proposta de prática de lógica e entrada de dados em JavaScript.

### BCD

#### AULA3
- Modelos conceituais de relacionamento e projeto escolar em BrModelo.
- Conteúdo voltado para modelagem de banco de dados e estrutura de entidades, relacionamentos e requisitos de sistemas.

### LIMA

#### AULA1
- `index.html`: apresentação inicial com HTML, links e estilização inline.
- `css.html`: páginas com elementos de HTML e CSS básicos.
- `desafio.html`: página pessoal em HTML com dados pessoais e informações do autor.

#### AULA2
- `index.html`: continuidade dos estudos em HTML, organização e estruturação de páginas.

## Como executar os arquivos com Node.js

Para rodar os scripts JavaScript no terminal, siga os passos abaixo:

1. Abra o terminal no diretório do arquivo desejado.
2. Verifique se o Node.js está instalado:

```bash
node -v
```

3. Caso o projeto tenha dependências, instale-as com:

```bash
npm install
```

4. Execute o arquivo JavaScript:

```bash
node nome-do-arquivo.js
```

Exemplos:

```bash
cd BACKEND/LACOS
node array2.js
```

```bash
cd BACKEND/PBE1
defs
node desafio2.js
```

## Instruções de Git

### Inicializar o repositório

```bash
git init
```

### Adicionar arquivos

```bash
git add .
```

### Registrar commit

```bash
git commit -m "Primeiro commit"
```

### Conectar ao GitHub

```bash
git remote add origin <URL_DO_REPOSITORIO>
```

### Enviar alterações

```bash
git push -u origin main
```

### Verificar status

```bash
git status
```

### Verificar histórico

```bash
git log
```

## Autor

Luana Lima

## Observações finais

Este repositório funciona como um portfólio de estudos práticos, reunindo exercícios de lógica, desenvolvimento web e modelagem de dados. Ele pode ser usado como referência para revisão de conteúdos, organização de atividades escolares e acompanhamento do progresso ao longo do semestre.
