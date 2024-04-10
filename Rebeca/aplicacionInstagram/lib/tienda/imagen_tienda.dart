import 'package:flutter/material.dart';

class ImagenTienda extends StatelessWidget {
  final String url;
  const ImagenTienda({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            IconButton(onPressed: (){
              Navigator.pop(context);
            }
                , icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
            Hero(
                tag:url ,
                child: Image.network(url)),
            const Divider()
          ],
        ),
      ),
    );
  }
}
