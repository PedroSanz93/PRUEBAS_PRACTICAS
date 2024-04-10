import 'package:flutter/material.dart';

import 'home_feed.dart';
class feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feed Cards',
      home: HomeFeed(),
    );
  }
}

