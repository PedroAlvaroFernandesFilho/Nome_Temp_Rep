import 'package:flutter/material.dart';
import '../models/produto.dart';

class DetalhePage extends StatelessWidget {
  final Produto produto;

  const DetalhePage({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem individual de cada produto
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  produto.imagemUrl,
                  height: 150, // Diminuir para ajustar a altura
                  width: 150,  // Definir uma largura fixa
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              produto.nome,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'Preço: R\$ ${produto.preco.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.indigo,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(height: 32),
            // Dado extra 1 não exibido no cartão
            Text(
              'Quantidade em estoque: ${produto.quantidade} unidades',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Dado extra 2 não exibido no cartão
            Text(
              'Data de lançamento: ${produto.dataLancamento.day.toString().padLeft(2, '0')}/${produto.dataLancamento.month.toString().padLeft(2, '0')}/${produto.dataLancamento.year}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            Text(
              'Ficha técnica: ${produto.ficha()}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}