
import 'package:flutter/material.dart';
class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Establece la dirección horizontal
        itemCount: 7,
        itemBuilder: (context, index) {
          return const SizedBox(
            width: 100.0,
            child: Center(
                child: Icon(
              Icons.circle,
              color: Color.fromARGB(255, 197, 149, 179),
              size: 70,
            )),
          );
        },
      ),
    );
  }
}
