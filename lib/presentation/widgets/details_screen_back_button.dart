import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/constants.dart';

class DetailsScreenBackButton extends StatelessWidget {
  const DetailsScreenBackButton({super.key, this.optionalCleanup});

  final Function? optionalCleanup;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(left: 5, top: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: MyColors.darkBlue),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          optionalCleanup?.call();
          context.pop();
        },
        child: const Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 30,
        ),
      ),
    );
  }
}
