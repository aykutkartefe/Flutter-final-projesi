import 'package:dev_template/feature/home/presantation/view/home_view.dart';
import 'package:dev_template/feature/jewel/view/jewel_view.dart';
import 'package:dev_template/feature/jewels/view/jewelery_view.dart';
import 'package:dev_template/feature/nav_bar/nav_bar.dart';
import 'package:dev_template/feature/onboarding/onboarding_view.dart';
import 'package:dev_template/feature/splash/view/splash_view.dart';
import 'package:dev_template/product/utils/router/adaptive_page_builder.dart';
import 'package:dev_template/product/utils/router/route_paths.dart';
import 'package:go_router/go_router.dart';

final class RouterManager {
  RouterManager._();

  static GoRouter get routes => _routes;

  static final _routes = GoRouter(
    initialLocation: RoutePaths.initial.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return NavBarView(child: child);
        },
        routes: [
          GoRoute(
            path: RoutePaths.home.path,
            pageBuilder: (context, state) => AdaptivePageBuilder.builder<void>(
              child: const HomeView(),
            ),
          ),
          GoRoute(
            path: RoutePaths.jewel.path,
            pageBuilder: (context, state) => AdaptivePageBuilder.builder<void>(
              child: const JewelView(),
            ),
          ),
          GoRoute(
            path: RoutePaths.jewelery.path,
            pageBuilder: (context, state) => AdaptivePageBuilder.builder<void>(
              child: const JeweleryView(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.initial.path,
        pageBuilder: (context, state) => AdaptivePageBuilder.builder<void>(
          child: const SplashView(),
        ),
      ),
      GoRoute(
        path: RoutePaths.onboarding.path,
        pageBuilder: (context, state) => AdaptivePageBuilder.builder<void>(
          child: const OnboardingView(),
        ),
      ),
    ],
  );
}
