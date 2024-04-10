import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/NBA/NBADataAPI.dart';

class NbaServices {
  final NBADataAPI tmDataBaseAPI;
  final String apiKey;

  NbaServices(this.tmDataBaseAPI, this.apiKey);
  final String baseUrl = 'https://v2.nba.api-sports.io';
  final String searchEndpoint = '/teams';
  Future<Map<String, dynamic>?> searchNBA() async {
    var headers = {
      'x-rapidapi-host': 'v2.nba.api-sports.io',
      'x-rapidapi-key': apiKey,
    };

    var apiUrl = '$baseUrl/teams';
    var request = http.Request('GET', Uri.parse(apiUrl));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print('Status Code: ${response.statusCode}');
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> decodedResponse = json.decode(responseBody);
      return decodedResponse;
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> listTeams() async {
    final response = await http.get(
      Uri.parse('$baseUrl$searchEndpoint'),
    );

    print('Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey('response')) {
        return List<Map<String, dynamic>>.from(data['response']);
      }
    }

    print('Failed to list teams');
    throw Exception('Failed to list teams');
  }
}
