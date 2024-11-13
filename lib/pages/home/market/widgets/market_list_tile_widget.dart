import 'package:flutter/material.dart';
import 'package:panfleto_app/core/location_service.dart';
import 'package:panfleto_app/data/model/market_model.dart';
import 'package:panfleto_app/pages/home/market/widgets/market_tile_image_widget.dart';
import 'package:panfleto_app/pages/market_details/market_details_page.dart';

class MarketListTileWidget extends StatefulWidget {
  const MarketListTileWidget(
    this.market, {
    super.key,
  });

  final MarketModel market;

  @override
  State<MarketListTileWidget> createState() => _MarketListTileWidgetState();
}

class _MarketListTileWidgetState extends State<MarketListTileWidget> {
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
                  builder: (context) => MarketDetailsPage(
                    widget.market,
                  ),
                ),
              );
            },
            leading: Hero(
              tag: 'marketImage${widget.market.id}',
              child: MarketTileImage(widget.market.imgUrl),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: Colors.grey[300],
            title: Text(widget.market.name),
            subtitle: FutureBuilder<String>(
              future: LocationService().getMarketAddress(
                  widget.market.latitude, widget.market.longitude),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Carregando endereço...');
                } else if (snapshot.hasError) {
                  return const Text('Erro ao carregar endereço');
                } else {
                  return Text(
                      overflow: TextOverflow.ellipsis,
                      snapshot.data ?? 'Endereço não disponível');
                }
              },
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 32),
                FutureBuilder<double>(
                  future: LocationService.calculateDistance(widget.market),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Carregando...');
                    } else if (snapshot.hasError) {
                      return const Text('Error');
                    } else {
                      return Text('${snapshot.data?.toStringAsFixed(2)} km');
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }
}
