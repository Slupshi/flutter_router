import 'package:flutter/material.dart';
import 'package:flutter_router/models/nav_item.dart';

class NavButton extends StatelessWidget {
  final NavItem item;
  final void Function() onTap;
  final bool isSelected;
  final bool isExpanded;

  final Color foreground;
  final Color selectedBackground;
  final Color selectedForeground;

  const NavButton({
    super.key,
    required this.item,
    required this.onTap,
    required this.isSelected,
    required this.isExpanded,
    this.foreground = Colors.white,
    this.selectedBackground = Colors.amber,
    this.selectedForeground = Colors.white,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        width: double.infinity,
        child: isExpanded
            ? ListTile(
                tileColor: isSelected ? selectedBackground : Colors.transparent,
                leading: SizedBox.square(
                  dimension: 30,
                  child: Icon(
                    item.icon,
                    size: item.iconSize,
                    color: isSelected ? selectedForeground : foreground,
                  ),
                ),
                title: Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? selectedForeground : foreground,
                  ),
                ),
                onTap: () => onTap(),
              )
            : SizedBox(
                child: Material(
                  color: isSelected ? selectedBackground : Colors.transparent,
                  child: IconButton(
                    onPressed: onTap,
                    icon: Icon(
                      item.icon,
                      size: item.iconSize,
                      color: isSelected ? selectedForeground : foreground,
                    ),
                  ),
                ),
              ),
      );
}
