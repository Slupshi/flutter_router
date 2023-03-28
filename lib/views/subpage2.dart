import 'package:flutter/material.dart';
import 'package:flutter_router/router/routes.dart';
import 'package:flutter_router/widgets/subpage.dart';

class SubPage2 extends StatelessWidget {
  const SubPage2({super.key});

  @override
  Widget build(BuildContext context) => const SubPage(
        selectedRoute: Routes.subPage2Full,
        child: Expanded(
          child: Center(
            child: Text("SubPage2"),
          ),
        ),
      );
}
