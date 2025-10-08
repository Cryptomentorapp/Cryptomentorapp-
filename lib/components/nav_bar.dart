import 'package:flutter/material.dart';

class MainNavBar extends StatelessWidget {
  final int current;
  final ValueChanged<int> onTap;
  const MainNavBar({super.key, required this.current, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: current,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
        BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
      ],
    );
  }
}
