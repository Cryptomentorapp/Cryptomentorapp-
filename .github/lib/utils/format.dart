
import 'package:intl/intl.dart';

final _n0 = NumberFormat.decimalPattern();
String fmt(num n) => _n0.format(n);
String moneyShort(num n) {
  if (n >= 1e9) return '${(n/1e9).toStringAsFixed(2)}B';
  if (n >= 1e6) return '${(n/1e6).toStringAsFixed(2)}M';
  if (n >= 1e3) return '${(n/1e3).toStringAsFixed(2)}K';
  return n.toString();
}
