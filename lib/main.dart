import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panfleto_app/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            colorSchemeSeed: const Color.fromARGB(255, 44, 162, 100)),
        debugShowCheckedModeBanner: false,
        home: const Homepage());
  }
}
