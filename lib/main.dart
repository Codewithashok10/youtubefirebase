import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:youtubefirebase/views/adminview/addproduct.dart';
import 'package:youtubefirebase/views/auth/signinpage.dart';
import 'package:youtubefirebase/views/auth/signuppage.dart';
import 'package:youtubefirebase/views/home/homepage.dart';

import 'views/productpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.keepFactory,
      debugShowCheckedModeBanner: false,
      home: auth.currentUser != null ? HomePage() : SigninPage(),
    );
  }
}
