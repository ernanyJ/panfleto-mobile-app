import 'package:flutter/material.dart';
import 'package:panfleto_app/data/model/market_model.dart';
import 'package:panfleto_app/pages/home/market/widgets/market_tile_image_widget.dart';
import 'package:panfleto_app/pages/market_details/market_details_page.dart';

class MarketListTileWidget extends StatelessWidget {
  const MarketListTileWidget(
    this.market, {
    super.key,
  });

  final MarketModel market;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MarketDetailsPage(market),
                ),
              );
            },
            leading: MarketTileImage(market.imgUrl),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: Colors.grey[300],
            title: Text(market.name),
            subtitle: Text(market.address),
            trailing: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 32),
                Text('0.0km'),
              ],
            )),
      ),
    );
  }
}
