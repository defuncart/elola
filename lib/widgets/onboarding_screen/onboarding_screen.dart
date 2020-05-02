import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/configs/route_names.dart';
import 'package:elola/enums/game_mode.dart';
import 'package:elola/widgets/game_screen/game_screen.dart';
import 'package:elola/widgets/game_screen/game_screen_store.dart';
import 'package:elola/widgets/onboarding_screen/onboarding_store.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<OnboardingStore>(context);

    return Observer(
      builder: (_) {
        switch (store.state) {
          case OnboardingState.start:
            return _OnboardingStart();
          case OnboardingState.tutorial:
            return Scaffold(
              body: GameScreenBody(
                onCompleted: () => store.nextState(),
              ),
            );
          case OnboardingState.end:
            return _OnboardingEnd();
        }

        return Container();
      },
    );
  }
}

class _OnboardingStart extends StatelessWidget {
  const _OnboardingStart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.appTitle,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text(AppLocalizations.onboardingStartDescriptionLabel),
              RaisedButton(
                onPressed: () {
                  Provider.of<GameScreenStore>(context, listen: false).setUpGame(
                    gameMode: GameMode.tutorial,
                  );
                  Provider.of<GameScreenStore>(context, listen: false).startGame();
                  Provider.of<OnboardingStore>(context, listen: false).nextState();
                },
                child: Text(AppLocalizations.generalGetStarted),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingEnd extends StatelessWidget {
  const _OnboardingEnd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.onboardingEndTitelLabel,
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
                Text(AppLocalizations.onboardingEndDescriptionLabel),
                Text(AppLocalizations.onboardingEndTestInfoLabel),
                RaisedButton(
                  onPressed: () {
                    Provider.of<OnboardingStore>(context, listen: false).nextState();
                    Navigator.of(context).pushReplacementNamed(RouteNames.homeScreen);
                  },
                  child: Text(AppLocalizations.generalContinue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
