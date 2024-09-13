import 'package:flutter/material.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/grid_image_view_profile.dart';
import 'package:provider/provider.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/title_personal.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/custom_button.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/grid_images.dart';

class PersonalViewBody extends StatefulWidget {
  final String uid;

  const PersonalViewBody({super.key, required this.uid});

  @override
  State<PersonalViewBody> createState() => _PersonalViewBodyState();
}

class _PersonalViewBodyState extends State<PersonalViewBody> {
  @override
  Widget build(BuildContext context) {
    // Listen for changes in ProviderUser
    final userprovider = Provider.of<ProviderUser>(context);
    // Fetch user data when the widget is built
    userprovider.fetchUser(uid: widget.uid);

    // If user data is null, show a loading indicator
    if (userprovider.userdata == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // Once user data is fetched, display it
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the start
          children: [
            TitlePersonal(
              personalimage: userprovider.userdata!.image,
              name: userprovider.userdata!.name,
            ),
            const SizedBox(height: 10),
            CustomButton(text: 'Edit Profile', onPressed: () {}),
            const Divider(thickness: 1),
            GridImageViewProfile(uid: widget.uid),
          ],
        ),
      ),
    );
  }
}
