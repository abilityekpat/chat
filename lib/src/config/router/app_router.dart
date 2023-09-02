import 'package:chat/src/config/keys/routes.dart';
import 'package:chat/src/presentation/onboarding/view/onboarding.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/onboarding/view/splashscreen.dart';

GoRouter router() => GoRouter(routes: [
      GoRoute(
          name: AppRoutes.splashscreen,
          path: AppRoutes.splashscreen,
          builder: (_, state) => const Splashscreen()),
      GoRoute(
          name: AppRoutes.onboarding,
          path: AppRoutes.onboarding,
          builder: (_, state) => const Onboarding()),
    ]);
