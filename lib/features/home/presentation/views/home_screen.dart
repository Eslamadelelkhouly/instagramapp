import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/add_view_body.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/personal_view_body.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/search_view_body.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;

  void selectPage(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<ProviderUser>(context, listen: false);
    userProvider.fetchUser(
        uid: FirebaseAuth.instance.currentUser!
            .uid); // Fetch the user data when the screen is initialized
  }

  final List pageList = [
    const HomeViewBody(),
    const SearchViewBody(),
    const AddViewBody(),
    PersonalViewBody(uid: FirebaseAuth.instance.currentUser!.uid),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selected],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        backgroundColor: Colors.black,
        currentIndex: selected,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Person',
          ),
        ],
      ),
    );
  }
}
