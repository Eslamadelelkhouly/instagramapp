import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    // Fetch user data once when the widget is initialized
    Provider.of<ProviderUser>(context, listen: false)
        .fetchUser(uid: widget.uid);
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
                  personalimage: userProvider.userdata!.image,
                  name: userProvider.userdata!.name,
                );
              },
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
