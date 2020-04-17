// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeScreenStore on _HomeScreenStore, Store {
  Computed<int> _$indexComputed;

  @override
  int get index => (_$indexComputed ??= Computed<int>(() => super.index)).value;

  final _$_indexAtom = Atom(name: '_HomeScreenStore._index');

  @override
  int get _index {
    _$_indexAtom.context.enforceReadPolicy(_$_indexAtom);
    _$_indexAtom.reportObserved();
    return super._index;
  }

  @override
  set _index(int value) {
    _$_indexAtom.context.conditionallyRunInAction(() {
      super._index = value;
      _$_indexAtom.reportChanged();
    }, _$_indexAtom, name: '${_$_indexAtom.name}_set');
  }

  final _$_HomeScreenStoreActionController =
      ActionController(name: '_HomeScreenStore');

  @override
  void onTabSelected(int index) {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction();
    try {
      return super.onTabSelected(index);
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'index: ${index.toString()}';
    return '{$string}';
  }
}
