import 'package:flutter/material.dart';

import 'home_feed.dart';
import 'HomePage.dart';
import '../widget/formulario.dart';

class user extends StatefulWidget {
  const user({Key? key});
  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  margin: EdgeInsets.only(top: 50, bottom: 20),
                  child: Icon(
                    Icons.person,
                    size: 70,
                  ),
                ),
                const Text(
                  "Rebeca López",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          color: Colors.grey[100],
                          child: const Text("Inicio"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                         // Navigator.push(
                           // context,
                            //MaterialPageRoute(
                              //builder: (context) => Tienda(),
                            //),
                         // );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 2),
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          color: Colors.grey[100],
                          child: const Text("Tienda"),
                        ),
                      ),
                      Expanded(child: Container()), // Espacio flexible para que "Salir" este abajo

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Formulario(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          color: Colors.pink[100],
                          alignment: Alignment.center,
                          child: const Text(
                            "Salir",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(),
        body: Container(
          child: feed(),
        ),
      ),
    );
  }
}
