import 'package:blocmarket/screens/chats_bloc_screen.dart';
import 'package:blocmarket/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'screens/profile_screen.dart';

class TabBarMain extends StatefulWidget {
  const TabBarMain({super.key});

  @override
  State<TabBarMain> createState() => _TabBarMainState();
}

class _TabBarMainState extends State<TabBarMain> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const ChatsBlocScreen(),
    const ProfileScreen(),
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_max,
                size: 24.0,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline_outlined,
                size: 24.0,
              ),
              label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 24.0,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
