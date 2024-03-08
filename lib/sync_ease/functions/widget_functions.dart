import 'package:flutter/material.dart';
import '../src/utils.dart';

/// Shows a [SnackBar] using the [ScaffoldMessenger] without requiring a BuildContext.
///
/// This function is useful for showing snack bars from anywhere in the app, even
/// outside the widget tree.
///
/// Example:
/// ```dart
/// showSyncSnackBar(SnackBar(content: Text('Hello, world!')));
/// ```
showSyncSnackBar(SnackBar snackBar) {
  ScaffoldMessenger.of(Utils.navigatorKey.currentContext!)
      .showSnackBar(snackBar);
}

/// Shows an alert dialog using [showDialog] without requiring a BuildContext.
///
/// This function is useful for showing alert dialogs from anywhere in the app,
/// even outside the widget tree.
///
/// Example:
/// ```dart
/// showSyncAlertBox(
///   builder: (BuildContext context) => AlertDialog(
///     title: Text('Alert'),
///     content: Text('This is an alert dialog.'),
///   ),
/// );
/// ```
showSyncAlertBox({
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  Color? barrierColor,
  String? barrierLabel,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  TraversalEdgeBehavior? traversalEdgeBehavior,
}) {
  showDialog(
      context: Utils.navigatorKey.currentContext!,
      builder: builder,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      traversalEdgeBehavior: traversalEdgeBehavior);
}

/// Shows a date picker using [showDatePicker] without requiring a BuildContext.
///
/// This function is useful for showing date pickers from anywhere in the app,
/// even outside the widget tree.
///
/// Example:
/// ```dart
/// showSyncDatePicker(
///   initialDate: DateTime.now(),
///   firstDate: DateTime(2022),
///   lastDate: DateTime(2025),
/// );
/// ```
showSyncDatePicker({
  DateTime? initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? currentDate,
  DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  SelectableDayPredicate? selectableDayPredicate,
  String? helpText,
  String? cancelText,
  String? confirmText,
  Locale? locale,
  bool barrierDismissible = true,
  Color? barrierColor,
  String? barrierLabel,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  TextDirection? textDirection,
  TransitionBuilder? builder,
  DatePickerMode initialDatePickerMode = DatePickerMode.day,
  String? errorFormatText,
  String? errorInvalidText,
  String? fieldHintText,
  String? fieldLabelText,
  TextInputType? keyboardType,
  Offset? anchorPoint,
  final ValueChanged<DatePickerEntryMode>? onDatePickerModeChange,
  final Icon? switchToInputEntryModeIcon,
  final Icon? switchToCalendarEntryModeIcon,
}) {
  initialDate = initialDate == null ? null : DateUtils.dateOnly(initialDate);
  firstDate = DateUtils.dateOnly(firstDate);
  lastDate = DateUtils.dateOnly(lastDate);
  assert(
    !lastDate.isBefore(firstDate),
    'lastDate $lastDate must be on or after firstDate $firstDate.',
  );
  assert(
    initialDate == null || !initialDate.isBefore(firstDate),
    'initialDate $initialDate must be on or after firstDate $firstDate.',
  );
  assert(
    initialDate == null || !initialDate.isAfter(lastDate),
    'initialDate $initialDate must be on or before lastDate $lastDate.',
  );
  assert(
    selectableDayPredicate == null ||
        initialDate == null ||
        selectableDayPredicate(initialDate),
    'Provided initialDate $initialDate must satisfy provided selectableDayPredicate.',
  );
  showDatePicker(
      context: Utils.navigatorKey.currentContext!,
      firstDate: firstDate,
      lastDate: lastDate);
}
