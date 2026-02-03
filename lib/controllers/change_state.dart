import 'package:curso_avancado_gerenciamento_estado/contracts/observable.dart';

class ChangeState implements Observable {
  final List<void Function()> _callbacks = [];

  @override
  void addListener(void Function() callback) {
    if (!_callbacks.contains(callback)) _callbacks.add(callback);
  }

  @override
  void removeListener(void Function() callback) {
    if (_callbacks.contains(callback)) _callbacks.remove(callback);
  }

  void notifyCallbacks() {
    for (var callback in _callbacks) {
      callback();
    }
  }
}
