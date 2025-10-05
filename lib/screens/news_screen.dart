
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/cards.dart';

class NewsScreen extends StatelessWidget{
  const NewsScreen({super.key});
  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){ await launchUrl(uri, mode: LaunchMode.externalApplication); }
  }
  @override
  Widget build(BuildContext context){
    final items=[
      {'title':'BTC sees spike in whale inflows', 'url':'https://www.coindesk.com/'},
      {'title':'ETH L2 fees hit monthly lows', 'url':'https://www.theblock.co/'},
      {'title':'Solana ecosystem raises new funding', 'url':'https://cointelegraph.com/'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (_,i)=>CMCard(child: ListTile(
          title: Text(items[i]['title']!),
          trailing: const Icon(Icons.open_in_new),
          onTap: ()=>_open(items[i]['url']!),
        )),
        separatorBuilder: (_,__)=>const SizedBox(height:12),
        itemCount: items.length,
      ),
    );
  }
}
