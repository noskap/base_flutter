import 'package:flutter/material.dart';

class WebContainer extends StatelessWidget {
  final Widget child;
  final bool? isAuthenticated;

  const WebContainer({super.key, required this.child,  this.isAuthenticated});

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        // decoration: const BoxDecoration(gradient: BingusBongusThemeConstants.primaryGradient),
        child: child,
      );
}
