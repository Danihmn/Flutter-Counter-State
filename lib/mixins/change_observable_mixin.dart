import 'package:curso_avancado_gerenciamento_estado/controllers/change_observable_controller.dart';
import 'package:flutter/material.dart';

mixin ChangeObservableMixin<T extends StatefulWidget> on State<T> {
  final List<ChangeObservableController> _changeObservableControllerList = [];

  void useObservable(ChangeObservableController changeObservableController) {
    changeObservableController.addListener(_callback);
    _changeObservableControllerList.add(changeObservableController);
  }

  void _callback() => setState(() {});

  @override
  void dispose() {
    super.dispose();
    for (var changeObservableController in _changeObservableControllerList) {
      changeObservableController.removeListener(_callback);
    }
  }
}
