import 'package:flutter/material.dart';

class CategoriesTabWidget extends StatelessWidget {
  const CategoriesTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3, // Defina o número de abas
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.green, // Cor da linha embaixo da aba selecionada
            labelColor: Colors.black, // Cor do texto da aba selecionada
            unselectedLabelColor: Colors.grey, // Cor do texto das abas não selecionadas
            tabs: [
              Tab(text: 'Mercados'),
              Tab(text: 'Ofertas'),
              Tab(text: 'Produtos'),
            ],
          ),
          SizedBox(
            height: 200, // Defina a altura desejada para o conteúdo das abas
            child: TabBarView(
              children: [
                Center(child: Text('Conteúdo de Super-mercados')),
                Center(child: Text('Conteúdo de Ofertas')),
                Center(child: Text('Conteúdo de Produtos')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
