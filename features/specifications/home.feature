# language: pt
Funcionalidade: Home

  Contexto:
    # Insert steps

  Cenario: Produto encontrado Scenario
  Dado que eu estou procurando um produto
  Quando eu busco "PS4"
  Entao posso ver o resultado da busca

  Cenario: Produto nao Scenario
  Dado que eu estou procurando um produto
  Quando eu busco "naoencontrado"
  Entao nao posso ver o resultado da busca