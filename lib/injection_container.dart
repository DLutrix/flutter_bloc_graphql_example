import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.iconfig.dart';

GetIt getIt = GetIt.instance;

@injectableInit
void configure() => $initGetIt(getIt);
