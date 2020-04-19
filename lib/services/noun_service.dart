import 'package:elola/models/noun.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/noun_of_the_day/noun_of_the_day.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:elola/services/i_noun_service.dart';

/// A convenience service which returns nouns depending on certain conditions
class NounService implements INounService {
  final INounDatabase _nounDatabase;
  final IPlayerDataService _playerDataService;
  final INounOfTheDayService _nounOfTheDayService;

  const NounService(this._nounDatabase, this._playerDataService, this._nounOfTheDayService);

  /// Returns the `Noun` of the day, if applicable, otherwise `null`.
  @override
  Noun get nounOfTheDay {
    final nounId = _nounOfTheDayService.today;
    return nounId != null ? _nounDatabase.getNoun(id: nounId) : null;
  }

  /// Returns a list of nouns marked as favorites
  @override
  List<Noun> get favorites {
    final ids = _playerDataService.favorites;
    return _nounDatabase.getNounsByIds(ids);
  }
}
