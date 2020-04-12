import 'package:flutter/material.dart' as flutter show debugPrint;
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:elola/models/progress.dart';

import 'i_progress_database.dart';

/// A database of the player's progress
class ProgressDatabase implements IProgressDatabase {
  /// A box to store progress
  Box<Progress> _box;

  /// A name for the box
  static const _boxName = 'progress';

  /// Initializes the database
  @override
  Future<void> init() async {
    if (_box == null) {
      _box = await Hive.openBox<Progress>(_boxName);
    }
  }

  /// Creates the database with a list of noun ids
  @override
  Future<void> create({@required Iterable<String> ids}) async {
    for (final id in ids) {
      await _box.put(
        id,
        Progress(id: id, attempts: 0, timesCorrect: 0),
      );
    }
  }

  /// Whether the database has data
  @override
  bool get hasData => _box != null && _box.length > 0;

  /// Returns progress by a given noun id
  ///
  /// If the id is not found, `null` is returned
  @override
  Progress getProgress({@required String id}) => hasData ? _box.get(id) : null;

  /// Updates the progress of a given noun
  @override
  void updateProgress({@required String id, @required bool answeredCorrectly}) {
    final progress = getProgress(id: id);
    if (progress != null) {
      progress.update(answeredCorrectly: answeredCorrectly);
      _box.put(id, progress);
    }
  }

  /// Resets all progress
  void reset() {
    for (final progress in _box.values) {
      progress.reset();
      _box.put(progress.id, progress);
    }
  }

  /// Prints the database to the console
  @override
  void debugPrint() {
    if (hasData) {
      _box.values.forEach((progress) => flutter.debugPrint(progress.toString()));
    }
  }
}
