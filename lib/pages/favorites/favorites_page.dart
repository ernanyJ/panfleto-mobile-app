import 'package:flutter/material.dart';
import 'package:panfleto_app/enum/loading_state.dart';
import 'package:panfleto_app/pages/market_details/state/favorites_state.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesState()..init(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Ofertas'),
                Tab(text: 'Mercados'),
                Tab(text: 'Produtos'),
              ],
            ),
            title: const Text('Favoritos'),
          ),
          body: Builder(builder: (context) {
            final state = Provider.of<FavoritesState>(context);
            return state.loadingState == LoadingState.loaded
                ? TabBarView(
                    children: [
                      ListView.separated(
                        itemBuilder: (context, index) {
                          return const ListTile(
                            title: Text('Oferta'),
                            subtitle: Text('Descrição da oferta'),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: state.favoriteOffers.length,
                      ),
                      const Center(child: Text('Mercados')),
                      const Center(child: Text('Produtos')),
                    ],
                  )
                : const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}
