import 'package:flutter/material.dart';
import 'package:flutter_router/nav_item.dart';
import 'package:flutter_router/routes.dart';
import 'package:go_router/go_router.dart';

import 'home_page.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => Scaffold(
        appBar: AppBar(
          title: const Text("GoRouterTEST"),
        ),
        body: Row(
          children: [
            _buildNav(),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
      routes: <GoRoute>[
        GoRoute(
          path: Routes.home,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MyHomePage(),
          ),
        ),
        GoRoute(
          path: Routes.page1,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Expanded(
              child: Center(
                child: Text("Page1"),
              ),
            ),
          ),
        ),
        GoRoute(
          path: Routes.page2,
          pageBuilder: (context, state) => NoTransitionPage(
            child: Row(
              children: [
                _buildsubnav(context),
                const Expanded(
                  child: Center(
                    child: Text("Page2"),
                  ),
                ),
              ],
            ),
          ),
          routes: <GoRoute>[
            GoRoute(
              path: Routes.subPage1,
              pageBuilder: (context, state) => NoTransitionPage(
                child: Row(
                  children: [
                    _buildsubnav(context),
                    const Expanded(
                      child: Center(
                        child: Text("subPage1"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GoRoute(
              path: Routes.subPage2,
              pageBuilder: (context, state) => NoTransitionPage(
                child: Row(
                  children: [
                    _buildsubnav(context),
                    const Expanded(
                      child: Center(
                        child: Text("subPage2"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

Widget _buildsubnav(BuildContext context) {
  return SizedBox(
    width: 300,
    height: double.infinity,
    child: Material(
      color: Colors.green,
      child: Column(
        children: const [
          NavItem(
            icon: Icons.two_k,
            iconSize: 20,
            label: "SubPage0",
            destination: Routes.page2,
          ),
          NavItem(
            icon: Icons.one_k_plus_outlined,
            iconSize: 20,
            label: "SubPage1",
            destination: "${Routes.page2}/${Routes.subPage1}",
          ),
          NavItem(
            icon: Icons.two_k_plus_outlined,
            iconSize: 20,
            label: "SubPage2",
            destination: "${Routes.page2}/${Routes.subPage2}",
          ),
        ],
      ),
    ),
  );
}

Widget _buildNav() => SizedBox(
      width: 200,
      height: double.infinity,
      child: Material(
        color: Colors.red,
        child: Column(
          children: const [
            NavItem(
              icon: Icons.home,
              iconSize: 20,
              label: "Home",
              destination: Routes.home,
            ),
            NavItem(
              icon: Icons.one_k,
              iconSize: 20,
              label: "Page1",
              destination: Routes.page1,
            ),
            NavItem(
              icon: Icons.two_k,
              iconSize: 20,
              label: "Page2",
              destination: Routes.page2,
            ),
          ],
        ),
      ),
    );
