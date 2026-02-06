import 'package:curso_avancado_gerenciamento_estado/controllers/change_observable_value_controller.dart';
import 'package:flutter/material.dart';

mixin ChangeObservableValueMixin<T extends StatefulWidget> on State<T> {
  final List<ChangeObservableValueController>
  _changeObservableValueControllerList = [];

  void _callback() => setState(() {});

  void useObservableValue(
    ChangeObservableValueController changeObservableValueController,
  ) {
    changeObservableValueController.addListener(_callback);
    _changeObservableValueControllerList.add(changeObservableValueController);
  }

  @override
  void dispose() {
    super.dispose();
    for (var changeObservableValueController
        in _changeObservableValueControllerList) {
      changeObservableValueController.removeListener(_callback);
    }
  }
}
