import 'package:flutter/material.dart';
import 'package:flutter_router/models/nav_item.dart';
import 'package:flutter_router/router/routes.dart';
import 'package:flutter_router/widgets/navigation/custom_navigation_rail.dart';

class SubPage extends StatelessWidget {
  final Widget child;
  final String selectedRoute;
  const SubPage({
    super.key,
    required this.child,
    required this.selectedRoute,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          CustomNavigationRail(
            isSubNav: true,
            backgroundColor: Colors.green,
            foreground: Colors.white,
            selectedBackground: Colors.greenAccent,
            selectedForeground: Colors.white,
            destinations: const [
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
                destination: Routes.subPage1Full,
              ),
              NavItem(
                icon: Icons.two_k_plus_outlined,
                iconSize: 20,
                label: "SubPage2",
                destination: Routes.subPage2Full,
              ),
            ],
            selectedRoute: selectedRoute,
          ),
          Expanded(child: child),
        ],
      );
}
