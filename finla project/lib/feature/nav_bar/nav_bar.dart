import 'package:dev_template/product/utils/localization/locale_keys.g.dart';
import 'package:dev_template/product/utils/router/route_paths.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class NavBarView extends StatefulWidget {
  const NavBarView({required this.child, super.key});
  final Widget child;

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  @override
  Widget build(BuildContext context) {
    final currentIndex = _calculateSelectedIndex(context);
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (!mounted) return;
          switch (index) {
            case 0:
              GoRouter.of(context).go(RoutePaths.home.path);
              return;
            case 1:
              GoRouter.of(context).go(RoutePaths.jewel.path);
              return;
            case 2:
              GoRouter.of(context).go(RoutePaths.jewelery.path);
              return;
          }
        },
        selectedItemColor: Theme.of(context).primaryColor, // Seçili olan renk
        unselectedItemColor:
            Theme.of(context).disabledColor, // Seçili olmayan renk
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
            label: LocaleKeys.home_title.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.sell,
            ),
            label: LocaleKeys.jewelery_title.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            label: LocaleKeys.products_title.tr(),
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final goRouter = GoRouter.of(context);
    final location = goRouter.routerDelegate.currentConfiguration.fullPath;
    if (location == RoutePaths.home.path) {
      return 0;
    } else if (location == RoutePaths.jewel.path) {
      return 1;
    } else if (location == RoutePaths.jewelery.path) {
      return 2;
    } else {
      return 0;
    }
  }
}
