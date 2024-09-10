import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagramapp/core/utils/border.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/title_screen_add.dart';

class AddViewBody extends StatefulWidget {
  const AddViewBody({super.key});

  @override
  State<AddViewBody> createState() => _AddViewBodyState();
}

class _AddViewBodyState extends State<AddViewBody> {
  File? pickimage;
  bool _isPicking = false;
  final description = TextEditingController();

  Future<void> selectImage() async {
    if (_isPicking) return;

    setState(() {
      _isPicking = true;
    });

    try {
      var image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        setState(() {
          pickimage = File(image.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    } finally {
      setState(() {
        _isPicking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TitleScreenAdd(),
            pickimage == null
                ? SizedBox(height: height * 0.4)
                : Image.file(
                    pickimage!,
                    height: height * 0.4,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
            IconButton(
              onPressed: () {
                selectImage();
              },
              icon: const Icon(
                Icons.upload,
                color: Colors.white,
              ),
            ),
            SizedBox(height: height * 0.02),
            TextField(
              controller: description,
              style: const TextStyle(color: Colors.white),
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Add Comment',
                helperStyle: TextStyle(color: Colors.grey),
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
