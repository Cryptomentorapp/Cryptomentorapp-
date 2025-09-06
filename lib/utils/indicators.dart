import 'dart:math';

List<double> ema(List<double> closes, int period){
  if(closes.isEmpty) return [];
  final k = 2.0 / (period + 1);
  final out = List<double>.filled(closes.length, 0);
  out[0] = closes[0];
  for(int i=1;i<closes.length;i++){ out[i] = closes[i]*k + out[i-1]*(1-k); }
  return out;
}

List<double> rsi(List<double> closes, int period){
  if(closes.length < period+1) return List.filled(closes.length, 50);
  final rsis = List<double>.filled(closes.length, 50);
  double gain=0, loss=0;
  for(int i=1;i<=period;i++){
    final ch = closes[i]-closes[i-1];
    if(ch>=0) gain+=ch; else loss-=ch;
  }
  gain/=period; loss/=period;
  rsis[period] = loss==0?100:100 - (100/(1 + (gain/loss)));
  for(int i=period+1;i<closes.length;i++){
    final ch = closes[i]-closes[i-1];
    final g = max(ch,0), l = max(-ch,0);
    gain = (gain*(period-1) + g)/period;
    loss = (loss*(period-1) + l)/period;
    rsis[i] = loss==0?100:100 - (100/(1 + (gain/loss)));
  }
  return rsis;
}