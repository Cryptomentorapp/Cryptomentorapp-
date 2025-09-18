import 'package:flutter/material.dart';
import '../theme/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(children: [
              Container(width: 34, height: 34, decoration: BoxDecoration(color: CMColors.surface2, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.menu, size: 20, color: CMColors.text)),
              const SizedBox(width: 12),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Cryptomentor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: CMColors.text)),
                SizedBox(height: 2),
                Text('AI Trading Suite', style: TextStyle(fontSize: 12, color: CMColors.textDim)),
              ]),
              const Spacer(),
              Container(decoration: BoxDecoration(color: CMColors.gold, borderRadius: BorderRadius.circular(24)), padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), child: const Text('Giao diện', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700))),
            ]),
          ),
        ),
      ),
      body: ListView(padding: const EdgeInsets.symmetric(horizontal: 12), children: [
        // Modules grid
        Container(decoration: BoxDecoration(color: CMColors.surface, borderRadius: BorderRadius.circular(22), boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0,2))]), padding: const EdgeInsets.fromLTRB(16,16,16,10), margin: const EdgeInsets.only(bottom: 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [Text('Modules', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)), Spacer(), Text('8 tab topside', style: TextStyle(color: CMColors.textDim, fontSize: 12))]),
            const SizedBox(height: 14),
            GridView.count(physics: const NeverScrollableScrollPhysics(), crossAxisCount: 4, shrinkWrap: true, childAspectRatio: .85, children: const [
              _Module(icon: Icons.show_chart_rounded, title: 'Tra...', sub: 'Sign...'),
              _Module(icon: Icons.shield_moon_outlined, title: 'Tok...', sub: 'Scam'),
              _Module(icon: Icons.manage_search_rounded, title: 'Res...', sub: 'Hub'),
              _Module(icon: Icons.extension_outlined, title: 'NFT', sub: 'Meme'),
              _Module(icon: Icons.info_outline, title: 'CMT', sub: 'Info'),
              _Module(icon: Icons.sailing_outlined, title: 'Wh...', sub: 'Trac...'),
              _Module(icon: Icons.school_outlined, title: 'Aca...', sub: '...'),
              _Module(icon: Icons.newspaper_outlined, title: 'News', sub: ''),
            ]),
          ]),
        ),
        // Market Overview
        Container(decoration: BoxDecoration(color: CMColors.surface, borderRadius: BorderRadius.circular(22)), margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.fromLTRB(16,16,16,16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [const Text('Market Overview', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)), const Spacer(),
              Container(decoration: BoxDecoration(color: CMColors.gold, borderRadius: BorderRadius.circular(24)), padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), child: const Text('Dashboard', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700))),
            ]),
            const SizedBox(height: 12),
            Row(children: const [_SkeletonBox(), SizedBox(width: 10), _SkeletonBox(), SizedBox(width: 10), _SkeletonBox()]),
          ]),
        ),
        const Padding(padding: EdgeInsets.only(top: 6, bottom: 80), child: Text('Tin mới', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800))),
      ]),
    );
  }
}

class _Module extends StatelessWidget {
  final IconData icon;
  final String title;
  final String sub;
  const _Module({required this.icon, required this.title, required this.sub});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(height: 42, width: 42, decoration: BoxDecoration(color: CMColors.surface2, borderRadius: BorderRadius.circular(12)), child: Icon(icon, size: 22, color: CMColors.gold)),
      const SizedBox(height: 6),
      Text(title, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700)),
      if (sub.isNotEmpty) Text(sub, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, color: CMColors.textDim)),
    ]);
  }
}

class _SkeletonBox extends StatelessWidget {
  const _SkeletonBox();
  @override
  Widget build(BuildContext context) => Expanded(child: Container(height: 72, decoration: BoxDecoration(color: CMColors.surface2, borderRadius: BorderRadius.circular(16))));
}