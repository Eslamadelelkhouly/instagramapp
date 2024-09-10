import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/home_title.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/list_view_post.dart';
import 'package:provider/provider.dart';

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
            const SizedBox(height: 20),
            const HomeTitle(),
            SizedBox(height: height * 0.04),
            const ListViewPost(),
          ],
        ),
      ),
    );
  }
}
