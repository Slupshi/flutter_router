import 'package:flutter/material.dart';
import 'package:flutter_router/router/routes.dart';
import 'package:flutter_router/widgets/subpage.dart';

class SubPage1 extends StatelessWidget {
  const SubPage1({super.key});

  @override
  Widget build(BuildContext context) => const SubPage(
        selectedRoute: Routes.subPage1Full,
        child: Expanded(
          child: Center(
            child: Text("SubPage1"),
          ),
        ),
      );
}
