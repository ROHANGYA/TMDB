import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 35,
                child: Hero(
                  tag: "test",
                  child: SearchBar(
                    controller: TextEditingController(),
                    leading: const Icon(Icons.search_rounded),
                    hintText: strings.search,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
