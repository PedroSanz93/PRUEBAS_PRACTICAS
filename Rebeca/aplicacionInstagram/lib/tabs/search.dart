import 'package:flutter/material.dart';

import '../tienda/tienda_home.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Esto oculta el botón de ir atrás

        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Lógica para manejar la búsqueda
                print('Búsqueda realizada');
              },
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      body: const TiendaHome(),
    );
  }
}
