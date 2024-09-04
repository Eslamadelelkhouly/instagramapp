import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/row_title_home_screen.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: height * 0.06),
          const RowTitleHomeScreen(),
        ],
      ),
    );
  }
}
