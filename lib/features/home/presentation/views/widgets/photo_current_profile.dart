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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Story(
                stories: userprovider.getUser!.stories,
              );
            },
          ),
        );
      },
      child: Stack(
        children: [
          CirclePhoto(
            radius: 40,
            image: image,
          ),
          Positioned(
            width: 140,
            height: 130,
            child: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AddStatusViewBody();
                }));
              },
              icon: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
