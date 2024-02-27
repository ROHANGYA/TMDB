import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'init_di.config.dart';

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
final di = GetIt.instance;

void configureDependencies() => di.init();
