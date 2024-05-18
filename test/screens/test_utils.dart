import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/presentation/router/navigation_paths.dart';

void ignoreOverflowErrors(
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  bool ifIsOverflowError = false;
  bool isUnableToLoadAsset = false;

  // Detect overflow error.
  var exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
    );
    isUnableToLoadAsset = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("Unable to load asset"),
    );
  }

  // Ignore if is overflow error.
  if (ifIsOverflowError || isUnableToLoadAsset) {
    debugPrint('Ignored RenderFlex or Asset Error');
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}

extension RouteExtension on GoRouter {
  void resetForTest() {
    while (canPop()) {
      pop();
    }
    go(NavigationPaths.home);
  }
}

Future<void> ignoreException(Type exceptionType) async {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (FlutterErrorDetails details) {
    final currentError = details.exception.runtimeType;
    if (currentError == exceptionType) {
      return;
    }
    originalOnError(details);
  };
}
