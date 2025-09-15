import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

class Signal {
  final String symbol;
  final String side;
  final double entry;
  final double? tp;
  final double? sl;
  final String note;
  Signal(this.symbol, this.side, this.entry, {this.tp, this.sl, this.note=''});
}

class SignalsService {
  static Future<List<List<dynamic>>> klines(String symbol, String interval, int limit) async {
    final u = Uri.parse('https://api.binance.com/api/v3/klines?symbol=$symbol&interval=$interval&limit=$limit');
    final r = await http.get(u);
    if (r.statusCode != 200) throw Exception('Binance error');
    final data = (json.decode(r.body) as List).cast<List>();
    return data;
  }

  static List<double> _ema(List<double> closes, int period) {
    final k = 2 / (period + 1);
    final out = <double>[];
    double? prev;
    for (final c in closes) {
      if (prev == null) prev = c;
      else prev = c * k + prev * (1 - k);
      out.add(prev);
    }
    return out;
  }

  static List<double> _rsi(List<double> closes, int period) {
    if (closes.length < period + 1) return List.filled(closes.length, 50);
    final gains = <double>[]; final losses = <double>[];
    for (int i=1;i<closes.length;i++){
      final diff = closes[i]-closes[i-1];
      gains.add(math.max(0, diff)); losses.add(math.max(0, -diff));
    }
    double avgGain = gains.take(period).fold(0.0,(a,b)=>a+b) / period;
    double avgLoss = losses.take(period).fold(0.0,(a,b)=>a+b) / period;
    final rsis = List<double>.filled(closes.length, 50);
    for (int i=period+1;i<closes.length;i++){
      final g = gains[i-1], l = losses[i-1];
      avgGain = (avgGain*(period-1)+g)/period;
      avgLoss = (avgLoss*(period-1)+l)/period;
      final rs = avgLoss==0? 100.0 : avgGain/avgLoss;
      rsis[i] = 100 - (100/(1+rs));
    }
    return rsis;
  }

  static Future<List<Signal>> generate(String symbol) async {
    final k = await klines(symbol, '15m', 200);
    final closes = k.map((e)=> double.parse((e[4] as String))).toList();
    final ema20 = _ema(closes, 20);
    final ema50 = _ema(closes, 50);
    final rsi14 = _rsi(closes, 14);
    final last = closes.last;
    final e20 = ema20.last; final e50 = ema50.last; final rsi = rsi14.last;

    final sigs = <Signal>[];
    if (e20 > e50 && rsi < 70) {
      sigs.add(Signal(symbol, 'Long', last, tp: last*1.02, sl: last*0.985, note: 'EMA20>EMA50, RSI=${rsi.toStringAsFixed(1)}'));
    } else if (e20 < e50 && rsi > 30) {
      sigs.add(Signal(symbol, 'Short', last, tp: last*0.98, sl: last*1.015, note: 'EMA20<EMA50, RSI=${rsi.toStringAsFixed(1)}'));
    } else {
      sigs.add(Signal(symbol, 'Neutral', last, note: 'No clear edge | RSI=${rsi.toStringAsFixed(1)}'));
    }
    return sigs;
  }
}
