import 'package:elola/models/noun.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:elola/modules/text_to_speech/text_to_speech.dart';
import 'package:mobx/mobx.dart';

part 'game_screen_store.g.dart';

// TODO move to a better location
const numberQuestionsPerRound = 1;

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

  List<Noun> _nouns;
  int _score;

  int get score => _score;

  @observable
  int _currentIndex = 0;

  @observable
  bool _isShowingAnswer = false;

  @computed
  bool get isShowingAnswer => _isShowingAnswer;

  @computed
  Noun get currentNoun => _nouns[_currentIndex];

  void nextRound() {
    print('nextRound');
    _score = 0;
    _currentIndex = 0;
    _isShowingAnswer = false;
    final ids = _playerDataService.weakestNouns(count: numberQuestionsPerRound);
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

    return false;
  }
}
