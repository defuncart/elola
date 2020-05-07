import 'package:elola/models/noun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core_logic/flutter_core_logic.dart' show ITextToSpeech;
import 'package:provider/provider.dart';

class NounListenButton extends StatefulWidget {
  final Noun noun;

  const NounListenButton({
    @required this.noun,
    Key key,
  })  : assert(noun != null),
        super(key: key);

  @override
  _NounListenButtonState createState() => _NounListenButtonState();
}

class _NounListenButtonState extends State<NounListenButton> {
  bool didResolveDependencies = false;
  ITextToSpeech tts;
  bool isPlaying = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!didResolveDependencies) {
      tts = Provider.of<ITextToSpeech>(context);
      didResolveDependencies = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.hearing,
        color: isPlaying ? Theme.of(context).accentColor : Theme.of(context).iconTheme.color,
      ),
      onPressed: () {
        if (!tts.isPlaying) {
          setState(() => isPlaying = true);
          tts.speak(widget.noun.inFull, onCompleted: () => setState(() => isPlaying = false));
        }
      },
    );
  }
}
