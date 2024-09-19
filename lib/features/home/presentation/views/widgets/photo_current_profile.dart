import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/add_story_view_body.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/story_view.dart';
import 'package:provider/provider.dart';

class PhotoCurrentProfile extends StatelessWidget {
  const PhotoCurrentProfile({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<ProviderUser>(context);
    return GestureDetector(
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
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: userprovider.getUser!.stories.isEmpty
                    ? Colors.grey
                    : Colors.pink,
              ),
            ),
            child: CirclePhoto(
              radius: 40,
              image: image,
            ),
          ),
          // Use Padding or Positioned carefully to ensure it doesn't overlap
          Positioned(
            bottom: 0, // Adjusted positioning
            right: 0,
            child: Container(
              width: 40, // Ensure it's large enough for touch
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue, // Background to test
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  print("Add Story pressed");
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AddStatusViewBody();
                  }));
                },
                icon: Icon(
                  Icons.add,
                  size: 24, // Slightly smaller size to fit the container
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
