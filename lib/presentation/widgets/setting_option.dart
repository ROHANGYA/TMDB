import 'package:flutter/material.dart';

class SettingOption extends StatelessWidget {
  const SettingOption(
      {super.key, required this.label, required this.onTapAction});

  final String label;
  final Function onTapAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          onTapAction.call();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17,
              )
            ],
          ),
        ),
      ),
    );
  }
}
