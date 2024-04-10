import 'dart:convert';

import '../APIUtils.dart';
import 'package:http/http.dart' as http;

class NBADataAPI {
  final String apiKey = '1ca988eb2266d46e1937b57cc2410d31';
  final String baseUrl = "https://v2.nba.api-sports.io";

  Future<Map<String, dynamic>?> searchNBA() async {
    var headers = {
      'x-rapidapi-host': 'v2.nba.api-sports.io',
      'x-rapidapi-key': apiKey,
    };

    var apiUrl = '$baseUrl/teams';
    var request = http.Request('GET', Uri.parse(apiUrl));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> decodedResponse = json.decode(responseBody);
      print("Conexion OK");
      return decodedResponse;
    } else {
      print('Request failed with status: ${response.statusCode}');
      print("Conexion MAL");
      return null;
    }
  }
}
