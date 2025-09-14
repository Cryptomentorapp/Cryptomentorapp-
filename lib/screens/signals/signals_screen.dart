
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SignalsScreen extends StatelessWidget{
  const SignalsScreen({super.key});
  @override Widget build(BuildContext c){
    final items = <Map<String, dynamic>>[
      {'pair':'BTCUSDT','side':'BUY','entry':61234.0,'tp':62500.0,'sl':59800.0},
      {'pair':'ETHUSDT','side':'SELL','entry':2388.0,'tp':2280.0,'sl':2450.0},
    ];
    final closes = List<double>.generate(120, (i) => 60000 + (i%10-5)*120 + i*1.0);
    final spots = List.generate(closes.length, (i) => FlSpot(i.toDouble(), closes[i]));

    return Scaffold(
      appBar: AppBar(title: const Text('Trading Signals')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 200,
            child: LineChart(LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [LineChartBarData(spots: spots, isStrokeCapRound: true, dotData: FlDotData(show: false))],
            )),
          ),
          const SizedBox(height: 12),
          ...items.map((s) => Card(
            child: ListTile(
              title: Text('${s['pair']} • ${s['side']}'),
              subtitle: Text('Entry ${s['entry']}  TP ${s['tp']}  SL ${s['sl']}'),
              trailing: const Icon(Icons.chevron_right),
            ),
          )),
        ],
      ),
    );
  }
}
