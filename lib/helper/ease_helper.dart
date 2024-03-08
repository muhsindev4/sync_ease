import 'package:flutter/cupertino.dart';
import 'package:sync_ease/sync_ease/src/utils.dart';

/// The EaseHelper class provides utility functions for retrieving screen dimensions.
class EaseHelper {
  /// Returns the height of the screen.
  static double get height =>
      MediaQuery.of(Utils.globalKey.currentContext!).size.height;

  /// Returns the width of the screen.
  static double get width =>
      MediaQuery.of(Utils.globalKey.currentContext!).size.width;

}
