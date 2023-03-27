import 'package:flutter/material.dart';

class NavItem {
  final IconData icon;
  final double iconSize;
  final String label;
  final String destination;

  const NavItem({
    required this.icon,
    required this.iconSize,
    required this.label,
    required this.destination,
  });
}
