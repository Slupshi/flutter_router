import 'package:flutter/material.dart';
import 'package:flutter_router/models/nav_item.dart';
import 'package:flutter_router/widgets/navigation/nav_button.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationRail extends StatefulWidget {
  final List<NavItem> destinations;
  final String selectedRoute;
  final Color backgroundColor;
  const CustomNavigationRail({
    super.key,
    required this.destinations,
    required this.selectedRoute,
    this.backgroundColor = Colors.red,
  });

  @override
  _CustomNavigationRailState createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  late List<NavItem> destinations;
  late String selectedRoute;
  @override
  void initState() {
    destinations = widget.destinations;
    selectedRoute = widget.selectedRoute;
    super.initState();
  }

  void go(String route) {
    setState(() {
      selectedRoute = route;
    });
    context.go(route);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: double.infinity,
      child: Material(
        color: widget.backgroundColor,
        child: Column(
          children: [
            for (int i = 0; i < widget.destinations.length; i++)
              NavButton(
                item: destinations[i],
                isSelected: destinations[i].destination == selectedRoute,
                onTap: () => go(
                  destinations[i].destination,
                ),
              )
          ],
        ),
      ),
    );
  }
}
