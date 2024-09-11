import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/icon_fotter_post.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/text_fotter.dart';

class FotterPost extends StatelessWidget {
  const FotterPost({
    super.key,
    required this.onPressediconfavorite,
    required this.postmap,
  });
  final void Function()? onPressediconfavorite;
  final Map<String, dynamic> postmap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconFotterPost(
          mappost: postmap,
          onPressediconfavorite: onPressediconfavorite,
        ),
        TextFotter(
          postmap: postmap,
        ),
      ],
    );
  }
}
