class Token {
  final String id, symbol, name;
  final num price, change24h, marketCap, volume;
  Token({required this.id, required this.symbol, required this.name, required this.price, required this.change24h, required this.marketCap, required this.volume});
  factory Token.fromMap(Map m) => Token(
    id: (m['id']??'').toString(),
    symbol: (m['symbol']??'').toString(),
    name: (m['name']??'').toString(),
    price: (m['current_price']??m['price']??0) as num,
    change24h: (m['price_change_percentage_24h']??m['change24h']??0) as num,
    marketCap: (m['market_cap']??m['mcap']??0) as num,
    volume: (m['total_volume']??m['volume']??0) as num,
  );
}
