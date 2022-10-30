import 'package:flutter/material.dart';

class ExampleStatelessWidget extends StatelessWidget {
  const ExampleStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RedBox(),
    );
  }
}

class RedBox extends StatefulWidget {
  RedBox({super.key}) {
    print('RedBox init');
  }

  @override
  State<RedBox> createState() => _RedBoxState();
}

class _RedBoxState extends State<RedBox> {
  var number = 0;
  @override
  Widget build(BuildContext context) {
    print('RedBox build');

    void _increment() {
      number++;
      setState(() {});
    }

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: _increment,
                  child: Text('$number'),
                ),
              ),
            ),
            Expanded(
              child: BlueBox(),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GreenBox(),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: number % 2 == 0 ? YellowBox() : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class BlueBox extends StatelessWidget {
  BlueBox({super.key}) {
    print('BlueBox init');
  }

  @override
  Widget build(BuildContext context) {
    print('BlueBox build');
    return Container(
      color: Colors.blue,
    );
  }
}

class YellowBox extends StatelessWidget {
  YellowBox({super.key}) {
    print('YellowBox init');
  }

  @override
  Widget build(BuildContext context) {
    print('YellowBox build');
    return Container(
      color: Colors.yellow,
    );
  }
}

class GreenBox extends StatelessWidget {
  final controller = TextEditingController();
  GreenBox({super.key}) {
    print('GrenBox init');
  }

  @override
  Widget build(BuildContext context) {
    print('value: $controller');
    print('GrenBox build');
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: controller,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: PinkBox(),
            ),
          ),
        ],
      ),
    );
  }
}

class PinkBox extends StatelessWidget {
  PinkBox({super.key}) {
    print('PinkBox init');
  }

  @override
  Widget build(BuildContext context) {
    print('PinkBox build');
    return Container(
      color: Colors.pink,
    );
  }
}
