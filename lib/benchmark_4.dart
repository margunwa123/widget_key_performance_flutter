import 'package:flutter/material.dart';

// LISTVIEW WIDGET TREE

benchmarkFour() {
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

    final child = isFirstWidget ? firstWidget : secondWidget;

    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                isFirstWidget = !isFirstWidget;
              });
            },
            child: const Text("Click me"),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }

  get firstWidget => Padding(
        padding: const EdgeInsets.all(50),
        child: item,
      );

  get secondWidget => item;

  get item => Container(
        key: key,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.pink,
        ),
        padding: const EdgeInsets.all(8),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: 10,
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
    final child = isFirstWidget ? firstWidget : secondWidget;

    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                isFirstWidget = !isFirstWidget;
              });
            },
            child: const Text("Click me"),
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }

  get firstWidget => Padding(
        padding: const EdgeInsets.all(50),
        child: item,
      );

  get secondWidget => item;

  get item => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.pink,
        ),
        padding: const EdgeInsets.all(8),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: 10,
        ),
      );
}
