import 'package:apliacionnueva/src/ui/views/home_alerta.dart';
import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final GlobalKey<FormState> _formularioEstado = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Form(
            key: _formularioEstado,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.pinkAccent)),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // Revisamos si el valor es nulo o está vacío
                        return "Este campo no puede estar vacio";
                      }

                      return null; // si no falla
                    },
                    decoration: InputDecoration(
                        hintText: "Nombre", border: InputBorder.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.pinkAccent)),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // Revisamos si el valor es nulo o está vacío
                        return "Este campo no puede estar vacio";
                      }

                      return null; // si no falla
                    },
                    decoration: InputDecoration(
                        hintText: "Apellido", border: InputBorder.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.pinkAccent)),
                  child: TextFormField(
                    validator: (value) {
                      if (!value!.contains("@")) {
                        return "El correo no es valido, fala la '@'";
                      }
                      return null; // si no falla
                    },
                    decoration: InputDecoration(
                        hintText: "Correo", border: InputBorder.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.pinkAccent)),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.length < 6) {
                        return "La contraseña debe tener almenos 6 caracteres";
                      }
                      return null; // Todo ha ido bien
                    },
                    decoration: InputDecoration(
                        hintText: "Contraseña", border: InputBorder.none),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formularioEstado.currentState!.validate()) {
                        print("Todo bien");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => homeAlerta()));
                      } else {
                        print("Hay errores en el formulario");
                      }
                    },
                    child: Text("Enviar"),

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.pinkAccent[100]!),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white),
                    ),

                  ),
                )
              ],
            )));
  }
}
