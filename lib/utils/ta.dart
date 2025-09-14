import 'dart:math';
List<double> ema(List<double> prices, int period) {
  if (prices.isEmpty) return [];
  final k = 2.0 / (period + 1.0);
  final out = <double>[];
  double? prev;
  for (final p in prices) {
    prev = (prev == null) ? p : p * k + prev * (1 - k);
    out.add(prev!);
  }
  return out;
}
double rsi(List<double> closes, {int period = 14}) {
  if (closes.length < period + 1) return 50.0;
  double gain = 0, loss = 0;
  for (int i = 1; i <= period; i++) {
    final d = closes[i] - closes[i - 1];
    if (d >= 0) gain += d; else loss -= d;
  }
  gain /= period; loss /= period;
  for (int i = period + 1; i < closes.length; i++) {
    final d = closes[i] - closes[i - 1];
    gain = (gain * (period - 1) + (d > 0 ? d : 0.0)) / period;
    loss = (loss * (period - 1) + (d < 0 ? -d : 0.0)) / period;
  }
  if (loss == 0) return 100.0;
  final rs = gain / loss;
  return 100 - 100 / (1 + rs);
}
