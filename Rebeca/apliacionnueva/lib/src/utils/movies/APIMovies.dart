import 'package:flutter/material.dart';
import '../../services/ProductService.dart';

import 'TMDbAPI.dart';

class Pagina3 extends StatelessWidget {
  const Pagina3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tmDataBaseAPI = TMDataBaseAPI();
    final apiKey ='0b0733d9bb06f7987173c6cf01ec8a3a';

    final movieService = MovieService(tmDataBaseAPI,apiKey);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "API Movie",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Rated Movies'),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: movieService.listMovies(),
          builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final movies = snapshot.data;
              if (movies != null && movies.isNotEmpty) {
                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = movies[index];
                    return ListTile(
                      leading: movie['poster_path'] != null
                          ? Image.network(
                        'https://image.tmdb.org/t/p/w200${movie['poster_path']}',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                          : Icon(Icons.image_not_supported),
                      title: Text(movie['title']),
                      subtitle: Text(movie['overview']),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('No se encontraron películas'),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
