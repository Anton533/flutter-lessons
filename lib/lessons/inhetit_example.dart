import 'package:flutter/material.dart';

class InheritExample extends StatelessWidget {
  const InheritExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DataOwnerStateful(),
            ],
          ),
        ),
      ),
    );
  }
}

class DataOwnerStateful extends StatefulWidget {
  const DataOwnerStateful({super.key});

  @override
  State<DataOwnerStateful> createState() => _DataOwnerStatefulState();
}

class _DataOwnerStatefulState extends State<DataOwnerStateful> {
  var _valueOne = 0;
  var _valueTwo = 0;

  void _incrementOne() {
    setState(
      () {
        _valueOne += 1;
      },
    );
  }

  void _incrementTow() {
    setState(
      () {
        _valueTwo += 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _incrementOne,
          child: const Text('Жми One'),
        ),
        ElevatedButton(
          onPressed: _incrementTow,
          child: const Text('Жми Two'),
        ),
        const SizedBox(height: 30),
        DataProviderInherited(
          valueOne: _valueOne,
          valueTwo: _valueTwo,
          child: const DataConsumerStateless(),
        ),
      ],
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context
            .dependOnInheritedWidgetOfExactType<DataProviderInherited>(
                aspect: 'one')
            ?.valueOne ??
        0;
    final foo = context
        .dependOnInheritedWidgetOfExactType<DataProviderInherited>()
        ?.Foo;
    print('$foo');
    // context.findAncestorStateOfType<_DataOwnerStatefulState>()?._value ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(' DataConsumerStateless; $value'),
        const SizedBox(height: 30),
        const DataConsumerStateful(),
      ],
    );
  }
}

class DataConsumerStateful extends StatefulWidget {
  const DataConsumerStateful({super.key});

  @override
  State<DataConsumerStateful> createState() => _DataConsumerStatefulState();
}

class _DataConsumerStatefulState extends State<DataConsumerStateful> {
  @override
  Widget build(BuildContext context) {
    final value = context
            .dependOnInheritedWidgetOfExactType<DataProviderInherited>(
                aspect: 'tow')
            ?.valueTwo ??
        0;
    // context.findAncestorStateOfType<_DataOwnerStatefulState>()?._value ?? 0;
    return Text('DataConsumerStateful: $value');
  }
}

class DataProviderInherited extends InheritedModel<String> {
  final int valueOne;
  final int valueTwo;
  final String Foo = 'Bar';
  const DataProviderInherited({
    Key? key,
    required this.valueOne,
    required this.valueTwo,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return valueOne != oldWidget.valueOne || valueTwo != oldWidget.valueTwo;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant DataProviderInherited oldWidget,
    Set<String> dependencies,
  ) {
    final newValueOne =
        valueOne != oldWidget.valueOne && dependencies.contains('one');
    final newValueTwo =
        valueTwo != oldWidget.valueTwo && dependencies.contains('tow');
    return newValueOne || newValueTwo;
  }
}
