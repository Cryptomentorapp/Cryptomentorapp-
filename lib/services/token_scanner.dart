import 'dart:convert';
import 'dart:io';

class ScanResult{
  final String verdict; final List<String> badges;
  ScanResult(this.verdict, this.badges);
}

class TokenScanner{
  final String? etherscanKey; final String? bscscanKey;
  TokenScanner({this.etherscanKey, this.bscscanKey});

  Future<ScanResult> scan(String address, {String chain='eth'}) async {
    if(address.length < 20){ return ScanResult('High risk: address quá ngắn/không hợp lệ', ['High Risk']); }
    final badges = <String>[];
    try{
      if(chain=='eth'){
        final key = etherscanKey ?? '';
        final uri = Uri.parse('https://api.etherscan.io/api?module=contract&action=getsourcecode&address=$address&apikey=$key');
        final http = HttpClient(); final req = await http.getUrl(uri); final res = await req.close();
        final body = await res.transform(utf8.decoder).join();
        if(body.contains('ContractSourceCode')) badges.add('Verified? ' + (body.contains('"ContractSourceCode":"') ? 'Yes':'No'));
      }
    }catch(_){}
    if(!badges.any((b)=>b.contains('Verified'))) badges.add('Verified? Unknown');
    return ScanResult('Demo checks hoàn tất', badges);
  }
}
