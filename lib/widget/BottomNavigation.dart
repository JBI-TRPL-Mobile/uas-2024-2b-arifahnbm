import 'package:flutter/material.dart';
import 'package:template_project/screens/home_screen.dart';
import 'package:template_project/screens/message_screen.dart';
import 'package:template_project/screens/profile_screen.dart';
class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});
  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}
class _BottomnavigationState extends State<Bottomnavigation> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}