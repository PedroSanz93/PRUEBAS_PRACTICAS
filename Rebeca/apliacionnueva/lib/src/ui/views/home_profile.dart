import 'package:flutter/material.dart';

import '../widget/profile/bodyProfile.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false, // Esto oculta el botón de ir atrás
          title: const Center(child: Text("rebecarlp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
        ),
        body: const BodyProfile(),
      ),
    );
  }
}
