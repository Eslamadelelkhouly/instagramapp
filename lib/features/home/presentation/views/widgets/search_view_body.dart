import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/border.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: SearchController,
                decoration: InputDecoration(
                  enabledBorder: customborderenable(),
                  focusedBorder: customborderfoucs(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
