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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
              preferredSize: const Size(300, 10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: Hero(
                    tag: "test",
                    child: SearchBar(
                      controller: TextEditingController(),
                      leading: const Icon(Icons.search_rounded),
                      hintText: strings.searchMovies,
                      textInputAction: TextInputAction.search,
                      trailing: [
                        Transform.translate(
                          offset: const Offset(0, -2),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.sort_rounded,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyColors.vermillionRed),
              ),
            )
          ],
        ),
      ),
    );
  }
}
