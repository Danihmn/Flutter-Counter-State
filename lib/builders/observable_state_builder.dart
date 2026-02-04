import 'package:curso_avancado_gerenciamento_estado/contracts/observable.dart';
import 'package:flutter/material.dart';

class ObservableStateBuilder extends StatefulWidget {
  final Observable observable;
  final Widget Function(BuildContext context) builder;

  const ObservableStateBuilder({
    super.key,
    required this.observable,
    required this.builder,
  });

  @override
  State<ObservableStateBuilder> createState() => _ObservableStateBuilderState();
}

class _ObservableStateBuilderState extends State<ObservableStateBuilder> {
  void rebuild() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.observable.addListener(rebuild);
  }

  @override
  void dispose() {
    super.dispose();
    widget.observable.removeListener(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
