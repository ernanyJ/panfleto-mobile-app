import 'package:shared_preferences/shared_preferences.dart';

class PersistenceService {
  static const _addressKey = 'user_address';

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
