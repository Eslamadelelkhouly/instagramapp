import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/icon_fotter_post.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/text_fotter.dart';

class FotterPost extends StatelessWidget {
  const FotterPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const IconFotterPost(),
        const TextFotter(),
      ],
    );
  }
}
