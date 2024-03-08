import 'package:flutter/material.dart';
import '../src/sync_ease_logic.dart';

/// The LogicBuilder class is a StatefulWidget that rebuilds when the associated SyncEaseLogic state changes.
class LogicBuilder extends StatefulWidget {
  /// The logic instance associated with this builder.
  final SyncEaseLogic logic;

  /// The builder function that creates the UI based on the logic state.
  final Widget Function(BuildContext context) builder;

  /// Constructs a LogicBuilder widget.
  ///
  /// Parameters:
  ///   - logic: The SyncEaseLogic instance to be associated with this builder.
  ///   - builder: The builder function that creates the UI based on the logic state.
  const LogicBuilder({Key? key, required this.logic, required this.builder})
      : super(key: key);

  @override
  _LogicBuilderState createState() => _LogicBuilderState();
}

class _LogicBuilderState extends State<LogicBuilder> {
  @override
  void initState() {
    super.initState();
    widget.logic.addListener(_update);
  }

  @override
  void didUpdateWidget(LogicBuilder oldWidget) {
    if (widget.logic != oldWidget.logic) {
      oldWidget.logic.removeListener(_update);
      widget.logic.addListener(_update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.logic.removeListener(_update);
    super.dispose();
  }

  /// Callback function to update the state when the associated logic state changes.
  void _update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
