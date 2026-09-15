class Produto {
  String nome;
  int quantidade;
  double preco;
  DateTime dataLancamento;
  String imagemUrl;

  Produto({
    required this.nome,
    required this.quantidade,
    required this.preco,
    required this.dataLancamento,
    this.imagemUrl = 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=600',
  });

  String ficha() {
    return '$nome, $quantidade unidades, R\$ ${preco.toStringAsFixed(2)}, Ano: ${dataLancamento.year}';
  }
}