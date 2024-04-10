import 'package:aplicacioninstagram/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro',
      home: HomeScreen(),
    );
  }
}
