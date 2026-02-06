import 'package:curso_avancado_gerenciamento_estado/controllers/change_observable_value_controller.dart';
import 'package:curso_avancado_gerenciamento_estado/mixins/change_observable_mixin.dart';
import 'package:curso_avancado_gerenciamento_estado/mixins/change_observable_value_mixin.dart';
import 'package:flutter/material.dart';
import 'classes/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with ChangeObservableMixin, ChangeObservableValueMixin {
  final counter = Counter();
  final counterValue = ChangeObservableValueController(0);

  @override
  void initState() {
    super.initState();
    useObservable(counter);
    useObservableValue(counterValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: _buildCounters()),
    );
  }

  Widget _buildCounters() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        children: [
          Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              const Text('Estado com Observable:'),
              Text(
                counter.counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(width: 10),
          IconButton(onPressed: counter.increment, icon: Icon(Icons.add)),
        ],
      ),
      Column(
        children: [
          Column(
            children: [
              const Text('Estado com ObservableState:'),
              Text(
                counterValue.value.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              counterValue.value++;
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    ],
  );
}
