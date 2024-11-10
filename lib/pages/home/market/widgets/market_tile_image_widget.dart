import 'package:flutter/material.dart';

class MarketTileImage extends StatelessWidget {
  const MarketTileImage(
    this.imgUrl, {
    super.key,
  });

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 60,
          height: 60,
          color: Colors.transparent,
          child: (imgUrl.isNotEmpty &&
                  Uri.tryParse(imgUrl)?.hasAbsolutePath == true)
              ? Image.network(imgUrl)
              : const Center(child: Text('N/A')),
        ));
  }
}
