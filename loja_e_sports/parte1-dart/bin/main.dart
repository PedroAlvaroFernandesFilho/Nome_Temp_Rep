import 'models/produto.dart';
import 'models/loja.dart';
import 'models/produto_digital.dart';
void main() {

  final mouse = Produto(
    nome: 'Mouse Delux m900 Pro', 
    quantidade: 15, 
    preco: 249.90, 
    dataLancamento: DateTime(2026, 2, 20),
  );
  
  final teclado = Produto(
    nome: 'Aula F75 Max', 
    quantidade: 12, 
    preco: 299.90, 
    dataLancamento: DateTime(2025, 12, 10),
  );

  final blackMyth = Produtodigital(
    nome: 'Black Myth: Wukong', 
    quantidade: 15, 
    preco: 280.90, 
    dataLancamento: DateTime(2024, 8, 20),
    plataforma: 'PS5, Xbox',
    tamanhoGb: 137.4,
  );

  final loja = Loja(nome: 'nometep');

  loja.adicionar(mouse);
  loja.adicionar(teclado);
  loja.adicionar(blackMyth);

  print('');

  // ==========================================================
  // [1] ENTIDADE PRINCIPAL
  // ==========================================================
  print('===== [1] ENTIDADE PRINCIPAL =====');

  print(
    'Produto: ${mouse.nome} | '
    '${mouse.quantidade} unidades | '
    'R\$ ${mouse.preco.toStringAsFixed(2)} | '
    '${mouse.dataLancamento.year}',
  );

  print('');

  // ==========================================================
  // [2] HERANÇA
  // ==========================================================
  print('===== [2] HERANÇA =====');

  print('Produto comum -> ficha: "${teclado.ficha()}"');
  print('Produto Digital -> ficha: "${blackMyth.ficha()}"');

  print('');

  // ==========================================================
  // [3] COMPOSIÇÃO
  // ==========================================================
  print('===== [3] COMPOSIÇÃO =====');

  print(
    'Loja "${loja.nome}" contém '
    '${loja.quantidadeProdutos} produtos:',
  );
  loja.listarProdutos();

  print('');

  // ==========================================================
  // [4] ENCAPSULAMENTO
  // ==========================================================
  print('===== [4] ENCAPSULAMENTO =====');

  print(
    'Loja "${loja.nome}" -> total de unidades '
    '(calculado): ${loja.totalUnidades}',
  );

  final headset = Produto(
    nome: 'Mchose v9 Pro',
    quantidade: 10,
    preco: 199.90,
    dataLancamento: DateTime(2025, 1, 17),
  );

  loja.adicionar(headset);

  print(
    'Após adicionar "${headset.nome}" '
    '(${headset.quantidade} unidades): ${loja.totalUnidades}',
  );

  print('');
}
