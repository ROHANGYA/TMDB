import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class GenericError extends StatelessWidget {
  const GenericError(
      {super.key, required this.errorDescription, this.onRetryAction});

  final String errorDescription;
  final Function? onRetryAction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            Assets.movieFilm,
          ),
          fit: BoxFit.contain,
          repeat: ImageRepeat.repeatX,
          opacity: 0.2,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Icons.warning_rounded,
              color: MyColors.darkBlue,
              size: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(strings.errorHasOccurred,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: 270,
                child: Text(
                  errorDescription,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            onRetryAction == null
                ? const SizedBox()
                : OutlinedButton(
                    onPressed: () {
                      onRetryAction?.call();
                    },
                    child: Text(
                      strings.retry,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 13, color: Colors.black),
                    )),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
