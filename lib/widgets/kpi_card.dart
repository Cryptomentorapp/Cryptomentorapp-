import 'package:flutter/material.dart';
class KpiCard extends StatelessWidget{
  final String title; final String value; final String? sub;
  const KpiCard({super.key, required this.title, required this.value, this.sub});
  @override Widget build(BuildContext context){
    final theme=Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.onSurface.withOpacity(0.06)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text(title, style: theme.textTheme.labelMedium),
        const SizedBox(height:6),
        Text(value, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
        if(sub!=null) Text(sub!, style: theme.textTheme.labelSmall?.copyWith(color: Colors.redAccent)),
      ]),
    );
  }
}