import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panfleto_app/pages/home/home_page.dart';
import 'package:panfleto_app/pages/market_details/state/favorites_state.dart';
import 'package:provider/provider.dart';

import 'utils/consts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesState()..init()),
      ],
      child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.robotoTextTheme(),
            colorSchemeSeed: mainColor,
          ),
          debugShowCheckedModeBanner: false,
          home: const Homepage()),
    );
  }
}
