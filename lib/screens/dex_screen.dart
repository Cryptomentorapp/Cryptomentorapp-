
import 'package:flutter/material.dart';
import '../services/dex_service.dart';
import '../widgets/cards.dart';

class DexScreen extends StatefulWidget{
  const DexScreen({super.key});
  @override State<DexScreen> createState()=>_DexScreenState();
}

class _DexScreenState extends State<DexScreen>{
  final _apiKey = TextEditingController(text: 'YOUR_1INCH_API_KEY');
  final _chainId = TextEditingController(text: '1'); // Ethereum mainnet
  final _src = TextEditingController(text: '0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE'); // ETH pseudo
  final _dst = TextEditingController(text: '0xdAC17F958D2ee523a2206206994597C13D831ec7'); // USDT
  final _amountWei = TextEditingController(text: '100000000000000000'); // 0.1 ETH
  DexQuote? _quote;
  String? _err;
  bool _loading=false;

  Future<void> _getQuote() async {
    setState(()=>{_loading=true,_err=null});
    try{
      final q = await fetchOneInchQuote(
        chainId: int.parse(_chainId.text.trim()),
        srcToken: _src.text.trim(),
        dstToken: _dst.text.trim(),
        amountWei: _amountWei.text.trim(),
        apiKey: _apiKey.text.trim(),
      );
      setState(()=>_quote=q);
    }catch(e){
      setState(()=>_err=e.toString());
    }finally{
      setState(()=>_loading=false);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('DEX (1inch Quote)')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CMCard(child: Column(children: [
            TextField(controller: _apiKey, decoration: const InputDecoration(labelText: '1inch API Key')),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: TextField(controller: _chainId, decoration: const InputDecoration(labelText: 'Chain ID (e.g., 1)'))),
              const SizedBox(width:10),
              Expanded(child: TextField(controller: _amountWei, decoration: const InputDecoration(labelText: 'Amount in Wei (src amount)'))),
            ]),
            const SizedBox(height: 10),
            TextField(controller: _src, decoration: const InputDecoration(labelText: 'From Token (address or ETH pseudo)')),
            const SizedBox(height: 10),
            TextField(controller: _dst, decoration: const InputDecoration(labelText: 'To Token (address)')),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _loading?null:_getQuote, child: _loading?const CircularProgressIndicator():const Text('Get Quote'))
          ])),
          const SizedBox(height: 12),
          if(_err!=null) CMCard(child: Text(_err!, style: const TextStyle(color: Colors.redAccent))),
          if(_quote!=null) CMCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Quote Result', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('From: ${_quote!.fromToken}  →  To: ${_quote!.toToken}'),
            Text('To Amount: ${_quote!.toTokenAmount}'),
            Text('Estimated Gas: ${_quote!.estimatedGas}'),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: null, child: const Text('Swap (disabled in demo)')),
          ])),
        ],
      ),
    );
  }
}
