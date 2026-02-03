import 'package:curso_avancado_gerenciamento_estado/controllers/change_state_controller.dart';

class CounterState extends ChangeStateController {
  int counter = 0;

  void increment() {
    counter++;
    notifyCallbacks();
  }
}
