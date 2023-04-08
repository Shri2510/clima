import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkManager {
  final String apiUrl;
  NetworkManager(this.apiUrl);
  Future getData() async {
    final Uri url = Uri.parse(apiUrl);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
