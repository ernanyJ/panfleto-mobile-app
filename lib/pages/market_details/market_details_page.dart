import 'package:flutter/material.dart';
import 'package:panfleto_app/core/location_service.dart';
import 'package:panfleto_app/data/enum/category.dart';
import 'package:panfleto_app/data/model/market_model.dart';
import 'package:panfleto_app/pages/market_details/state/category_market_content_state.dart';
import 'package:panfleto_app/pages/market_details/state/favorites_state.dart';
import 'package:provider/provider.dart';

class MarketDetailsPage extends StatelessWidget {
  const MarketDetailsPage(this.market, {super.key});

  final MarketModel market;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CategoryMarketContentState()..init(market.id)),
       
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.2,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // imagem do m
                          // ercado
                          Hero(
                            tag: 'marketImage${market.id}',
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child:
                                  ClipOval(child: Image.network(market.imgUrl)),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  market.name,
                                  softWrap: true,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              FutureBuilder<String>(
                                future: LocationService().getMarketAddress(
                                    market.latitude, market.longitude),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text('Carregando endereço...');
                                  } else if (snapshot.hasError) {
                                    return const Text(
                                        'Erro ao carregar endereço');
                                  } else {
                                    return SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                          overflow: TextOverflow.clip,
                                          snapshot.data ??
                                              'Endereço não disponível'),
                                    );
                                  }
                                },
                              ),
                              FutureBuilder<double>(
                                future:
                                    LocationService.calculateDistance(market),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text(
                                        'Calculando distância...');
                                  } else if (snapshot.hasError) {
                                    return const Text(
                                        'Erro ao calcular distância');
                                  } else {
                                    return Text(
                                        '${snapshot.data?.toStringAsFixed(2) ?? '0.00'} km');
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title:
                                        const Text('Horário de funcionamento'),
                                    content: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.21,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Segunda-feira: ${formatTime(market.openingTimeMonday, market.closingTimeMonday)}',
                                          ),
                                          Text(
                                            'Terça-feira: ${formatTime(market.openingTimeTuesday, market.closingTimeTuesday)}',
                                          ),
                                          Text(
                                            'Quarta-feira: ${formatTime(market.openingTimeWednesday, market.closingTimeWednesday)}',
                                          ),
                                          Text(
                                            'Quinta-feira: ${formatTime(market.openingTimeThursday, market.closingTimeThursday)}',
                                          ),
                                          Text(
                                            'Sexta-feira: ${formatTime(market.openingTimeFriday, market.closingTimeFriday)}',
                                          ),
                                          Text(
                                            'Sábado: ${formatTime(market.openingTimeSaturday, market.closingTimeSaturday)}',
                                          ),
                                          Text(
                                            'Domingo: ${formatTime(market.openingTimeSunday, market.closingTimeSunday)}',
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Fechar'),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              child: const Text('Ver horário'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: _CategoriesTabWidget(market),
            ),
          ],
        ),
      ),
    );
  }
}

// MARK: categoria tab
class _CategoriesTabWidget extends StatefulWidget {
  const _CategoriesTabWidget(this.market);

  final MarketModel market;
  @override
  State<_CategoriesTabWidget> createState() => _CategoriesTabWidgetState();
}

