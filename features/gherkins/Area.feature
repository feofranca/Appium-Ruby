# encoding: utf-8
# language:pt

@calculo_area
Funcionalidade: Conversão de área
  Eu como usuário do app
  Quero converter a area 
  Para utilizar no meu trabalho

  Contexto: Estar na tela de conversão de área
    * estar na tela de conversao de area

  Esquema do Cenário: Converter quilometros quadrados em metros quadrados
    Dado selecionar <atual> e <desejado> 
    Quando digitar o <valor>
    Então Deve ser exibido o valor convertido

    Exemplos:
      | valor |       atual             |    desejado             |
      |  10   | "quilometros quadrados" | "metros quadrados"      |
      |  1    | "quilometros quadrados" | "centimetros quadrados" |
      |  200  | "centimetros quadrados" | "metros quadrados"      |
      |  5000 | "centimetros quadrados" | "quilometros quadrados" |
      |  255  | "metros quadrados"      | "quilometros quadrados" |
      |  3450 | "metros quadrados"      | "centimetros quadrados" |
