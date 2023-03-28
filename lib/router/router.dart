import 'package:flutter/material.dart';
import 'package:flutter_router/models/nav_item.dart';
import 'package:flutter_router/router/routes.dart';
import 'package:flutter_router/views/page1.dart';
import 'package:flutter_router/views/page2.dart';
import 'package:flutter_router/views/subpage1.dart';
import 'package:flutter_router/views/subpage2.dart';
import 'package:flutter_router/widgets/navigation/custom_navigation_rail.dart';
import 'package:go_router/go_router.dart';

import '../views/home_page.dart';

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
            child: Page1(),
          ),
        ),
        GoRoute(
          path: Routes.page2,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Page2(),
          ),
          routes: <GoRoute>[
            GoRoute(
              path: Routes.subPage1,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SubPage1(),
              ),
            ),
            GoRoute(
              path: Routes.subPage2,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SubPage2(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

_buildNav() => const CustomNavigationRail(
      destinations: [
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
      selectedRoute: Routes.home,
    );
