import 'package:flutter/material.dart';
import 'package:flutter_router/router/routes.dart';
import 'package:flutter_router/widgets/subpage.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) => const SubPage(
        selectedRoute: Routes.page2,
        child: Expanded(
          child: Center(
            child: Text("Page2"),
          ),
        ),
      );
}
