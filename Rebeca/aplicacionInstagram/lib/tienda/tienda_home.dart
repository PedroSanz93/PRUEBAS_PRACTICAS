import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'imagen_tienda.dart';
import 'images.dart';


class TiendaHome extends StatefulWidget {
  const TiendaHome({super.key});

  @override
  State<TiendaHome> createState() => _TiendaHomeState();
}

class _TiendaHomeState extends State<TiendaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, // Esto oculta el botón de ir atrás

      ),
      body: GridView.extent(
        maxCrossAxisExtent: 250.0,
        padding: const EdgeInsets.all(5.0),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        children: _imagesList,
      ),
    );
  }

  List<Widget> get _imagesList {
    List<Widget> _listImages = [];
    for (var image in images) {
      _listImages.add(GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> ImagenTienda(url:  image
          )));
        },
        child: Hero(
          tag: image,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ));
    }
    return _listImages;
  }
}
