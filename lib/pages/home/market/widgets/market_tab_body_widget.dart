import 'package:flutter/material.dart';
import 'package:panfleto_app/enum/loading_state.dart';
import 'package:panfleto_app/pages/home/market/state/home_market_state.dart';
import 'package:panfleto_app/pages/home/market/widgets/market_list_tile_widget.dart';
import 'package:provider/provider.dart';

class MarketTabBody extends StatelessWidget {
  const MarketTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context);

    return state.loadingState == LoadingState.loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            width: double.infinity,
            height: 100,
            child: RefreshIndicator(
              onRefresh: () async {
                await state.getMarkets();
              },
              child: ListView.builder(
                itemCount: state.marketList.length,
                itemBuilder: (context, index) {
                  final market = state.marketList[index];
                  return MarketListTileWidget(
                    market
                  );
                },
              ),
            ),
          );
  }
}
