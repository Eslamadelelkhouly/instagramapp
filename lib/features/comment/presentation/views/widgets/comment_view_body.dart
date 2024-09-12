import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/border.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/comment/presentation/views/widgets/list_view_card_commnt.dart';
import 'package:instagramapp/features/home/function/firebase/firestore.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:provider/provider.dart';

class CommentViewBody extends StatelessWidget {
  CommentViewBody({super.key, required this.postid});

  final String postid;
  final comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<ProviderUser>(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              'Comment',
              style: Style.textStyle30,
            ),
            ListViewCardCommnt(
              user: userprovider.getUser!,
            ),
            Spacer(),
            TextField(
              controller: comment,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: customborderenable(),
                focusedBorder: customborderfoucs(),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (comment.text != '') {
                      Firestore().add_comment(
                        comment: comment.text,
                        uuid: userprovider.getUser!.uid,
                        userimage: userprovider.getUser!.image,
                        postid: postid,
                      );
                    }
                    comment.text = '';
                  },
                  icon: Icon(Icons.send),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
