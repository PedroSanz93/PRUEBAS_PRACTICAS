import 'package:flutter/material.dart';

import '../widget/formulario.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('R E G I S T R O')),foregroundColor: Colors.white,

        backgroundColor: Colors.pinkAccent[100],
      ),
      body: Formulario(),
    );
  }
}
