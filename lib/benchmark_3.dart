import 'package:flutter/material.dart';

// HUGE WIDGET TREE

benchmarkThree() {
  // runApp(const MaterialApp(
  //   home: WithKey(),
  // ));
  runApp(const MaterialApp(
    home: WithoutKey(),
  ));
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

    return Scaffold(
      body: Column(
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
        child: Column(
          children: [
            Container(
              color: Colors.yellow,
              height: 50,
            ),
            const Text(
              "Title",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Text(
              "Subtitle",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  Icon(
                    Icons.thumb_up_sharp,
                    color: Colors.white,
                  ),
                  Text("Like and subscribe"),
                ],
              ),
            ),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            )
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
    return Scaffold(
      body: Column(
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
        child: Column(
          children: [
            Container(
              color: Colors.yellow,
              height: 50,
            ),
            const Text(
              "Title",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Text(
              "Subtitle",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  Icon(
                    Icons.thumb_up_sharp,
                    color: Colors.white,
                  ),
                  Text("Like and subscribe"),
                ],
              ),
            ),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            )
          ],
        ),
      );
}
