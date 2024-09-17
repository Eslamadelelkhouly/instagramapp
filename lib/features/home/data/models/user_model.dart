import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String password;
  final String image;
  final String name;
  final List followers;
  final List following;
  final String uid;
  final List stories;

  UserModel(
    this.stories,
    this.uid,
    this.email,
    this.password,
    this.image,
    this.name,
    this.followers,
    this.following,
  );

  Map<String, dynamic> ConveretToMap() {
    return {
      'password': password,
      'email': email,
      'uid': uid,
      'name': name,
      'image': image,
      'following': following,
      'followers': followers,
      'stories': stories,
    };
  }

  static ConvertsnapToModel(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      snapshot['uid'],
      snapshot['email'],
      snapshot['password'],
      snapshot['image'],
      snapshot['name'],
      snapshot['followers'],
      snapshot['following'],
      snapshot['stories'],
    );
  }
}
