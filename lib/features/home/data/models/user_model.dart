import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String password;
  final String image;
  final String name;
  final List followers;
  final List following;
  final String uid;

  UserModel({
    required this.uid,
    required this.email,
    required this.password,
    required this.image,
    required this.name,
    required this.followers,
    required this.following,
  });

}
