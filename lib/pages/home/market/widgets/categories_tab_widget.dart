import 'package:flutter/material.dart';
import 'package:panfleto_app/pages/home/market/state/home_market_state.dart';
import 'package:panfleto_app/pages/home/market/widgets/market_tab_body_widget.dart';
import 'package:provider/provider.dart';

class CategoriesTabWidget extends StatefulWidget {
  const CategoriesTabWidget({super.key});

  @override
  State<CategoriesTabWidget> createState() => _CategoriesTabWidgetState();
}

class _CategoriesTabWidgetState extends State<CategoriesTabWidget>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeState>().getMarkets();
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.green,
            tabs: const [
              Tab(text: 'Mercados'),
              Tab(text: 'Ofertas'),
              Tab(text: 'Produtos')
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: TabBarView(
            controller: _tabController,
            children: const [
              MarketTabBody(),
              Text('Person'),
              Text('Person'),
            ],
          ),
        ),
      ],
    );
  }
}
