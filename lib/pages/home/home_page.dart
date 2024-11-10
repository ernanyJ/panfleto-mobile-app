import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panfleto_app/core/location_service.dart';
import 'package:panfleto_app/core/persistence_service.dart';
import 'package:panfleto_app/enum/loading_state.dart';
import 'package:panfleto_app/pages/home/market/widgets/home_body.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  LoadingState _loadingState = LoadingState.loading;
  @override
  Widget build(BuildContext context) {
    checkAddressExists(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
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
              InkWell(
                onTap: () async {
                  PersistenceService.clearAddress();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Row(
                            children: [
                              Text('Localização'),
                              Spacer(),
                              Icon(Icons.location_on, size: 20),
                            ],
                          ),
                          content: FutureBuilder<String?>(
                            future: PersistenceService.getAddress(),
                            builder: (context, snapshot) {
                              return TextField(
                                decoration: InputDecoration(
                                  hintText:
                                      snapshot.data ?? 'Digite seu endereço',
                                ),
                              );
                            },
                          ),
                        );
                      });
                },
                child: Row(
                  children: [
                    const Icon(Icons.location_on, size: 15),
                    const SizedBox(width: 5),
                    FutureBuilder<String?>(
                      future: PersistenceService.getAddress(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text(
                            'Loading...',
                            style: TextStyle(fontSize: 15),
                          );
                        } else if (snapshot.hasError) {
                          return const Text(
                            'Error',
                            style: TextStyle(fontSize: 15),
                          );
                        } else {
                          return Text(
                            snapshot.data ?? 'Sem endereço',
                            style: const TextStyle(fontSize: 15),
                          );
                        }
                      },
                    )
                  ],
                ),
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
      ),
      body: const Center(
        child: HomeBody(),
      ),
    );
  }

  void checkAddressExists(BuildContext context) {
    bool isLoading = false;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? address = await PersistenceService.getAddress();
      if (address == null || address.isEmpty) {
        showDialog(
          context: context.mounted ? context : context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Localização'),
              content: const Text('Deseja fornecer sua localização?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Não, obrigado'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Prover localização'),
                  onPressed: () {
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                    LocationService.getLocation().then((value) {
                      if (value != null) {
                        PersistenceService.saveAddress(value);
                        setState(() {
                          
                        });
                      }
                    });
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }
}
