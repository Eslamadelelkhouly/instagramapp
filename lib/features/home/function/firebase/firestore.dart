import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagramapp/features/home/data/models/user_model.dart';

class Firestore {
  Future<UserModel> UserDetails() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return UserModel.ConvertsnapToModel(snapshot);
  }

  Future<void> addPost({required Map postmap}) async {
    if (postmap['likes'].contains(FirebaseAuth.instance.currentUser!.uid)) {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postmap['postid'])
          .update({
        'likes':
            FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
      });
    } else {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postmap['postid'])
          .update({
        'likes': FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
      });
    }
  }

  Future<void> delete_post({required Map postmap}) async {
    if (FirebaseAuth.instance.currentUser!.uid == postmap['uid']) {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postmap['postid'])
          .delete();
    }
  }
}
