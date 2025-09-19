import 'package:flutter/material.dart';
import '../theme/styles.dart';
class TokenRow extends StatelessWidget {
  final String symbol, name, price, change; final bool positive;
  const TokenRow({super.key, required this.symbol, required this.name, required this.price, required this.change, required this.positive});
  @override Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(vertical:12, horizontal:12), decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CMColors.divider))), child: Row(children: [
    Container(width:36, height:36, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(8)), alignment: Alignment.center, child: Text(symbol[0])),
    const SizedBox(width:12),
    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(symbol, style: const TextStyle(fontWeight: FontWeight.w800)), Text(name, style: const TextStyle(color: CMColors.muted, fontSize:12))])),
    const SizedBox(width:8),
    Text(price),
    const SizedBox(width:8),
    Container(padding: const EdgeInsets.symmetric(horizontal:8, vertical:4), decoration: BoxDecoration(color: (positive?CMColors.green:CMColors.red).withOpacity(.12), borderRadius: BorderRadius.circular(8)), child: Text(change, style: TextStyle(color: positive?CMColors.green:CMColors.red))),
  ]));
}