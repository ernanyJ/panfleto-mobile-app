import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:panfleto_app/core/location_service.dart';
import 'package:panfleto_app/core/persistence_service.dart';
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
            leading: MarketTileImage(widget.market.imgUrl),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: Colors.grey[300],
            title: Text(widget.market.name),
            subtitle: FutureBuilder<String>(
              future: getMarketAddress(
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
                  future: calculateDistance(widget.market),
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

Future<double> calculateDistance(MarketModel market) async {
  final userLat = await PersistenceService.getLatitude();
  final userLong = await PersistenceService.getLongitude();
  final marketLat = double.tryParse(market.latitude);
  final marketLong = double.tryParse(market.longitude);

  if (userLat == null ||
      userLong == null ||
      marketLat == null ||
      marketLong == null) {
    return 0;
  }

  return Geolocator.distanceBetween(userLat, userLong, marketLat, marketLong) /
      1000;
}

Future<String> getMarketAddress(String latitude, String longitude) async {
  if (latitude.isEmpty || longitude.isEmpty) {
    return 'Endereço não disponível';
  }
  return await LocationService.getAddress(
      double.tryParse(latitude) ?? 0, double.tryParse(longitude) ?? 0);
}
