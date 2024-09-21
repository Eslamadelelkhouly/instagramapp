import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class ContainerMessage extends StatelessWidget {
  const ContainerMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 200,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white),
          color: Colors.black,
        ),
        child: Text(
          'eeeeeee',
          style: Style.textStyle20,
        ),
      ),
    );
  }
}
