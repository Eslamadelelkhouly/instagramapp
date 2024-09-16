import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/list_tiel_search.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/persona_view_different_user.dart';

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
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No results found'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final doc = snapshot.data!.docs[index];
            return ListTielSearch(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PersonaViewDifferentUser(uid: doc['uid']);
                    },
                  ),
                );
              },
              image: doc['image'],
              name: doc['name'],
            );
          },
        );
      },
    );
  }
}
