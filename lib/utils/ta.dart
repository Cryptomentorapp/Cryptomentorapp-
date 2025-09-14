// Simple technical helpers (placeholder)
double ema(double prevEma, double price, int period) {
  final k = 2 / (period + 1);
  return price * k + prevEma * (1 - k);
}

double rsi(List<double> closes, {int period = 14}) {
  if (closes.length <= period) return 50;
  double gains = 0, losses = 0;
  for (int i = closes.length - period; i < closes.length; i++) {
    final diff = closes[i] - closes[i - 1];
    if (diff >= 0) gains += diff; else losses -= diff;
  }
  final rs = (losses == 0) ? 1000 : gains / losses;
  return 100 - (100 / (1 + rs));
}
