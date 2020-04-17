import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';

import 'package:elola/widgets/home_screen/coming_soon_tab/coming_soon_tab.dart';
import 'package:elola/widgets/home_screen/learn_tab/learn_tab.dart';
import 'package:elola/widgets/home_screen/settings_tab/settings_tab.dart';
import 'package:elola/widgets/home_screen/settings_tab/settings_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final _navItems = [
    () => LearnTab(),
    () => CommingSoonTab(),
    () => CommingSoonTab(),
    () => SettingsTab(),
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navItems[_index](),
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
            _BottomNavButton(
              iconData: OMIcons.home,
              onPressed: () => setState(() => _index = 0),
              isSelected: _index == 0,
            ),
            _BottomNavButton(
              iconData: Icons.lightbulb_outline,
              onPressed: () => setState(() => _index = 1),
              isSelected: _index == 1,
            ),
            Icon(null),
            _BottomNavButton(
              iconData: Icons.trending_up,
              onPressed: () => setState(() => _index = 2),
              isSelected: _index == 2,
            ),
            _BottomNavButton(
              iconData: Icons.person_outline,
              onPressed: () => setState(() => _index = 3),
              isSelected: _index == 3,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavButton extends StatelessWidget {
  final IconData iconData;
  final void Function() onPressed;
  final bool isSelected;

  const _BottomNavButton({
    @required this.iconData,
    @required this.onPressed,
    @required this.isSelected,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData),
      onPressed: onPressed,
      color: isSelected
          ? Theme.of(context).accentColor
          // TODO define colors
          : (Provider.of<SettingsStore>(context).isDarkMode ? Colors.white : Colors.black),
    );
  }
}
