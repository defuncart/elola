import 'package:elola/widgets/home_screen/coming_soon_tab/coming_soon_tab.dart';
import 'package:elola/widgets/home_screen/home_tab/home_tab.dart';
import 'package:elola/widgets/home_screen/settings_tab/settings_tab.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'home_screen_store.g.dart';

class HomeScreenStore = _HomeScreenStore with _$HomeScreenStore;

abstract class _HomeScreenStore with Store {
  @observable
  int _index = 0;

  @computed
  int get index => _index;

  @action
  void onTabSelected(int index) {
    if (index != _index && index >= 0 && index < _navItems.length) {
      _index = index;
    }
  }

  static final _navItems = [
    () => HomeTab(),
    () => CommingSoonTab(),
    () => CommingSoonTab(),
    () => SettingsTab(),
  ];

  Widget get currentTab => _navItems[_index]();
}
