# Trabalho Prático - Loja E-Sports

**Integrantes:** 
Pedro Alvaro Fernandes Filho - RA: 291150-2025
Pedro Vinicius Souza Batista - RA: 269554-2024
Felipe Henrique dos Reis Bott - RA: 280137-2025

## Domínio
O domínio do projeto é a gestão de estoque de periféricos para uma loja de e-sports. A classe `Loja` agrupa múltiplos objetos da classe `Produto` por meio de composição (relação "tem um"), e a classe `Produtodigital` é uma especialização que herda atributos e comportamentos de `Produto` via herança (relação "é um").

## Justificativa de Composição (Exercício 3)
A relação entre `Loja` e `Produto` é modelada por composição porque a loja "tem" uma lista de produtos, e não "é um" produto. Aplicar herança aqui violaria o princípio de substituição e impediria que a loja agrupasse múltiplos itens independentes em seu inventário.

## Tabela de Rastreio

| # | Exercício          |                 Arquivo e linha                  |             O que aparece na tela              |
|---|--------------------|--------------------------------------------------|------------------------------------------------|
| 1 | Entidade principal | parte1-dart/bin/models/produto.dart:1            | Bloco [1] do relatório                         |
| 2 | Herança            | parte1-dart/bin/models/produto_digital.dart:3    | Bloco [2] do relatório                         |
| 3 | Composição         | parte1-dart/bin/models/loja.dart:3               | Bloco [3] do relatório                         |
| 4 | Encapsulamento     | parte1-dart/bin/models/loja.dart:14              | Bloco [4] e total no topo da tela inicial      |
| 5 | Estrutura de tela  | parte2-flutter/lib/screens/home_page.dart:33     | AppBar e corpo com total no topo               |
| 6 | Cartão             | parte2-flutter/lib/screens/widgets/cartao.dart:4 | Cada item da lista desenhado como cartão       |
| 7 | Lista              | parte2-flutter/lib/screens/home_page.dart:67     | Lista rolável com seis itens                   |
| 8 | Navegação          | parte2-flutter/lib/screens/home_page.dart:73     | Toque no item abre a tela de detalhe           |
| 9 | Formulário         | parte2-flutter/lib/screens/cadastro_page.dart:18 | Tela de cadastro com três campos e confirmação |
| 10 | Estado            | parte2-flutter/lib/screens/home_page.dart:95     | Item novo na lista e total recalculado         |
