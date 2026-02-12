import 'package:curso_avancado_gerenciamento_estado/controllers/change_observable_controller.dart';
import 'package:curso_avancado_gerenciamento_estado/controllers/change_observable_value_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Should test ChangeObservableController", () {
    test('Should increment ChangeObservable', () {
      // Arrange
      final changeValue = _CounterStateObservable();

      // Act
      changeValue.increment();

      // Assert
      expect(changeValue.count, 1);
    });

    test('Should call Callback', () {
      // Arrange
      bool callbackCalled = false;
      final changeValue = _CounterStateObservable();

      void callback() {
        callbackCalled = true;
      }

      // Act
      changeValue.addListener(() {
        callback();
      });
      changeValue.increment();

      // Assert
      expect(callbackCalled, true);
    });
  });

  test('Should increment ChangeObservableValue', () {
    final changeValue = ChangeObservableValueController(0);
    changeValue.value++;

    expect(changeValue.value, 1);
  });
}

class _CounterStateObservable extends ChangeObservableController {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
