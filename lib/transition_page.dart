import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoTransitionPage extends CustomTransitionPage {
  NoTransitionPage({required Widget child})
      : super(child: child, transitionsBuilder: (_, __, ___, child) => child);
}
