import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/border.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/title_screen_add.dart';

class AddViewBody extends StatelessWidget {
  const AddViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TitleScreenAdd(),
            SizedBox(height: height * 0.4),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.upload,
                color: Colors.white,
              ),
            ),
            SizedBox(height: height * 0.01),
            TextField(
              style: TextStyle(color: Colors.white),
              maxLines: 10,
              decoration: InputDecoration(
                enabledBorder: customborderenable(),
                focusedBorder: customborderfoucs(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
