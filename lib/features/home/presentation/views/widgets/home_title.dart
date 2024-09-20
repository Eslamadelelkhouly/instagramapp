import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/message/presentation/views/message_view.dart';
import 'package:instagramapp/features/signUp/presentation/view/signup_screen.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Text(
            'Instagram',
            style: Style.textStyle30,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return MessageView();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.message,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
