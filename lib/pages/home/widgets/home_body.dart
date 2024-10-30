import 'package:flutter/material.dart';
import 'package:panfleto_app/pages/home/widgets/categories_tab_widget.dart';
import 'package:panfleto_app/pages/home/widgets/paid_banner_widget.dart';
import 'package:panfleto_app/utils/consts.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: defaultPad,
      child: Column(
        children: [
          PaidBannerWidget(),
          SizedBox(height: 20),
          CategoriesTabWidget(),
        ],
      ),
    );
  }
}
