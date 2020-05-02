import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';

import 'package:elola/widgets/home_screen/settings_tab/settings_store.dart';
import 'package:elola/widgets/game_screen/game_screen.dart';
import 'package:elola/widgets/home_screen/home_screen_store.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final store = HomeScreenStore();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        body: store.currentTab,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 4.0,
          child: const Icon(Icons.play_arrow),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => GameScreen(),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _BottomNavButton(
                iconData: OMIcons.home,
                onPressed: () => store.onTabSelected(0),
                isSelected: store.index == 0,
              ),
              _BottomNavButton(
                iconData: Icons.lightbulb_outline,
                onPressed: () => store.onTabSelected(1),
                isSelected: store.index == 1,
              ),
              Icon(null),
              _BottomNavButton(
                iconData: Icons.timeline,
                onPressed: () => store.onTabSelected(2),
                isSelected: store.index == 2,
              ),
              _BottomNavButton(
                iconData: Icons.person_outline,
                onPressed: () => store.onTabSelected(3),
                isSelected: store.index == 3,
              ),
            ],
          ),
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
