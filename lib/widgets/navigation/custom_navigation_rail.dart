import 'package:flutter/material.dart';
import 'package:flutter_router/models/nav_item.dart';
import 'package:flutter_router/widgets/navigation/nav_button.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationRail extends StatefulWidget {
  final bool isSubNav;
  final List<NavItem> destinations;
  final String selectedRoute;
  final Color backgroundColor;
  final Color foreground;
  final Color selectedBackground;
  final Color selectedForeground;
  final bool isExpaned;
  const CustomNavigationRail({
    super.key,
    required this.destinations,
    required this.selectedRoute,
    this.isExpaned = true,
    this.backgroundColor = Colors.red,
    this.foreground = Colors.white,
    this.selectedBackground = Colors.redAccent,
    this.selectedForeground = Colors.white,
    this.isSubNav = false,
  });

  @override
  _CustomNavigationRailState createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  late List<NavItem> destinations;
  late String selectedRoute;
  late bool isExpanded;
  @override
  void initState() {
    destinations = widget.destinations;
    selectedRoute = widget.selectedRoute;
    isExpanded = widget.isExpaned;
    super.initState();
  }

  void go(String route) {
    setState(() {
      if (!widget.isSubNav) {
        selectedRoute = route;
      }
    });
    context.go(route);
  }

  void expand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded ? 200 : 60,
      height: double.infinity,
      child: Material(
        color: widget.backgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: 30,
              width: double.infinity,
              child: GestureDetector(
                onTap: () => expand(),
                child: Padding(
                  padding: EdgeInsets.only(right: isExpanded ? 10 : 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: isExpanded
                        ? [
                            Icon(
                              Icons.chevron_left,
                              color: widget.foreground,
                              size: 14,
                            ),
                            Text(
                              "Retract",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: widget.foreground,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ]
                        : [
                            Text(
                              "Expand",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: widget.foreground,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: widget.foreground,
                              size: 14,
                            ),
                          ],
                  ),
                ),
              ),
            ),
            for (int i = 0; i < widget.destinations.length; i++)
              NavButton(
                item: destinations[i],
                isSelected: destinations[i].destination == selectedRoute,
                selectedBackground: widget.selectedBackground,
                selectedForeground: widget.selectedForeground,
                isExpanded: isExpanded,
                onTap: () => go(
                  destinations[i].destination,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
