import 'package:flutter/material.dart';
import '../screens/coming_soon_page.dart';

class FeatureGate extends StatelessWidget {
  final bool enabled;
  final Widget child;
  final String comingSoonTitle;
  final String? message;

  const FeatureGate({
    super.key,
    required this.enabled,
    required this.child,
    required this.comingSoonTitle,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    if (enabled) return child;
    return ComingSoonPage(title: comingSoonTitle, message: message);
  }
}
