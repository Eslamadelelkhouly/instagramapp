import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/function/firebase/firestore.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/title_personal.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/custom_button.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/grid_image_view_profile.dart';
import 'package:provider/provider.dart';

class PersonaViewDifferentUser extends StatefulWidget {
  const PersonaViewDifferentUser({super.key, required this.uid});
  final String uid;
  @override
  State<PersonaViewDifferentUser> createState() =>
      _PersonaViewDifferentUserState();
}

class _PersonaViewDifferentUserState extends State<PersonaViewDifferentUser> {
  late List following;
  late bool infollowing;

  Future<void> fetch_current_user() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (snapshot.exists) {
      var data = snapshot.data();
      following = data?['following'] ?? [];
      infollowing = following.contains(widget.uid);
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch user data once when the widget is initialized
    Provider.of<ProviderUser>(context, listen: false)
        .fetchUser(uid: widget.uid);
    fetch_current_user();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Consumer listens to changes in ProviderUser and rebuilds the UI
            Consumer<ProviderUser>(
              builder: (context, userProvider, child) {
                // If user data is null, show a loading indicator
                if (userProvider.userdata == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return TitlePersonal(
                  following: userProvider.userdata!.following.length.toString(),
                  followers: userProvider.userdata!.followers.length.toString(),
                  personalimage: userProvider.userdata!.image,
                  name: userProvider.userdata!.name,
                );
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
                text: 'follow',
                onPressed: () {
                  if (infollowing == true) {
                    return; // unfollow
                  } else {
                    Firestore().follow_user(uid: widget.uid);
                  }
                }),
            const Divider(thickness: 1),
            GridImageViewProfile(uid: widget.uid),
          ],
        ),
      ),
    );
  }
}
