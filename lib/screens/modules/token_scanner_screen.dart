import 'package:flutter/material.dart';
class TokenScannerScreen extends StatefulWidget {
  const TokenScannerScreen({super.key});
  @override State<TokenScannerScreen> createState() => _TState();
}
class _TState extends State<TokenScannerScreen> {
  final _controller = TextEditingController();
  String? _result; bool _busy=false;
  Future<void> _scan() async {
    setState(()=>_busy=true);
    await Future.delayed(const Duration(milliseconds: 500));
    setState(()=>{_result='Kết quả quét (demo) cho: ${_controller.text}', _busy=false});
  }
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Token Scanner')), body:
      Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextField(controller:_controller, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Contract address')), const SizedBox(height: 10),
        SizedBox(width: double.infinity, child: FilledButton(onPressed:_busy?null:_scan, child: Text(_busy?'Đang quét...':'Quét'))),
        const SizedBox(height: 12),
        if(_result!=null) Expanded(child: SingleChildScrollView(child: Text(_result!)))
      ])));
  }
}
