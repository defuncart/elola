import 'package:flutter/material.dart';

import 'package:elola/widgets/home_screen/coming_soon_tab/coming_soon_tab.dart';
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
    const CommingSoonTab(),
    const CommingSoonTab(),
    const SettingsScreen(),
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navItems[_index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 4.0,
        child: const Icon(Icons.play_arrow),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => setState(() => _index = 0),
            ),
            IconButton(
              icon: Icon(Icons.lightbulb_outline),
              onPressed: () => setState(() => _index = 1),
            ),
            Icon(null),
            IconButton(
              icon: Icon(Icons.trending_up),
              onPressed: () => setState(() => _index = 2),
            ),
            IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () => setState(() => _index = 3),
            ),
          ],
        ),
      ),
    );
  }
}
