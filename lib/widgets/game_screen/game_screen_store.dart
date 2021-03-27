import 'dart:ui';

import 'package:elola/configs/game_mode_settings.dart';
import 'package:elola/enums/game_mode.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:flutter_core_logic/flutter_core_logic.dart' show ITextToSpeech;
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'game_screen_store.g.dart';

class GameScreenStore = _GameScreenStore with _$GameScreenStore;

abstract class _GameScreenStore with Store {
  final INounDatabase _nounDatabase;
  final IPlayerDataService _playerDataService;
  final ITextToSpeech _textToSpeech;

  _GameScreenStore(this._nounDatabase, this._playerDataService, this._textToSpeech) {
    print('GameScreenStore()');
  }

  void dispose() {
    print('GameScreenStore: dispose()');
  }

  int _numberQuestionsPerRound;
  int get numberQuestionsPerRound => _numberQuestionsPerRound;

  List<Noun> _nouns;
  List<String> get nounIcons => _nouns.map((noun) => noun.emoji).toList();

  int _score;

  bool _isGameInProgress = false;
  bool get inProgress => _isGameInProgress;
  set inProgress(bool value) {
    _isGameInProgress = value;
    _playerDataService.updateTimeSpent(isPlaying: _isGameInProgress);
  }

  int get score => _score;

  GameMode _gameMode;
  GameMode get gameMode => _gameMode;

  @observable
  int _currentIndex = 0;

  @observable
  bool _isShowingAnswer = false;

  @computed
  bool get isShowingAnswer => _isShowingAnswer;

  @computed
  Noun get currentNoun => _nouns[_currentIndex];

  void setUpGame({@required GameMode gameMode}) {
    assert(gameMode != null);

    _gameMode = gameMode;
  }

  void startGame() {
    assert(inProgress == false);

    _nextRound();
    inProgress = true;
  }

  void _nextRound() {
    _score = 0;
    _currentIndex = 0;
    _isShowingAnswer = false;

    // determine nouns
    _numberQuestionsPerRound = GameModeSettings.numberNouns(gameMode: _gameMode);
    List<String> ids;
    switch (_gameMode) {
      case GameMode.learn:
        ids = _playerDataService.nextNouns(count: _numberQuestionsPerRound);
        break;
      case GameMode.revision:
        ids = _playerDataService.revisionNouns(count: _numberQuestionsPerRound);
        break;
      case GameMode.difficult:
        ids = _playerDataService.difficultNouns(count: _numberQuestionsPerRound);
        break;
      case GameMode.tutorial:
        ids = ['man', 'woman', 'boy', 'girl'];
        break;
    }
    _nouns = _nounDatabase.getNounsByIds(ids);
  }

  void answerChosen(int index) {
    bool correct = index == currentNoun.gender;
    _playerDataService.updateProgress(id: currentNoun.id, answeredCorrectly: correct);
    if (correct) {
      _score++;
    }

    _textToSpeech.speak(currentNoun.inFull);

    _isShowingAnswer = true;
  }

  @action
  bool shouldContinue() {
    if (_currentIndex < numberQuestionsPerRound - 1) {
      _currentIndex++;
      _isShowingAnswer = false;
      return true;
    }

    inProgress = false;
    return false;
  }

  void screenDisposed() {
    if (inProgress) {
      inProgress = false;
    }
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (inProgress && (state == AppLifecycleState.inactive || state == AppLifecycleState.paused)) {
      inProgress = false;
    } else if (!inProgress && state == AppLifecycleState.resumed) {
      inProgress = true;
    }
  }
}
