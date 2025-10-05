
import 'dart:convert';
import 'package:http/http.dart' as http;

class AI {
  static String baseUrl = 'https://your-ai-endpoint.example.com'; // TODO: change to real backend
}

Future<String> askAI(String prompt) async {
  try{
    final res = await http.post(Uri.parse('${AI.baseUrl}/cm/review'),
      headers: {'Content-Type':'application/json'},
      body: jsonEncode({'q': prompt})
    );
    if(res.statusCode==200){
      final j = jsonDecode(res.body);
      return j['answer']?.toString() ?? 'AI: (no answer)';
    }
    return 'AI error: ${res.statusCode}';
  }catch(e){
    return 'AI offline (demo): $prompt';
  }
}
