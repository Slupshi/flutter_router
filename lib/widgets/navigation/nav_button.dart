import 'package:flutter/material.dart';
import 'package:flutter_router/models/nav_item.dart';

class NavButton extends StatelessWidget {
  final NavItem item;
  final void Function() onTap;
  final bool isSelected;

  const NavButton({
    super.key,
    required this.item,
    required this.onTap,
    required this.isSelected,
  });
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        width: double.infinity,
        child: ListTile(
          tileColor: isSelected ? Colors.amber : Colors.transparent,
          leading: SizedBox.square(
            dimension: 30,
            child: Icon(
              item.icon,
              size: item.iconSize,
              color: Colors.white,
            ),
          ),
          title: Text(
            item.label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: Colors.white,
            ),
          ),
          onTap: () => onTap(),
        ),
      );
}
