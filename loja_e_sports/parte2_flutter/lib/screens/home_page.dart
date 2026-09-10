import 'package:flutter/material.dart';
import '../models/loja.dart';
import '../models/produto.dart';
import 'widgets/cartao.dart';
import 'detalhe_page.dart';
import 'cadastro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Loja loja;

  @override
  void initState() {
    super.initState();
    loja = Loja(nome: 'Loja E-Sports');
    loja.adicionar(Produto(nome: 'Mouse Delux m900 Pro', quantidade: 15, preco: 249.90, dataLancamento: DateTime(2026, 2, 20)));
    loja.adicionar(Produto(nome: 'Aula F75 Max', quantidade: 12, preco: 299.90, dataLancamento: DateTime(2025, 12, 10)));
    loja.adicionar(Produto(nome: 'Mchose v9 Pro', quantidade: 10, preco: 199.90, dataLancamento: DateTime(2025, 1, 17)));
    loja.adicionar(Produto(nome: 'Mousepad Speed XL', quantidade: 20, preco: 89.90, dataLancamento: DateTime(2024, 11, 5)));
    loja.adicionar(Produto(nome: 'Headset Gamer 7.1', quantidade: 8, preco: 349.90, dataLancamento: DateTime(2025, 3, 1)));
    loja.adicionar(Produto(nome: 'Suporte Headset RGB', quantidade: 14, preco: 79.90, dataLancamento: DateTime(2024, 9, 15)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loja.nome),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.indigo.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total de Unidades em Estoque:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${loja.totalUnidades}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: loja.produtos.length,
              itemBuilder: (context, index) {
                final produto = loja.produtos[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetalhePage(produto: produto),
                      ),
                    );
                  },
                  child: Cartao(produto: produto),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () async {
          final novoProduto = await Navigator.of(context).push<Produto>(
            MaterialPageRoute(builder: (context) => const CadastroPage()),
          );

          if (novoProduto != null) {
            setState(() {
              loja.adicionar(novoProduto);
            });
          }
        },
      ),
    );
  }
}