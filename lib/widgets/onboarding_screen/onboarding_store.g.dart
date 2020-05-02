// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardingStore on _OnboardingStore, Store {
  Computed<OnboardingState> _$stateComputed;

  @override
  OnboardingState get state =>
      (_$stateComputed ??= Computed<OnboardingState>(() => super.state)).value;

  final _$_stateAtom = Atom(name: '_OnboardingStore._state');

  @override
  OnboardingState get _state {
    _$_stateAtom.context.enforceReadPolicy(_$_stateAtom);
    _$_stateAtom.reportObserved();
    return super._state;
  }

  @override
  set _state(OnboardingState value) {
    _$_stateAtom.context.conditionallyRunInAction(() {
      super._state = value;
      _$_stateAtom.reportChanged();
    }, _$_stateAtom, name: '${_$_stateAtom.name}_set');
  }

  final _$_OnboardingStoreActionController =
      ActionController(name: '_OnboardingStore');

  @override
  void nextState() {
    final _$actionInfo = _$_OnboardingStoreActionController.startAction();
    try {
      return super.nextState();
    } finally {
      _$_OnboardingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'state: ${state.toString()}';
    return '{$string}';
  }
}
