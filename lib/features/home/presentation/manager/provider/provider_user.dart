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
    notifyListeners();
  }

  void increase_followers() {
    if (userdata != null) {
      userdata!.followers.length++;
      notifyListeners();
    }
  }

  void decrease_followers() {
    if (userdata != null) {
      userdata!.followers.length--;
      notifyListeners();
    }
  }

  void delete_storyy({required Map story}) {
    if (userdata != null) {
      userdata!.stories.removeWhere((element) => element == story);
      notifyListeners(); // Notify listeners after story is deleted
    }
  }
}
