import 'package:shared_preferences/shared_preferences.dart';

class PersistenceService {
  static const _addressKey = 'user_address';

  static const _latitudeKey = 'latitude';

  static const _longitudeKey = 'longitude';

  // Função para salvar a latitude
  static Future<void> saveLatitude(double latitude) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_latitudeKey, latitude);
  }

  // Função para carregar a latitude
  static Future<double?> getLatitude() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_latitudeKey);
  }

  // Função para salvar a longitude
  static Future<void> saveLongitude(double longitude) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_longitudeKey, longitude);
  }

  // Função para carregar a longitude
  static Future<double?> getLongitude() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_longitudeKey);
  }

  // Função para salvar o endereço
  static Future<void> saveAddress(String address) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_addressKey, address);
  }

  // Função para carregar o endereço
  static Future<String?> getAddress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_addressKey);
  }

  static Future<void> clearAddress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_addressKey);
  }
}
