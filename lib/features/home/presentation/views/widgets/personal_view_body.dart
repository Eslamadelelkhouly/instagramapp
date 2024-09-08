import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/title_personal.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/custom_button.dart';
import 'package:instagramapp/features/signUp/presentation/view/widget/grid_images.dart';
import 'package:provider/provider.dart';

class PersonalViewBody extends StatelessWidget {
  const PersonalViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<ProviderUser>(context);

    // Check if userdata is null
    if (userprovider.userdata == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            TitlePersonal(
              personalimage: userprovider
                  .userdata!.image, // Now userdata is guaranteed to be non-null
              name: userprovider.userdata!.name,
            ),
            CustomButton(text: 'Edit Profile', onPressed: () {}),
            const Divider(thickness: 1),
            const GridImages(),
          ],
        ),
      ),
    );
  }
}
