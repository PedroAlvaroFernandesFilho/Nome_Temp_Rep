import 'produto.dart';

class Loja {

  String nome;

  final List<Produto> _produtos = [];

  Loja({required this.nome});

List<Produto> get produtos => _produtos;

  void adicionar(Produto produto) {
    _produtos.add(produto);
  }

  int get totalUnidades{
    return _produtos.fold(
      0, (total, produto) => total + produto.quantidade,
    );
  }

  int get quantidadeProdutos{
    return _produtos.length;
  }

  void listarProdutos() {
    for (final produto in _produtos) {
      print(' - ${produto.nome}');
    }
  }
}