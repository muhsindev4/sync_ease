import 'package:flutter/material.dart';
import '../src/utils.dart';

/// Navigate to a page.
///
/// Example:
/// ```dart
/// to(SecondPage());
/// ```
void to(
  Widget page,
) {
  Navigator.of(Utils.navigatorKey.currentContext!)
      .push(MaterialPageRoute(builder: (context) => page));
}

/// Navigate to a named route with optional arguments.
///
/// Example:
/// ```dart
/// toNamed('/details', arguments: {'id': 1});
/// ```
void toNamed(String routeName, {Map<String, dynamic>? arguments}) {
  Navigator.of(Utils.navigatorKey.currentContext!)
      .pushNamed(routeName, arguments: arguments);
}

/// Navigate back to the previous route with an optional result or arguments.
///
/// Example:
/// ```dart
/// back();
/// ```
void back({dynamic result, Map<String, dynamic>? arguments}) {
  Navigator.of(Utils.navigatorKey.currentContext!).pop(result ?? arguments);
}

/// Replace the current page with the provided page widget, optionally passing arguments.
///
/// Example:
/// ```dart
/// toReplace(MyReplacementPage(), arguments: {'refresh': true});
/// ```
void toReplace(Widget page, {Map<String, dynamic>? arguments}) {
  Navigator.of(Utils.navigatorKey.currentContext!).pushReplacement(
    MaterialPageRoute(builder: (context) => page),
    result: arguments,
  );
}

/// Replace the current route with a named route, optionally passing arguments.
///
/// Example:
/// ```dart
/// toReplaceNamed('/newPage', arguments: {'data': data});
/// ```
void toReplaceNamed(String routeName, {Map<String, dynamic>? arguments}) {
  Navigator.of(Utils.navigatorKey.currentContext!)
      .pushReplacementNamed(routeName, arguments: arguments);
}

/// Clear all existing routes and push the provided page onto the navigation stack, optionally with custom settings.
///
/// Example:
/// ```dart
/// toClearAndPush(MyHomePage(), settings: RouteSettings(name: '/home'));
/// ```
void toClearAndPush(Widget page, {RouteSettings? settings}) {
  Navigator.of(Utils.navigatorKey.currentContext!).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => page, settings: settings),
    (route) => false,
  );
}

/// Clear all existing routes and push a named route onto the navigation stack.
///
/// Example:
/// ```dart
/// toClearAndPushNamed('/dashboard');
/// ```
void toClearAndPushNamed(String routeName, {Map<String, dynamic>? arguments}) {
  Navigator.of(Utils.navigatorKey.currentContext!).pushNamedAndRemoveUntil(
    routeName,
    (route) => false,
    arguments: arguments,
  );
}

/// Push the provided page onto the navigation stack and remove all routes until a specified predicate is met.
///
/// Example:
/// ```dart
/// toPushAndClearAll(MyPage(), settings: RouteSettings(name: '/newPage'));
/// ```
void toPushAndClearAll(Widget page, {RouteSettings? settings}) {
  Navigator.of(Utils.navigatorKey.currentContext!).pushAndRemoveUntil(
    MaterialPageRoute(
      settings: settings,
      builder: (context) => page,
    ),
    (route) => false,
  );
}

/// Push the provided page onto the navigation stack and remove routes until a specified predicate is met.
///
/// Example:
/// ```dart
/// toPushAndClearUntil(MyPage(), ModalRoute.withName('/dashboard'));
/// ```
void toPushAndClearUntil(Widget page, RoutePredicate predicate,
    {RouteSettings? settings}) {
  Navigator.of(Utils.navigatorKey.currentContext!).pushAndRemoveUntil(
    MaterialPageRoute(
      settings: settings,
      builder: (context) => page,
    ),
    predicate,
  );
}

/// Push a named route onto the navigation stack and remove routes until a specified predicate is met.
///
/// Example:
/// ```dart
/// toPushNamedAndClearUntil('/login', ModalRoute.withName('/dashboard'));
/// ```
void toPushNamedAndClearUntil(String routeName, RoutePredicate predicate,
    {Map<String, dynamic>? arguments}) {
  Navigator.of(Utils.navigatorKey.currentContext!).pushNamedAndRemoveUntil(
    routeName,
    predicate,
    arguments: arguments,
  );
}

/// Removes all routes from the navigation stack and pushes the specified page with a fade transition with optional arguments without requiring a BuildContext.
///
/// This function is useful for clearing the navigation stack and starting a new route with a fade transition from anywhere in the app,
/// even outside the widget tree.
///
/// Example:
/// ```dart
/// toClearAndPushWithFade(MyPage(), arguments: {'showIntro': true});
/// ```
void toClearAndPushWithFade(Widget page, {RouteSettings? settings}) {
  Navigator.of(Utils.navigatorKey.currentContext!).pushAndRemoveUntil(
    PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    (route) => false,
  );
}
