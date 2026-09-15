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

    loja.adicionar(
      Produto(
        nome: 'Mouse Delux m900 Pro',
        quantidade: 15,
        preco: 249.90,
        dataLancamento: DateTime(2026, 2, 20),
        imagemUrl: 'https://th.bing.com/th/id/OIP.D8qK-MhPH437B9qZ7JKQCAHaHa?w=207&h=207&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
      ),
    );
    loja.adicionar(
      Produto(
        nome: 'Aula F75 Max',
        quantidade: 12,
        preco: 299.90,
        dataLancamento: DateTime(2025, 12, 10),
        imagemUrl: 'https://th.bing.com/th/id/OIP.EgUEUTxisYp5ZOsH-Kpb9wHaHa?w=191&h=192&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
      ),
    );
    loja.adicionar(
      Produto(
        nome: 'Mchose v9 Pro',
        quantidade: 10,
        preco: 199.90,
        dataLancamento: DateTime(2025, 1, 17),
        imagemUrl: 'https://th.bing.com/th/id/OIP.cVig22izOujkxG9F2EOTpQHaHa?w=202&h=202&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
      ),
    );
    loja.adicionar(
      Produto(
        nome: 'Mousepad Speed XL',
        quantidade: 20,
        preco: 89.90,
        dataLancamento: DateTime(2024, 11, 5),
        imagemUrl: 'https://th.bing.com/th/id/OIP.It87AHRYoPVuNh8t-k3GJgAAAA?w=198&h=198&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
      ),
    );
    loja.adicionar(
      Produto(
        nome: 'Headset Gamer 7.1',
        quantidade: 8,
        preco: 119.90,
        dataLancamento: DateTime(2025, 3, 1),
        imagemUrl: 'https://th.bing.com/th/id/OIP.k4nTsXwyRu2Yd03dKIDOAAHaHa?w=203&h=203&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
      ),
    );
    loja.adicionar(
      Produto(
        nome: 'Suporte Headset RGB',
        quantidade: 14,
        preco: 79.90,
        dataLancamento: DateTime(2024, 9, 15),
        imagemUrl: 'https://th.bing.com/th/id/OIP.CNe5C5PNihhU29maUmgYbAHaHa?w=199&h=199&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
      ),
    );
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