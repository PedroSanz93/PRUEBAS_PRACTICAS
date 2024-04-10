import 'package:apliacionnueva/src/ui/widget/alerta.dart';
import 'package:flutter/material.dart';

class homeAlerta extends StatefulWidget {
  const homeAlerta({
    super.key,
  });

  @override
  State<homeAlerta> createState() => _homeAlertaState();
}

class _homeAlertaState extends State<homeAlerta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: alerta(),
    );
  }
}
