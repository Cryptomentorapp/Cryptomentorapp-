class Signal {
  final String symbol;
  final String side; // BUY/SELL
  final double entry;
  final double? tp;
  final double? sl;
  final DateTime time;

  const Signal({
    required this.symbol,
    required this.side,
    required this.entry,
    this.tp,
    this.sl,
    required this.time,
  });
}
