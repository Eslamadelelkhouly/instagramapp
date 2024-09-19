import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/photo_current_profile.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/story_view.dart';
import 'package:provider/provider.dart';

class PersonalView extends StatelessWidget {
  const PersonalView({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<ProviderUser>(context);
    return Column(
      children: [
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            final user = userprovider.getUser;
            if (user != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Story(stories: user.stories);
                  },
                ),
              );
            } else {
              Text('');
            }
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: userprovider.getUser!.stories.isEmpty
                    ? Colors.grey
                    : Colors.pink,
              ),
            ),
            child: CirclePhoto(image: image, radius: 40),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: Style.textStyle20,
        ),
      ],
    );
  }
}
