import 'package:curso_avancado_gerenciamento_estado/controllers/state_observable_controller.dart';
import 'package:flutter/material.dart';
import 'classes/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
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

class _MyHomePageState extends State<MyHomePage> {
  final counterState = CounterState();
  final counterValueState = ChangeObservableStateController(0);

  void callback() => setState(() {});

  @override
  void initState() {
    super.initState();
    counterState.addListener(callback);
    counterValueState.addListener(callback);
  }

  @override
  void dispose() {
    super.dispose();
    counterState.removeListener(callback);
    counterValueState.removeListener(callback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    const Text('Estado com ChangeStateController:'),
                    Text(
                      counterState.counter.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: counterState.increment,
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  mainAxisAlignment: .center,
                  children: [
                    const Text('Estado com ChangeObservableStateController:'),
                    Text(
                      counterValueState.state.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    counterValueState.state++;
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
