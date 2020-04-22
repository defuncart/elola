// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameScreenStore on _GameScreenStore, Store {
  Computed<bool> _$isShowingAnswerComputed;

  @override
  bool get isShowingAnswer => (_$isShowingAnswerComputed ??=
          Computed<bool>(() => super.isShowingAnswer))
      .value;
  Computed<Noun> _$currentNounComputed;

  @override
  Noun get currentNoun =>
      (_$currentNounComputed ??= Computed<Noun>(() => super.currentNoun)).value;

  final _$_currentIndexAtom = Atom(name: '_GameScreenStore._currentIndex');

  @override
  int get _currentIndex {
    _$_currentIndexAtom.context.enforceReadPolicy(_$_currentIndexAtom);
    _$_currentIndexAtom.reportObserved();
    return super._currentIndex;
  }

  @override
  set _currentIndex(int value) {
    _$_currentIndexAtom.context.conditionallyRunInAction(() {
      super._currentIndex = value;
      _$_currentIndexAtom.reportChanged();
    }, _$_currentIndexAtom, name: '${_$_currentIndexAtom.name}_set');
  }

  final _$_isShowingAnswerAtom =
      Atom(name: '_GameScreenStore._isShowingAnswer');

  @override
  bool get _isShowingAnswer {
    _$_isShowingAnswerAtom.context.enforceReadPolicy(_$_isShowingAnswerAtom);
    _$_isShowingAnswerAtom.reportObserved();
    return super._isShowingAnswer;
  }

  @override
  set _isShowingAnswer(bool value) {
    _$_isShowingAnswerAtom.context.conditionallyRunInAction(() {
      super._isShowingAnswer = value;
      _$_isShowingAnswerAtom.reportChanged();
    }, _$_isShowingAnswerAtom, name: '${_$_isShowingAnswerAtom.name}_set');
  }

  final _$_GameScreenStoreActionController =
      ActionController(name: '_GameScreenStore');

  @override
  bool shouldContinue() {
    final _$actionInfo = _$_GameScreenStoreActionController.startAction();
    try {
      return super.shouldContinue();
    } finally {
      _$_GameScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isShowingAnswer: ${isShowingAnswer.toString()},currentNoun: ${currentNoun.toString()}';
    return '{$string}';
  }
}
