import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/data/models/user_model.dart';
import 'package:instagramapp/features/home/function/firebase/firestore.dart';

class ProviderUser with ChangeNotifier {
  UserModel? userdata;

  UserModel? get getUser {
    return userdata;
  }

  Future<void> fetchUser({required String uid}) async {
    UserModel user = await Firestore().UserDetails(uid: uid);
    userdata = user;
    notifyListeners(); // Notify listeners after user data is updated
  }

  void increase_followers() {
    getUser!.followers.length++;
    notifyListeners();
  }

  void decrease_followers() {
    getUser!.followers.length--;
    notifyListeners();
  }
}
