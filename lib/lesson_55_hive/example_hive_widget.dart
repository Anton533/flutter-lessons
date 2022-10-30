import 'package:flutter/material.dart';
import 'package:flutter_example/lesson_55_hive/example_widget_model.dart';

class ExampleHiveWidget extends StatefulWidget {
  const ExampleHiveWidget({super.key});

  @override
  State<ExampleHiveWidget> createState() => _ExampleHiveWidgetState();
}

class _ExampleHiveWidgetState extends State<ExampleHiveWidget> {
  final model = ExampleWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: model.setup,
                child: const Text('Настроит'),
              ),
              ElevatedButton(
                onPressed: model.doSome,
                child: const Text('Добавить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
