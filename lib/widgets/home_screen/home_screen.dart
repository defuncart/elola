import 'package:flutter/material.dart';

import 'package:elola/localizations.dart';
import 'package:elola/widgets/home_screen/learn_screen/learn_screen.dart';
import 'package:elola/widgets/home_screen/settings_screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _navItems = const [
    const LearnScreen(),
    const SettingsScreen(),
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navItems[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            title: Text(AppLocalizations.homeScreenNavItemLearn),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(AppLocalizations.homeScreenNavItemSettings),
          ),
        ],
        onTap: (index) => setState(() => _index = index),
        currentIndex: _index,
      ),
    );
  }
}
