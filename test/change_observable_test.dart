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

  group("Should test ChangeObservableValue", () {
    test('Should increment ChangeObservableValue', () {
      // Arrange
      final changeValue = ChangeObservableValueController(0);

      // Act
      changeValue.value++;

      // Assert
      expect(changeValue.value, 1);
    });

    test('Should call Callback', () {
      // Arrange
      bool callbackCalled = false;
      final changeValue = ChangeObservableValueController(0);

      void callback() {
        callbackCalled = true;
      }

      // Act
      changeValue.addListener(() {
        callback();
      });
      changeValue.value++;

      // Assert
      expect(callbackCalled, true);
    });

    test('Should generate Success state', () {
      // Arrange
      final productController = ProductController();

      // Act
      productController.getProducts();

      // Assert
      Future.delayed(const Duration(seconds: 3), () {
        expect(productController.value, isA<SuccessState<List<Product>>>());
      });
    });
  });
}

class _CounterStateObservable extends ChangeObservableController {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

abstract class BaseState {}

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class SuccessState<T extends Object> extends BaseState {
  final T data;

  SuccessState(this.data);
}

class ErrorState extends BaseState {
  final String message;

  ErrorState(this.message);
}

class Product {
  final int id;
  final String name;

  Product(this.id, this.name);
}

class ProductController extends ChangeObservableValueController<BaseState> {
  ProductController() : super(InitialState());

  void getProducts() {
    value = LoadingState();

    Future.delayed(const Duration(seconds: 2), () {
      try {
        final products = [
          Product(1, 'Product 1'),
          Product(2, 'Product 2'),
          Product(3, 'Product 3'),
        ];
        value = SuccessState<List<Product>>(products);
      } catch (e) {
        value = ErrorState('Failed to fetch products');
      }
    });
  }
}
