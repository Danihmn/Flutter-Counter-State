import 'package:curso_avancado_gerenciamento_estado/contracts/observable_state.dart';
import 'package:curso_avancado_gerenciamento_estado/controllers/change_state_controller.dart';

class ChangeObservableStateController<T> extends ChangeStateController
    implements ObservableState {
  T _state;

  ChangeObservableStateController(this._state);

  @override
  T get state => _state;

  set state(T value) {
    if (value == _state) return;

    _state = value;
    notifyCallbacks();
  }
}
