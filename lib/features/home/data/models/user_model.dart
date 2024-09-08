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

  Map<String, dynamic> ConveretToMap() {
    return {
      'password': password,
      'email': email,
      'uid': uid,
      'name': name,
      'image': image,
      'following': following,
      'followers': followers,
    };
  }

  static ConvertsnapToModel(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      uid: snapshot['uid'],
      email: snapshot['email'],
      password: snapshot['password'],
      image: snapshot['image'],
      name: snapshot['name'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
