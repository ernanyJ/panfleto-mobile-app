import 'package:flutter/material.dart';
import 'package:panfleto_app/pages/home/market/state/home_market_state.dart';
import 'package:provider/provider.dart';

class PaidBannerWidget extends StatelessWidget {
  const PaidBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context);
    return GestureDetector(
      onTap: () async {
        state.getMarkets();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.80,
        height: MediaQuery.of(context).size.height * 0.20,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
