import 'package:curso_avancado_gerenciamento_estado/controllers/change_observable_state_controller.dart';
import 'package:flutter/material.dart';

class ObservableStateBuilder<T> extends StatefulWidget {
  final ChangeObservableStateController<T> observableStateController;
  final Widget Function(BuildContext context, T state) builder;
  final bool Function(T oldState, T newState) buildWhen;

  const ObservableStateBuilder({
    super.key,
    required this.observableStateController,
    required this.builder,
    required this.buildWhen,
  });

  @override
  State<ObservableStateBuilder<T>> createState() =>
      _ObservableStateBuilderState<T>();
}

class _ObservableStateBuilderState<T> extends State<ObservableStateBuilder<T>> {
  late T state;

  void callback() {
    if (widget.buildWhen(state, widget.observableStateController.state)) {
      state = widget.observableStateController.state;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    widget.observableStateController.addListener(callback);
    state = widget.observableStateController.state;
  }

  @override
  void dispose() {
    super.dispose();
    widget.observableStateController.removeListener(callback);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, state);
  }
}
