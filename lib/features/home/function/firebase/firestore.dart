import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagramapp/features/home/data/models/user_model.dart';
import 'package:uuid/uuid.dart';

class Firestore {
  Future<UserModel> UserDetails({required uid}) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
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
      required name,
      required postid}) async {
    final idcomment = const Uuid().v4();
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
      'username': name,
      'date': Timestamp.now(),
    });
  }

  follow_user({required uid}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'following': FieldValue.arrayUnion([uid])
    });

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'followers':
          FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
    });
  }

  unfollow_user({required uid}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'following': FieldValue.arrayRemove([uid])
    });

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'followers':
          FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
    });
  }

  Future<void> delete_story({required Map story}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(story['uid'])
        .update({
      'stories':
          FieldValue.arrayRemove([story]) // Remove the exact story object
    });
  }

  deleteAfter24h({required Map story}) {
    Duration difference = DateTime.now().difference(story['date'].toDate());
    if (difference.inSeconds >= 5) {
      delete_story(story: story);
    }
  }
}
