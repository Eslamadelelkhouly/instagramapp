import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/list_tiel_search.dart';

class ListViewResultSearch extends StatelessWidget {
  const ListViewResultSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const ListTielSearch();
      },
    );
  }
}
