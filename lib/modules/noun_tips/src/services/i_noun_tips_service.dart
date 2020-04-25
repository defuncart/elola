import 'package:meta/meta.dart';

import '../models/tip.dart';

/// A service which offers various noun tips
abstract class INounTipsService {
  /// Initializes the service
  Future<void> init();

  /// Returns all tips for a given langauge
  List<LocalizedTip> tips({@required String language});
}
