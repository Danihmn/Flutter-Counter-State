import 'package:curso_avancado_gerenciamento_estado/contracts/observable_value.dart';
import 'package:curso_avancado_gerenciamento_estado/controllers/change_observable_controller.dart';

class ChangeObservableValueController<T> extends ChangeObservableController
    implements ObservableValue {
  T _value;

  ChangeObservableValueController(this._value);

  @override
  T get value => _value;

  set value(T value) {
    if (value == _value) return;

    _value = value;
    notifyListeners();
  }
}
