import 'package:elola/modules/user_settings/user_settings.dart';
import 'package:mobx/mobx.dart';

part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStore with _$OnboardingStore;

abstract class _OnboardingStore with Store {
  final ISettingsDatabase _settingsDatabase;

  _OnboardingStore(this._settingsDatabase);

  @observable
  OnboardingState _state = OnboardingState.start;

  @computed
  OnboardingState get state => _state;

  @action
  void nextState() {
    if (_state == OnboardingState.start) {
      _state = OnboardingState.tutorial;
    } else if (_state == OnboardingState.tutorial) {
      _state = OnboardingState.end;
    } else if (_state == OnboardingState.end) {
      _settingsDatabase.hasOnboarded = true;
    }
  }
}

enum OnboardingState {
  start,
  tutorial,
  end,
}
