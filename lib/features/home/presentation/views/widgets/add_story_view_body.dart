import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagramapp/core/widgets/show_snack_bar.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/choice_image_video.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/title_screen_add.dart';

class AddStatusViewBody extends StatefulWidget {
  const AddStatusViewBody({super.key});

  @override
  State<AddStatusViewBody> createState() => _AddViewBodyState();
}

class _AddViewBodyState extends State<AddStatusViewBody> {
  VideoPlayerController? videocontroller;
  File? pickimage;
  File? pickvideo;
  bool _isPickingimage = false;
  bool _isPickvideo = false;
  final description = TextEditingController();

  @override
  void dispose() {
    videocontroller?.dispose(); // Dispose the video controller when not needed
    super.dispose();
  }

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
          videocontroller?.pause(); // Pause video if an image is selected
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
        pickvideo = File(video.path);
        pickimage = null;

        // Initialize the video player
        videocontroller = VideoPlayerController.file(pickvideo!)
          ..initialize().then((_) {
            setState(() {}); // Update the UI once the video is initialized
            videocontroller?.play();
          });
      }
    } catch (e) {
      print('Error picking video: $e');
    } finally {
      setState(() {
        _isPickvideo = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<ProviderUser>(context);

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Builder(
          builder: (BuildContext scaffoldContext) => SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                TitleScreenAdd(
                  tilte: 'New Story',
                  onPressedcancel: () {
                    setState(() {
                      pickimage = null;
                      pickvideo = null;
                      videocontroller?.pause();
                      description.text = '';
                    });
                    Navigator.of(context).pop();
                  },
                  onPressednext: () async {
                    if (pickvideo != null || pickimage != null) {
                      try {
                        String uid = FirebaseAuth.instance.currentUser!.uid;
                        String uidstory = Uuid().v4();
                        var media = pickvideo != null ? pickvideo : pickimage;

                        final ref = FirebaseStorage.instance
                            .ref()
                            .child('usersstories')
                            .child(uidstory +
                                (pickimage != null ? '.jpg' : '.mp4'));

                        if (pickimage != null) {
                          await ref.putFile(pickimage!);
                        } else if (pickvideo != null) {
                          await ref.putFile(pickvideo!);
                        }

                        final content = await ref.getDownloadURL();
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(uid)
                            .update(
                          {
                            'stories': FieldValue.arrayUnion(
                              [
                                {
                                  'uid': uid,
                                  'storyid': uidstory,
                                  'content': content,
                                  'type': pickvideo != null ? 'video' : 'image',
                                  'date': Timestamp.now(),
                                  'viewes': []
                                }
                              ],
                            )
                          },
                        );
                        ShowSnackBar(scaffoldContext, 'Upload successful');

                        setState(() {
                          pickimage = null;
                          pickvideo = null;
                        });
                        userprovider.fetchUser(uid: uid);
                      } catch (e) {
                        ShowSnackBar(scaffoldContext, 'Upload failed: $e');
                      }
                    }
                  },
                ),
                pickimage == null
                    ? pickvideo == null
                        ? SizedBox(height: height * 0.4)
                        : Container(
                            width: double.infinity,
                            height: 500,
                            child: videocontroller != null &&
                                    videocontroller!.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio:
                                        videocontroller!.value.aspectRatio,
                                    child: VideoPlayer(videocontroller!),
                                  )
                                : Center(
                                    child: SizedBox(
                                      width: 50,
                                      height:
                                          50, // Small circular progress size
                                      child: const CircularProgressIndicator(),
                                    ),
                                  ), // Show a loading indicator while the video is initializing
                          )
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
      ),
    );
  }
}
