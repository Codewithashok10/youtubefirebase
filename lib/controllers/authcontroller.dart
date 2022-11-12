import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:youtubefirebase/models/usermodel.dart';
import 'package:youtubefirebase/views/home/homepage.dart';

class AuthController extends GetxController {
  RxBool loading = false.obs;
  Rx<UserModel> userModel = UserModel().obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signup() async {
    try {
      loading.value = true;
      final c = await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      UserModel user = UserModel(
          email: c.user!.email, username: username.text, id: c.user!.uid);
      await adduserdata(user);
      Get.snackbar("Login", "success");
      Get.to(() => HomePage());
      loading.value = false;
    } catch (e) {
      Get.snackbar("error", "$e");
      loading.value = false;
    }
  }

  signin() async {
    try {
      loading.value = true;
      await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      Get.snackbar("Login", "success");
      Get.to(() => HomePage());
    } catch (e) {
      Get.snackbar("error", "$e");
      loading.value = false;
    }
  }

  signout() async {
    await auth.signOut();
  }

  adduserdata(UserModel user) async {
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("profile")
        .add(user.toJson());
  }
}
