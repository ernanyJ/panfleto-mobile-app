import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseDataSource {
  final _url = 'http://192.168.1.6:8080/api/';
  // final _url = 'localhost:8080/api/';
  Future<dynamic> get(String path) async {

    final response = await http.get(Uri.parse(_url + path));
    final decodedBody = utf8.decode(response.bodyBytes);
    print(decodedBody);
    return jsonDecode(decodedBody);
  }
}
