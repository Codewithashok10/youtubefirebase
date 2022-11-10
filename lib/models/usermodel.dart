import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id, email, password, username;
  UserModel({this.email, this.id, this.password, this.username});
  factory UserModel.fromJson(DocumentSnapshot snapshot) {
    return UserModel(
        id: snapshot.id,
        email: snapshot["email"],
        password: snapshot["password"],
        username: snapshot["username"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "username": username,
      "password": password
    };
  }
}
