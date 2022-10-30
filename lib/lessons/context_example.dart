import 'package:flutter/material.dart';

class ExampleContext extends StatelessWidget {
  const ExampleContext({super.key});

  static void nextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const NextScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => nextScreen(context),
            child: const Text('GO!'),
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: InheritExample(
        child: ColoredWidget(
          initalColor: Colors.red,
          child: Padding(
            padding: EdgeInsets.all(40),
            child: ColoredWidget(
                initalColor: Colors.green,
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: ColoredWidget(
                    initalColor: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: ColorButton(),
                    ),
                  ),
                )),
          ),
        ),
      )),
    );
  }
}

class InheritExample extends InheritedWidget {
  const InheritExample({
    key,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class ColoredWidget extends StatefulWidget {
  final Widget child;
  final Color initalColor;

  const ColoredWidget({
    super.key,
    required this.initalColor,
    required this.child,
  });

  @override
  State<ColoredWidget> createState() => _ColoredWidgetState();
}

class _ColoredWidgetState extends State<ColoredWidget> {
  late Color color;

  @override
  void initState() {
    color = widget.initalColor;
    super.initState();
  }

  void chengeColor(Color color) {
    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: widget.child,
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({super.key});

  void _onPressed(BuildContext context) {
    context
        .findAncestorStateOfType<_ColoredWidgetState>()
        ?.chengeColor(Colors.pink);
    context
        .findRootAncestorStateOfType<_ColoredWidgetState>()
        ?.chengeColor(Colors.yellow);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _onPressed(context),
        child: const Text('Жми'),
      ),
    );
  }
}
