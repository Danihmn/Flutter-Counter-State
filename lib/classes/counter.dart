import 'package:curso_avancado_gerenciamento_estado/controllers/change_observable_controller.dart';

class Counter extends ChangeObservableController {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}
