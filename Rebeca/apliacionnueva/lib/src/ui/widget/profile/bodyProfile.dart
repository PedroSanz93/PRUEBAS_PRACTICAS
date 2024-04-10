import 'package:flutter/material.dart';

import 'ScroolHistorias.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Alinea el Row al principio
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left:
                        10.0), // Añade un poco de espacio a la izquierda del icono
                child: Icon(
                  Icons.account_circle,
                  size: 110,
                  color: Colors.pink[50],
                ),
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "3",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " 1064",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " 840",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text("Publicaciones"),
              Text("Seguidores"),
              Text("Seguidos")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 300,
                
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      foregroundColor: 
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: const Text("Editar")),
              ),
            ],
          ),
          const HorizontalListView(),
        ],
      ),
    );
  }
}