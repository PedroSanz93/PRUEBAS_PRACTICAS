import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class alerta extends StatefulWidget {
  const alerta({Key? key}) : super(key: key);

  @override
  State<alerta> createState() => _alertaState();
}

class _alertaState extends State<alerta> {
  bool _susbscrito = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 50,left: 15,right: 15),
              children: [
                Center(
                  child: const Text(
                    "Términos y condiciones",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Este boton te pide que aceptes o no los terminos y condiciones, y no te dejara salir hasta que no selecciones una. El texto de abajo se modifica según tu elección",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 15),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    _mostrarAlerta(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Leer términos y condiciones",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      Icon(
                        Icons.read_more,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  _susbscrito ? "Subscrito" : "No subscrito",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),

            child: SizedBox(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enviar",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    Icon(
                      Icons.outbond_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_susbscrito
              ? "Has aceptado los términos y condiciones"
              : 'No has aceptado los términos y condiciones'),
          content: Text(
            _susbscrito
                ? "¿Quiere cancelar aceptar los términos y condiciones?"
                : '¿Seguro que quieres aceptarlas?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _susbscrito = false;
                });
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _susbscrito = !_susbscrito;
                });
                Navigator.pop(context);
              },
              child: const Text("Sí"),
            )
          ],
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: alerta(),
    );
  }
}
