import 'package:flutter/material.dart';

// INTERMEDIATE WIDGET TREE

benchmarkTwo() {
  runApp(const MaterialApp(
    home: WithKey(),
  ));
  // runApp(const MaterialApp(
  //   home: WithoutKey(),
  // ));
}

class WithKey extends StatefulWidget {
  const WithKey({super.key});

  @override
  State<WithKey> createState() => _WithKeyState();
}

class _WithKeyState extends State<WithKey> {
  bool isFirstWidget = true;
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final startTime = DateTime.now().millisecondsSinceEpoch;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final endTime = DateTime.now().millisecondsSinceEpoch;

      print("### TIMESTAMP : ${endTime - startTime}");
    });

    return Column(
      children: [
        if (isFirstWidget) firstWidget else secondWidget,
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isFirstWidget = !isFirstWidget;
            });
          },
          child: const Text("Click me"),
        )
      ],
    );
  }

  get firstWidget => Padding(
        padding: const EdgeInsets.all(50),
        child: item,
      );

  get secondWidget => item;

  get item => Container(
        key: key,
        color: Colors.green,
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            const Center(child: Text("Hello world!")),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                color: Colors.green,
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
      );
}

class WithoutKey extends StatefulWidget {
  const WithoutKey({super.key});

  @override
  State<WithoutKey> createState() => _WithoutKeyState();
}

class _WithoutKeyState extends State<WithoutKey> {
  bool isFirstWidget = true;

  @override
  Widget build(BuildContext context) {
    final startTime = DateTime.now().millisecondsSinceEpoch;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final endTime = DateTime.now().millisecondsSinceEpoch;

      print("### TIMESTAMP : ${endTime - startTime}");
    });
    return Column(
      children: [
        if (isFirstWidget) firstWidget else secondWidget,
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isFirstWidget = !isFirstWidget;
            });
          },
          child: const Text("Click me"),
        )
      ],
    );
  }

  get firstWidget => Padding(
        padding: const EdgeInsets.all(50),
        child: item,
      );

  get secondWidget => item;

  get item => Container(
        color: Colors.green,
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            const Center(child: Text("Hello world!")),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                color: Colors.green,
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
      );
}
