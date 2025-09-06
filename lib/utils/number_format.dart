String formatCompact(num n) {
  final abs = n.abs();
  String suffix = '';
  double value = n.toDouble();

  if (abs >= 1e12) { suffix = 'T'; value = n / 1e12; }
  else if (abs >= 1e9) { suffix = 'B'; value = n / 1e9; }
  else if (abs >= 1e6) { suffix = 'M'; value = n / 1e6; }
  else if (abs >= 1e3) { suffix = 'K'; value = n / 1e3; }

  String s = value.toStringAsFixed(value.abs() >= 100 ? 0 : (value.abs() >= 10 ? 1 : 2));
  if (s.contains('.')) {
    s = s.replaceAll(RegExp(r'\.0+$'), '');
  }
  return s + suffix;
}
