import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class PersonalImage extends StatefulWidget {
  final Function(String) onImageSelected; // Callback function

  const PersonalImage({super.key, required this.onImageSelected});

  @override
  State<PersonalImage> createState() => _PersonalImageState();
}

class _PersonalImageState extends State<PersonalImage> {
  File? pickimage;
  bool _isPicking = false;

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
      final uuid = const Uuid().v4();
      final ref =
          FirebaseStorage.instance.ref().child('userimage').child(uuid + 'jpg');
      await ref.putFile(pickimage!);
      final imageurl = await ref.getDownloadURL();

      widget.onImageSelected(imageurl);
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
    return Stack(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: Colors.white,
          backgroundImage: pickimage != null
              ? FileImage(pickimage!)
              : const NetworkImage(
                  'https://cdn.pixabay.com/photo/2018/11/13/22/01/instagram-3814080_1280.png',
                ) as ImageProvider,
        ),
        Positioned(
          height: 80 * 2,
          width: 80 * 2,
          child: IconButton(
            onPressed: selectImage,
            icon: const Icon(
              size: 20,
              Icons.add,
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
