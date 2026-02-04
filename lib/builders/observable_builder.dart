import 'package:curso_avancado_gerenciamento_estado/contracts/observable.dart';
import 'package:flutter/material.dart';

class ObservableBuilder extends StatefulWidget {
  final Observable observable;
  final Widget Function(BuildContext context) builder;

  const ObservableBuilder({
    super.key,
    required this.observable,
    required this.builder,
  });

  @override
  State<ObservableBuilder> createState() => _ObservableBuilderState();
}

class _ObservableBuilderState extends State<ObservableBuilder> {
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
