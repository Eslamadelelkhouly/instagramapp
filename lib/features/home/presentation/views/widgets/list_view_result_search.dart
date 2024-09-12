import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/list_tiel_search.dart';

class ListViewResultSearch extends StatelessWidget {
  const ListViewResultSearch({super.key, required this.searchcontroller});

  final TextEditingController searchcontroller;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('users')
            .where('name', isEqualTo: searchcontroller.text)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTielSearch(
                image: snapshot.data!.docs[index]['image'],
                name: snapshot.data!.docs[index]['name'],
              );
            },
          );
        });
  }
}
