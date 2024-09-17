import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/title_person_status.dart';
import 'package:provider/provider.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/title_personal.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/custom_button.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/grid_images.dart';

class PersonalViewBody extends StatefulWidget {
  final String uid;
  final String kind;

  const PersonalViewBody({
    super.key,
    required this.uid,
    required this.kind,
  });

  @override
  State<PersonalViewBody> createState() => _PersonalViewBodyState();
}

class _PersonalViewBodyState extends State<PersonalViewBody> {
  late int postcount = 0;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    var snap = await FirebaseFirestore.instance
        .collection('posts')
        .where('uid', isEqualTo: widget.uid)
        .get();

    setState(() {
      postcount = snap.docs.length; // Update the postcount and rebuild the UI
    });
  }

  @override
  Widget build(BuildContext context) {
    // Listen for changes in ProviderUser
    final userprovider = Provider.of<ProviderUser>(context);
    // Fetch user data when the widget is built
    userprovider.fetchUser(uid: widget.uid);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the start
          children: [
            widget.kind == 'personscreen'
                ? TitlePersonal(
                    posts: postcount.toString(), // Post count from Firestore
                    following:
                        userprovider.userdata!.following.length.toString(),
                    followers:
                        userprovider.userdata!.followers.length.toString(),
                    personalimage: userprovider.userdata!.image,
                    name: userprovider.userdata!.name,
                  )
                : TitlePersonSearch(
                    posts: postcount.toString(), // Post count from Firestore
                    following:
                        userprovider.userdata!.following.length.toString(),
                    followers:
                        userprovider.userdata!.followers.length.toString(),
                    personalimage: userprovider.userdata!.image,
                    name: userprovider.userdata!.name,
                  ),
            const SizedBox(height: 10),
            CustomButton(
              color: Colors.blue,
              text: 'Edit Profile',
              onPressed: () {},
            ),
            const Divider(thickness: 1),
            const GridImages(),
          ],
        ),
      ),
    );
  }
}
