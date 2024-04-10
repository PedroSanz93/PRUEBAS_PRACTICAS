import '../APIUtils.dart';

class TMDataBaseAPI {
  final String apiKey = '0b0733d9bb06f7987173c6cf01ec8a3a';
  final String baseUrl="https://api.themoviedb.org/3/";

  Future<Map<String, dynamic>?> searchMovie(String query) async {
    var apiUrl =
        '${baseUrl}search/movie?api_key=$apiKey&query=$query';
    var api = APIUtils(url: apiUrl);
    return await api.call();
  }

}