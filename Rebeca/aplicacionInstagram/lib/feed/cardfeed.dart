import 'package:aplicacioninstagram/feed/titleCard.dart';
import 'package:flutter/material.dart';

class CardFeed extends StatelessWidget {
  const CardFeed({
    super.key,
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              CircleAvatar(
                child: Text("R"),
              ),
              SizedBox(width: 10),
              Text(
                "Rebeca López",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Padding(//DescriptionCard
            padding:
                EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Text(
              "Publicado hoy",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: Image.network(
              "https://media.istockphoto.com/id/1371940128/es/foto/amigos-multirraciales-tomando-selfies-de-grupos-grandes-sonriendo-a-la-c%C3%A1mara-j%C3%B3venes-que-se.jpg?s=612x612&w=0&k=20&c=a3RfD8AnfDIG-4mChU3DexLa_spWt4jzQMHUj8CGBtc=",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: TitleCard(textStyle: textStyle),
            
          ),
        ],
      ),
    );
  }
}
