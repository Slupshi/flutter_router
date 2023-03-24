import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String label;
  final String destination;

  const NavItem({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.label,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        width: double.infinity,
        child: ListTile(
          leading: SizedBox.square(
            dimension: 30,
            child: Icon(
              icon,
              size: iconSize,
              color: Colors.white,
            ),
          ),
          title: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          onTap: () => context.go(destination),
        ),
      );
}
