import 'package:flutter/material.dart';
import '../src/ease.dart';

/// The EaseBuilder class is a StatefulWidget that rebuilds when the associated Ease state changes.
class EaseBuilder<T> extends StatefulWidget {
  final Ease<T> ease;
  final Widget Function(BuildContext context, T value) builder;

  /// Constructor for creating a new EaseBuilder with an Ease instance and a builder function.
  const EaseBuilder({Key? key, required this.ease, required this.builder})
      : super(key: key);

  @override
  _EaseBuilderState<T> createState() => _EaseBuilderState<T>();
}

class _EaseBuilderState<T> extends State<EaseBuilder<T>> {
  @override
  void initState() {
    super.initState();
    widget.ease.addListener(_update);
  }

  @override
  void didUpdateWidget(EaseBuilder<T> oldWidget) {
    if (widget.ease != oldWidget.ease) {
      oldWidget.ease.removeListener(_update);
      widget.ease.addListener(_update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.ease.removeListener(_update);
    super.dispose();
  }

  /// Callback function to rebuild the widget when the associated Ease state changes.
  void _update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.ease.value);
  }
}
