
// Stubbed DEX aggregator service (wire to 1inch/0x later)
class DexQuote {
  final String fromToken;
  final String toToken;
  final double amount;
  final double estimatedOut;
  final double priceImpact;

  DexQuote(this.fromToken, this.toToken, this.amount, this.estimatedOut, this.priceImpact);
}

Future<DexQuote> fetchMockQuote(String from, String to, double amount) async {
  // Mock math
  final rate = (to.hashCode % 1000 + 1) / 1000.0;
  final out = amount * (rate + 0.8);
  final impact = (from.hashCode % 300) / 100.0;
  await Future.delayed(const Duration(milliseconds: 500));
  return DexQuote(from, to, amount, double.parse(out.toStringAsFixed(6)), double.parse(impact.toStringAsFixed(2)));
}
