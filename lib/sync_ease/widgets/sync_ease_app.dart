import 'package:flutter/material.dart';
import '../src/utils.dart';

/// A custom MaterialApp widget with simplified setup for SyncEase applications.
class SyncEaseApp extends StatelessWidget {
  /// Creates a SyncEaseApp.
  ///
  /// Parameters:
  ///   - home: The widget for the default route of the app.
  const SyncEaseApp({
    Key? key,
    required this.home,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.onNavigationNotification,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.themeAnimationDuration = kThemeAnimationDuration,
    this.themeAnimationCurve = Curves.linear,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.useInheritedMediaQuery = false,
  }) : super(key: key);

  /// The widget for the default route of the app.
  final Widget home;

  /// A key to use for the Navigator.
  final GlobalKey<NavigatorState>? navigatorKey;

  /// A key to use for the ScaffoldMessenger.
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  /// A map of named routes for the app.
  final Map<String, WidgetBuilder> routes;

  /// The name of the first route to show, if a Navigator is used.
  final String? initialRoute;

  /// A callback to create a route.
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;

  /// A callback to return a list of initial routes.
  final List<Route<dynamic>> Function(String)? onGenerateInitialRoutes;

  /// A callback for handling unknown routes.
  final Route<dynamic>? Function(RouteSettings)? onUnknownRoute;

  /// A callback for handling system navigation notifications.
  final bool Function(NavigationNotification)? onNavigationNotification;

  /// A list of observers for the Navigator.
  final List<NavigatorObserver> navigatorObservers;

  /// A builder for the top-level Navigator.
  final Widget Function(BuildContext, Widget?)? builder;

  /// The title of the application.
  final String title;

  /// A callback to generate the application's title.
  final String Function(BuildContext)? onGenerateTitle;

  /// The primary color of the application.
  final Color? color;

  /// The theme to use for the application.
  final ThemeData? theme;

  /// The dark theme to use for the application.
  final ThemeData? darkTheme;

  /// The high contrast theme to use for the application.
  final ThemeData? highContrastTheme;

  /// The high contrast dark theme to use for the application.
  final ThemeData? highContrastDarkTheme;

  /// The mode for the application's theme.
  final ThemeMode themeMode;

  /// The duration of the theme animation.
  final Duration themeAnimationDuration;

  /// The curve for the theme animation.
  final Curve themeAnimationCurve;

  /// The locale for the application.
  final Locale? locale;

  /// The delegates for localizing the application's text.
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// A callback for resolving the list of locales.
  final Locale? Function(List<Locale>?, Iterable<Locale>)?
      localeListResolutionCallback;

  /// A callback for resolving the locale.
  final Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback;

  /// The list of supported locales for the application.
  final Iterable<Locale> supportedLocales;

  /// Whether to show a grid overlay for debugging the application's layout.
  final bool debugShowMaterialGrid;

  /// Whether to show performance overlay.
  final bool showPerformanceOverlay;

  /// Whether to overlay the checkerboard pattern for raster cache images.
  final bool checkerboardRasterCacheImages;

  /// Whether to overlay the checkerboard pattern for offscreen layers.
  final bool checkerboardOffscreenLayers;

  /// Whether to show the semantics debugger tool.
  final bool showSemanticsDebugger;

  /// Whether to show the debug banner.
  final bool debugShowCheckedModeBanner;

  /// The map of shortcuts to actions.
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// The map of actions to use with the shortcuts.
  final Map<Type, Action<Intent>>? actions;

  /// The restoration ID to save and restore the state of the app.
  final String? restorationScopeId;

  /// The default scroll behavior for the application.
  final ScrollBehavior? scrollBehavior;

  /// Whether to use the inherited MediaQuery.
  final bool useInheritedMediaQuery;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Utils.globalKey,
      navigatorKey: navigatorKey ?? Utils.navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: home,
      routes: routes,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      onNavigationNotification: onNavigationNotification,
      navigatorObservers: navigatorObservers,
      builder: builder,
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      theme: theme,
      darkTheme: darkTheme,
      highContrastTheme: highContrastTheme,
      highContrastDarkTheme: highContrastDarkTheme,
      themeMode: themeMode,
      themeAnimationDuration: themeAnimationDuration,
      themeAnimationCurve: themeAnimationCurve,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      debugShowMaterialGrid: debugShowMaterialGrid,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
      restorationScopeId: restorationScopeId,
      scrollBehavior: scrollBehavior,
      useInheritedMediaQuery: useInheritedMediaQuery,
    );
  }
}
