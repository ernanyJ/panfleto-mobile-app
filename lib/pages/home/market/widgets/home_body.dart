import 'package:flutter/material.dart';
import 'package:panfleto_app/pages/home/market/state/home_market_state.dart';
import 'package:panfleto_app/pages/home/market/widgets/categories_tab_widget.dart';
import 'package:panfleto_app/pages/home/market/widgets/paid_banner_widget.dart';
import 'package:panfleto_app/utils/consts.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeState(),
          
        ),
      ],
      child: const Padding(
        padding: defaultPad,
        child: Column(
          children: [
            PaidBannerWidget(),
            SizedBox(height: 20),
            CategoriesTabWidget(),
          ],
        ),
      ),
    );
  }
}
