import 'produto.dart';

class Produtodigital extends Produto{

  String plataforma;
  double tamanhoGb;

  Produtodigital({

    required super.nome,
    required super.quantidade,
    required super.preco,
    required super.dataLancamento,
    required this.plataforma,
    required this.tamanhoGb,
  });

  @override
  String ficha(){
    return '${super.ficha()}, Plataforma: $plataforma, '
    'Armazenamento: ${tamanhoGb.toStringAsFixed(1)} GB';
  }
}