import 'package:flutter/material.dart';

class TitleCard extends StatefulWidget {
  const TitleCard({
    Key? key,
    required this.textStyle,
  }) : super(key: key);

  final TextStyle textStyle;

  @override
  _TitleCardState createState() => _TitleCardState();
}

class _TitleCardState extends State<TitleCard> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Utiliza un IconButton para el botón "Me gusta"
        Stack(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _liked = !_liked; // Cambia el estado de "_liked"
                });
              },
              icon: Text("Me gusta",style: widget.textStyle,),// Icono de "Me gusta"
            ),
            if (_liked) // Muestra el icono de corazón si "_liked"
              Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
          ],
        ),
        TextButton(
          onPressed: () {
            // Lógica cuando se presiona "Comentar"
          },
          child: Text(
            "Comentar",
            style: widget.textStyle,
          ),
        ),
        TextButton(
          onPressed: () {
            // Lógica cuando se presiona "Compartir"
          },
          child: Text(
            "Compartir",
            style: widget.textStyle,
          ),
        ),
      ],
    );
  }
}
