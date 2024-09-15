import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagramapp/core/utils/border.dart';
import 'package:instagramapp/core/widgets/show_snack_bar.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/title_screen_add.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

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
    final userProvider = Provider.of<ProviderUser>(context);
    void uplode_post() async {
      try {
        final uuid = const Uuid().v4();
        final ref = FirebaseStorage.instance
            .ref()
            .child('postimage')
            .child(uuid + 'jpg');
        await ref.putFile(pickimage!);
        final imageurl = await ref.getDownloadURL();
        FirebaseFirestore.instance.collection('posts').doc(uuid).set({
          'username': userProvider.getUser!.name,
          'uid': userProvider.getUser!.uid,
          'userimage': userProvider.getUser!.image,
          'imagepost': imageurl,
          'postid': uuid,
          'description': description.text,
          'likes': [],
          'data': Timestamp.now(),
        });
        setState(() {
          pickimage = null;
          description.text = '';
        });
        ShowSnackBar(context, 'done');
      } on FirebaseException catch (e) {
        ShowSnackBar(context, e.toString());
      }
    }

    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            TitleScreenAdd(
              onPressedcancel: () {
                setState(() {
                  pickimage = null;
                  description.text = '';
                });
              },
              onPressednext: uplode_post,
            ),
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
                helperStyle: const TextStyle(color: Colors.grey),
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
