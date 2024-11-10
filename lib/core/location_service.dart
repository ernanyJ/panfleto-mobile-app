import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;

class LocationService {
  // Verifica se a permissão foi concedida
  static Future<String?> getLocation() async {
    final loc.Location location = loc.Location();
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;

    // Verifica se o serviço de localização está ativado
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print('Serviço de localização não habilitado.');
        return null;
      }
    }

    // Verifica as permissões de localização
    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        print('Permissão de localização negada.');
        return null;
      }
    }

    // Obtém a localização
    final loc.LocationData locationData = await location.getLocation();
    return getAddress(locationData.latitude!, locationData.longitude!);

  }

  static Future<String> getAddress(double latitude, double longitude) async {
    try {
      // Obtém a lista de placemarks a partir das coordenadas
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

      // Se houver algum resultado, pega o primeiro
      Placemark place = placemarks[0];
      

      // Monta o endereço completo
      String address = '${place.street}, ${place.name}';
      return address;
    } catch (e) {
      print('Erro ao obter o endereço: $e');
      return 'Endereço não disponível';
    }
  }


}

