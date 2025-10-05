
import 'dart:convert';
import 'package:http/http.dart' as http;

class OneInch {
  static const String base = 'https://api.1inch.dev/swap/v5.2';
  static String chain(int id)=>'$base/$id';
}

class DexQuote {
  final String fromToken;
  final String toToken;
  final String toTokenAmount;
  final String estimatedGas;
  DexQuote({required this.fromToken,required this.toToken,required this.toTokenAmount,required this.estimatedGas});
}

Future<DexQuote> fetchOneInchQuote({
  required int chainId,
  required String srcToken,
  required String dstToken,
  required String amountWei,
  required String apiKey,
}) async {
  final uri = Uri.parse('${OneInch.chain(chainId)}/quote?src=$srcToken&dst=$dstToken&amount=$amountWei');
  final res = await http.get(uri, headers: {'Authorization': 'Bearer $apiKey'});
  if (res.statusCode != 200) {
    throw Exception('1inch quote failed: ${res.statusCode} ${res.body}');
  }
  final j = jsonDecode(res.body);
  return DexQuote(
    fromToken: j['fromToken']['symbol'],
    toToken: j['toToken']['symbol'],
    toTokenAmount: j['toTokenAmount'].toString(),
    estimatedGas: j['estimatedGas'].toString(),
  );
}
