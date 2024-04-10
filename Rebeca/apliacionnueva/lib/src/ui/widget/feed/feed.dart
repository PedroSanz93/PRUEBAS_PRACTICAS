import 'package:flutter/material.dart';

import 'cardFeed.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      color: Colors.grey,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return Center(
      child: Scaffold(
          body: ListView(
            children: const [
              CardFeed(textStyle: textStyle),
              CardFeed(textStyle: textStyle),
              CardFeed(textStyle: textStyle),
              CardFeed(textStyle: textStyle),
            ],
          ),
          backgroundColor: Colors.grey[300]),
    );
  }
}


