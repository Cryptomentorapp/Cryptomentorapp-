import 'package:flutter/material.dart';
import '../theme/styles.dart';

class TokenRow extends StatelessWidget {
  final String symbol, name, price, change;
  final bool positive;
  const TokenRow({super.key, required this.symbol, required this.name, required this.price, required this.change, required this.positive});

  @override
  Widget build(BuildContext context) {
    final color = positive ? CMColors.green : CMColors.red;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0x22FFFFFF), width: .5))),
      child: Row(children: [
        CircleAvatar(radius: 14, backgroundColor: Colors.white10, child: Text(symbol[0])),
        const SizedBox(width: 10),
        Expanded(child: Text("$symbol · $name", style: const TextStyle(fontWeight: FontWeight.w700))),
        Text(price),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: color.withOpacity(.15), borderRadius: BorderRadius.circular(8)),
          child: Text(change, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w700)),
        ),
      ]),
    );
  }
}