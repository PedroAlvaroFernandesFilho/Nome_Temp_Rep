class Produto {
  String nome;
  int quantidade;
  double preco;
  DateTime dataLancamento;

  Produto({
    required this.nome,
    required this.quantidade,
    required this.preco,
    required this.dataLancamento,
  });

  String ficha() {
    return '$nome, $quantidade unidades, R\$ ${preco.toStringAsFixed(2)}, Ano: ${dataLancamento.year}';
  }
}