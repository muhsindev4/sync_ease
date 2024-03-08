import 'package:flutter/material.dart';

/// A utility class containing helper functions and variables.
class Utils {
  /// A map to store registered logic instances.
  static Map registeredLogics = {};

  ///Global Key
  static GlobalKey globalKey = GlobalKey();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
