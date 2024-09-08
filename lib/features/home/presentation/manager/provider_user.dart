import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/data/models/user_model.dart';
import 'package:instagramapp/features/home/function/firebase/firestore.dart';

class ProviderUser with ChangeNotifier {
  UserModel? userdata;
  UserModel? get getUser {
    return userdata;
  }

  void fetchUser() async {
    UserModel user = await Firestore().UserDetails();
    userdata = user;
    notifyListeners();
  }
}
