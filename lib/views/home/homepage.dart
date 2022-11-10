import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("homePage"),
        centerTitle: true,
      ),
      body: Center(
          child: InkWell(
        onTap: () async {
          await auth.signOut();
        },
        child: Text(
          "Logout",
          style: TextStyle(fontSize: 30),
        ),
      )),
    );
  }
}
