import 'package:flutter/material.dart';
import '../models/produto.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _quantidadeController.dispose();
    _precoController.dispose();
    super.dispose();
  }

  void _confirmarCadastro() {
    final String nome = _nomeController.text.trim();
    final int quantidade = int.tryParse(_quantidadeController.text.trim()) ?? 0;
    final double preco = double.tryParse(_precoController.text.trim()) ?? 0.0;

    if (nome.isEmpty || quantidade <= 0 || preco <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos com valores válidos')),
      );
      return;
    }

    final novoProduto = Produto(
      nome: nome,
      quantidade: quantidade,
      preco: preco,
      dataLancamento: DateTime.now(),
    );

    Navigator.of(context).pop(novoProduto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Produto'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do Produto',
                prefixIcon: const Icon(Icons.shopping_bag_outlined),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _quantidadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantidade',
                prefixIcon: const Icon(Icons.numbers),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _precoController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Preço (R\$)',
                prefixIcon: const Icon(Icons.attach_money),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _confirmarCadastro,
              icon: const Icon(Icons.check),
              label: const Text('Confirmar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}