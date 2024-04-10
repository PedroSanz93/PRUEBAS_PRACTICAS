import 'package:flutter/material.dart';

import '../widget/feed/feed.dart';
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

