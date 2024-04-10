import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/Gif.dart';

class api extends StatefulWidget {
  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  late Future<List<Gif>> _listadoGifs;

  Future<List<Gif>> _getGifs() async {
    final response = await http.get(Uri.parse(
        "https://api.giphy.com/v1/gifs/trending?api_key=5HJviIcdwso37WnxkNjLrlDHbnAJ6b1p&limit=10&offset=0&rating=g&bundle=messaging_non_clips"));

    List<Gif> gifs = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      for (var item in jsonData["data"]) {
        gifs.add(Gif(item["title"], item["images"]["original"]["url"]));
      }
      return gifs;
    } else {
      throw Exception("Fallo de conexion");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoGifs = _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(),
            body: FutureBuilder(
              future: _listadoGifs,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return GridView.count(
                    crossAxisCount: 2,
                    children: _listGifs(snapshot.data ?? []),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error); // Mostrar error específico
                  return const Text("ERROR ");
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )));
  }

  List<Widget> _listGifs(List<Gif> data) {
    List<Widget> gifs = [];

    for (var gif in data) {
      gifs.add(Card(
          child: Column(
        children: [
          Expanded(child: Image.network(gif.url, fit: BoxFit.fill)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(gif.name),
          ),
        ],
      )));
    }
    return gifs;
  }
}
