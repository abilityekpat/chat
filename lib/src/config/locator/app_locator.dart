import 'package:chat/src/config/router/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

GetIt locator = GetIt.instance;

Future serviceLocator() async {
  locator.registerSingleton<GoRouter>(router());
}
