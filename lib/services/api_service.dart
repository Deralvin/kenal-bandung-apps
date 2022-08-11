import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseurl;
  final client = http.Client();
  ApiService({required this.baseurl});

  Future<dynamic> getWisataBelanja() async {
    try {
      final uri = Uri.parse("${baseurl}wisata");
      print(uri);
      final resp = await client.get(uri);
      return jsonDecode(resp.body);
    } catch (e) {
      return {"status": 500, "message": "error $e"};
    }
  }
}
