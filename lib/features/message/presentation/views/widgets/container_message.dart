import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class ContainerMessage extends StatelessWidget {
  const ContainerMessage(
      {super.key,
      required this.message,
      required this.data,
      required this.color});

  final String message;
  final String data;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Are you sure?'),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text('yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('no'),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white),
                color: color,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  message,
                  style: Style.textStyle20,
                ),
              ),
            ),
            Text(
              data,
              style: Style.textStyle10,
            ),
          ],
        ),
      ),
    );
  }
}
