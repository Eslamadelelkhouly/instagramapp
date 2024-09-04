import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/home_title.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/list_view_post.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/post.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/row_title_home_screen.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const HomeTitle(),
            SizedBox(height: height * 0.04),
            const ListViewPost(),
          ],
        ),
      ),
    );
  }
}
