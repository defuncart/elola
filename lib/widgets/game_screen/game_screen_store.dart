import 'package:elola/models/noun.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:elola/modules/text_to_speech/text_to_speech.dart';
import 'package:mobx/mobx.dart';

part 'game_screen_store.g.dart';

class GameScreenStore = _GameScreenStore with _$GameScreenStore;

abstract class _GameScreenStore with Store {
  static const _numberQuestionsPerRound = 10;

  final INounDatabase _nounDatabase;
  final IPlayerDataService _playerDataService;
  final ITextToSpeech _textToSpeech;

  List<Noun> _nouns;

  @observable
  int _currentIndex = 0;

  @observable
  bool _isShowingAnswer = false;

  @computed
  bool get isShowingAnswer => _isShowingAnswer;

  @computed
  Noun get currentNoun => _nouns[_currentIndex];

  _GameScreenStore(this._nounDatabase, this._playerDataService, this._textToSpeech) {
    _nextRound();
  }

  void dispose() {
    print('GameScreenStore: Dispose');
  }

  void _nextRound() {
    final ids = _playerDataService.weakestNouns(count: 10);
    _nouns = _nounDatabase.getNounsByIds(ids);
    _nouns.forEach((n) => print('${n.inFull}'));
  }

  void answerChosen(int index) {
    bool correct = index == currentNoun.gender;
    _playerDataService.updateProgress(id: currentNoun.id, answeredCorrectly: correct);

    _textToSpeech.speak(currentNoun.inFull);

    _isShowingAnswer = true;
  }

  @action
  bool shouldContinue() {
    if (_currentIndex < _numberQuestionsPerRound - 1) {
      _currentIndex++;
      _isShowingAnswer = false;
      return true;
    }

    return false;
  }
}
