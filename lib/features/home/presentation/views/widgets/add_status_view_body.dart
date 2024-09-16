import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/choice_image_video.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/title_screen_add.dart';

class AddStatusViewBody extends StatefulWidget {
  const AddStatusViewBody({super.key});

  @override
  State<AddStatusViewBody> createState() => _AddViewBodyState();
}

class _AddViewBodyState extends State<AddStatusViewBody> {
  File? pickimage;
  File? pickvideo;
  bool _isPickingimage = false;
  bool _isPickvideo = false;
  final description = TextEditingController();

  Future<void> selectImage() async {
    if (_isPickingimage) return;

    setState(() {
      _isPickingimage = true;
    });

    try {
      var image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        setState(() {
          pickimage = File(image.path);
          pickvideo = null;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    } finally {
      setState(() {
        _isPickingimage = false;
      });
    }
  }

  Future<void> selectvideo() async {
    if (_isPickvideo) return;

    setState(() {
      _isPickvideo = true;
    });

    try {
      var video = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
      );
      if (video != null) {
        setState(() {
          pickvideo = File(video.path);
          pickimage = null;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    } finally {
      setState(() {
        _isPickvideo = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              TitleScreenAdd(
                tilte: 'New Story',
                onPressedcancel: () {
                  setState(() {
                    pickimage = null;
                    description.text = '';
                  });
                  Navigator.of(context).pop();
                },
                onPressednext: () {},
              ),
              pickimage == null
                  ? SizedBox(height: height * 0.4)
                  : Image.file(
                      pickimage!,
                      height: height * 0.4,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
              ChoiceImageVideo(
                selectImage: selectImage,
                selectVideo: selectvideo,
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
