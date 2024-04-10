import 'package:aplicacioninstagram/tienda/tienda_home.dart';
import 'package:flutter/material.dart';
class Tienda extends StatelessWidget {
  const Tienda({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: TiendaHome()
    );
  }
}