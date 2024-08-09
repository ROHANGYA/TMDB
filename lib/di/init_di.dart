import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'init_di.config.dart';

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: false, // important for custo di resolving
  asExtension: true, // default
)
final di = GetIt.instance;

Future<void> configureDependencies() => di.init();
