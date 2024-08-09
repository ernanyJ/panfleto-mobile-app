import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panfleto_app/utils/consts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: homeBody(),
      ),
    );
  }

  Widget homeBody() {
    return Padding(
      padding: defaultPad,
      child: Column(
        children: [
          Container(
            width: 284,
            height: 134,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  //👋
                  'Olá!',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(width: 5),
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: Image(
                      image: AssetImage('assets/images/hand-wave-emoji.png')),
                )
              ],
            ),
            // USER ADDRESS DATA
            const Row(
              children: [
                Icon(Icons.location_on, size: 15),
                SizedBox(width: 5),
                Text(
                  'R. Rubem Moura, 289',
                  style: TextStyle(fontSize: 15),
                )
              ],
            )
          ],
        ),
      ),
      // FAVORITES AND SETTINGS BUTTONS
      actions: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
            icon: const Icon(Icons.favorite_outline, size: 25),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
            icon: const Icon(Icons.settings_outlined, size: 25),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
