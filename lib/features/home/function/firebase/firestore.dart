import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagramapp/features/home/data/models/user_model.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

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

  Future<void> add_comment(
      {required comment,
      required uuid,
      required userimage,
      required postid}) async {
    if (comment.text != '') {
      final idcomment = Uuid().v4();
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postid)
          .collection('comments')
          .doc(idcomment)
          .set({
        'comment': comment,
        'userimage': userimage,
        'uuid': uuid,
        'postid': postid,
        'commentid': idcomment,
      });
      comment.text = '';
    }
  }
}