class _CategoriesTabWidgetState extends State<_CategoriesTabWidget>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<String> categories = [
    'Ofertas',
    'Todos',
    'Frios',
    'Higiene',
    'Frutas e Legumes',
    'Laticínios'
  ];

  @override
  void initState() {
    _tabController = TabController(length: categories.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.green,
          tabs: categories.map((e) => Tab(text: e)).toList(),
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.65,
          child: TabBarView(
            controller: _tabController,
            children: [
              ...categories.map((element) => CategoryMarketContent(
                    category: element,
                    market: widget.market,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

// MARK: tab content
class CategoryMarketContent extends StatefulWidget {
  const CategoryMarketContent(
      {super.key, required this.category, required this.market});

  final MarketModel market;
  final String category;

  @override
  State<CategoryMarketContent> createState() => _CategoryMarketContentState();
}

class _CategoryMarketContentState extends State<CategoryMarketContent> {
  int currentOfferIndex = 0;

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesState>(context);
    final state = Provider.of<CategoryMarketContentState>(context);
    switch (widget.category) {
      case 'Ofertas':
        return ListView.separated(
          itemCount: widget.market.offers.length,
          itemBuilder: (context, index) {
            currentOfferIndex = index;
            return ListTile(
              title: Text(widget.market.offers[index].title),
              subtitle: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.market.offers[index].includedCategories
                          .map((e) => categoryToString(e))
                          .join(', '),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                  onPressed: () async {
                    favorites.favoriteOffers
                            .contains(widget.market.offers[index].id.toString())
                        ? favorites.removeFavoriteOffer(
                            widget.market.offers[index].id.toString())
                        : favorites.addFavoriteOffer(
                            widget.market.offers[index].id.toString());
                  },
                  icon: favorites.isFavoriteOffer(
                          widget.market.offers[index].id.toString())
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_border)),
              leading: Icon(categoryToIcon(
                  widget.market.offers[index].includedCategories.first)),
              onTap: () {},
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
      case 'Todos':
        return ListView.separated(
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.products[index].productName),
              subtitle:
                  Text('R\$ ${state.products[index].price.toStringAsFixed(2)}'),
              leading: Icon(categoryToIcon(
                  state.products[index].productCategories?.first ??
                      Category.STAPLES)),
              onTap: () {},
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
      case 'Frios':
        final frios = state.products
            .where((product) =>
                product.productCategories?.contains(Category.REFRIGERATED) ??
                false)
            .toList();

        return ListView.separated(
          itemCount: frios.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(frios[index].productName),
              subtitle: Text(frios[index].price.toString()),
              leading: Icon(categoryToIcon(
                  frios[index].productCategories?.first ?? Category.STAPLES)),
              onTap: () {},
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
      case 'Higiene':
        final higiene = state.products
            .where((product) =>
                product.productCategories?.contains(Category.HYGIENE) ?? false)
            .toList();

        return ListView.separated(
          itemCount: higiene.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(higiene[index].productName),
              subtitle: Text(higiene[index].price.toString()),
              leading: Icon(categoryToIcon(
                  higiene[index].productCategories?.first ?? Category.HYGIENE)),
              onTap: () {},
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
      case 'Frutas e Legumes':
        final fruits = state.products
            .where((product) =>
                product.productCategories?.contains(Category.FRUITS) ?? false)
            .toList();

        final vegetables = state.products
            .where((product) =>
                product.productCategories?.contains(Category.VEGETABLES) ??
                false)
            .toList();

        final fav = fruits + vegetables;

        return ListView.separated(
          itemCount: fav.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(fav[index].productName),
              subtitle: Text(fav[index].price.toString()),
              leading: Icon(categoryToIcon(
                  fav[index].productCategories?.first ?? Category.HYGIENE)),
              onTap: () {},
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
    }
    return const SizedBox.shrink();
  }
}

IconData categoryToIcon(Category category) {
  switch (category) {
    case Category.STAPLES:
      return Icons.food_bank;
    case Category.ELECTRONICS:
      return Icons.electrical_services;
    case Category.HYGIENE:
      return Icons.clean_hands;
    case Category.REFRIGERATED:
      return Icons.set_meal;

    case Category.FRUITS:
      return Icons.apple;
    case Category.VEGETABLES:
      return Icons.local_florist;

    case Category.BAKERY:
      return Icons.breakfast_dining;
    case Category.BEVERAGES:
      return Icons.local_bar;
    case Category.LACTIC:
      return Icons.local_drink;
  }
}

String categoryToString(Category category) {
  switch (category) {
    case Category.STAPLES:
      return 'Comidas Básicas';
    case Category.ELECTRONICS:
      return 'Eletrônicos';
    case Category.HYGIENE:
      return 'Higiene';
    case Category.REFRIGERATED:
      return 'Frios';
    case Category.FRUITS:
      return 'Frutas';
    case Category.VEGETABLES:
      return 'Vegetais';
    case Category.BAKERY:
      return 'Padaria';
    case Category.BEVERAGES:
      return 'Bebidas';
    case Category.LACTIC:
      return 'Laticínios';
  }
}

String formatTime(DateTime? openingTime, DateTime? closingTime) {
  return '${hourFormatter(openingTime?.hour ?? 0)}:${hourFormatter(openingTime?.minute ?? 0)} - ${hourFormatter(closingTime?.hour ?? 0)}:${hourFormatter(closingTime?.minute ?? 0)}';
}

String hourFormatter(int value) {
  if (value == 0) {
    return '00';
  }
  return value.toString();
}
