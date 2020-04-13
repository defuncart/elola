/// A text to speech service.
abstract class ITextToSpeech {
  /// Whether text is currently being spoken.
  bool get isPlaying;

  /// Speaks a given text.
  ///
  /// Returns `true` if the tts engine successfully began speaking the given text, `false` otherwise.
  Future<bool> speak(String text);

  /// Stops the current text being spoken.
  ///
  /// Returns `true` if the tts engine was successfully stopped, `false` otherwise.
  Future<bool> stop();

  /// Sets the playback language
  Future<bool> setLanguage(String language);
}
