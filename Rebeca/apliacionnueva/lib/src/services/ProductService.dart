import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/movies/TMDbAPI.dart';

class MovieService {
  final TMDataBaseAPI tmDataBaseAPI;
  final String apiKey;

  MovieService(this.tmDataBaseAPI, this.apiKey);
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String searchEndpoint = '/search/movie';
  final String listEndpoint = '/movie/popular';

  Future<List<Map<String, dynamic>>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl$searchEndpoint?api_key=$apiKey&query=$query'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey('results')) {
        return List<Map<String, dynamic>>.from(data['results']);
      }
    }

    throw Exception('Failed to search movies');
  }

  Future<List<Map<String, dynamic>>> listMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl$listEndpoint?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey('results')) {
        return List<Map<String, dynamic>>.from(data['results']);
      }
    }

    throw Exception('Failed to list movies');
  }

  Future<Map<String, dynamic>> createMovie(Map<String, dynamic> movie) async {
    final response = await http.post(
      Uri.parse('$baseUrl$searchEndpoint?api_key=$apiKey'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(movie),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create movie');
    }
  }

  Future<Map<String, dynamic>> updateMovie(String id, Map<String, dynamic> updatedData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/search/movie/$id?api_key=$apiKey'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(updatedData),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update movie');
    }
  }

  Future<void> deleteMovie(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/search/movie/$id?api_key=$apiKey'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete movie');
    }
  }
}
