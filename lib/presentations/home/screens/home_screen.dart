import 'package:cbtdiaries_demo/presentations/diaries_grid/screens/diaries_screen.dart';
import 'package:cbtdiaries_demo/presentations/shared/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../settings/screens/settings_screen.dart';
import '../widgets/custom_bottom_nav_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(
        backgroundColor: Color(0xFFCBE7B5), icon: Icon(Icons.edit_document)),
    BottomNavigationBarItem(
        backgroundColor: Color(0xFFD6DEF9), icon: Icon(Icons.settings))
  ];
  final List<Widget> _homeScreens = [
    const DiariesScreen(),
    const SettingsScreen()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNavBar(
        items: _navBarItems,
        currentIndex: _currentIndex,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
      body: _homeScreens[_currentIndex],
    );
  }
}
