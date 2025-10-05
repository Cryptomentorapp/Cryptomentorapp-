
import 'package:flutter/material.dart';

class CMCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const CMCard({super.key, required this.child, this.padding = const EdgeInsets.all(16)});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(padding: padding, child: child),
    );
  }
}
