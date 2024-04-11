import 'dart:convert'; // Importa la librería para codificar y decodificar JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/Gif.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

// Clase para el estado de la página de búsqueda
class _SearchPageState extends State<SearchPage> {
  late Future<List<Gif>> _listadoGifs; // Future para almacenar la lista de GIFs
  TextEditingController _searchController =
      TextEditingController(); // Controlador para manejar el texto de búsqueda

  Future<List<Gif>> _getGifs(String query) async {
    final response = await http.get(Uri.parse(
        "https://api.giphy.com/v1/gifs/search?api_key=5HJviIcdwso37WnxkNjLrlDHbnAJ6b1p&q=$query&limit=10&offset=0&rating=g&lang=en"));

    List<Gif> gifs = [];

    if (response.statusCode == 200) {
      String body = utf8
          .decode(response.bodyBytes); // Decodifica el cuerpo de la respuesta
      final jsonData = jsonDecode(body); // Decodifica el JSON

      // Itera sobre los datos de los GIFs
      for (var item in jsonData["data"]) {
        gifs.add(Gif(
            item["title"],
            item["images"]["original"]
                ["url"])); // Agrega un nuevo GIF a la lista
      }
      return gifs;
    } else {
      throw Exception("Fallo de conexión");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoGifs = _getGifs('all');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false, // Esto oculta el botón de ir atrás

        title: TextField(
          controller:
              _searchController, // Asigna el controlador al campo de texto
          decoration: InputDecoration(
            hintText: 'Buscar GIFs...',
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            _searchGifs(value); // Cuando se envía la búsqueda
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _searchGifs(_searchController.text);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _listadoGifs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Muestra un indicador de carga si los GIFs están siendo cargados
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    "ERROR: ${snapshot.error}")); // Muestra un mensaje de error
          } else {
            return GridView.count(
              crossAxisCount: 2, // Número de columnas en la cuadrícula
              children: _listGifs(snapshot.data
                  as List<Gif>), // Muestra los GIFs en una cuadrícula
            );
          }
        },
      ),
    );
  }

  void _searchGifs(String query) {
    setState(() {
      _listadoGifs =
          _getGifs(query); // Actualiza la lista de GIFs con la nueva consulta
    });
  }

  List<Widget> _listGifs(List<Gif> data) {
    List<Widget> gifs = [];

    for (var gif in data) {
      gifs.add(Card(
        child: Column(
          children: [
            Expanded(
                child: Image.network(gif.url,
                    fit: BoxFit.fill)), // Muestra el GIF como una imagen
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  gif.name), // Muestra el nombre del GIF debajo de la imagen
            ),
          ],
        ),
      ));
    }
    return gifs;
  }
}
