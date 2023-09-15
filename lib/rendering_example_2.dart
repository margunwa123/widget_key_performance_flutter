import 'package:flutter/material.dart';

renderingExample2() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color textColor = Colors.green;
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (textColor == Colors.green) {
      return greenText;
    }
    return redText;
  }

  get redText => Column(
        children: [
          Text(
            "Hello world",
            style: TextStyle(
              color: textColor,
            ),
          ),
          ElevatedButton(
            child: const Text("Click me"),
            onPressed: () {
              setState(() {
                textColor = Colors.green;
              });
            },
          )
        ],
      );

  get greenText => Column(
        children: [
          Text(
            "Hello world",
            style: TextStyle(
              color: textColor,
            ),
          ),
          ElevatedButton(
            child: const Text("Click me"),
            onPressed: () {
              setState(() {
                textColor = Colors.red;
              });
            },
          )
        ],
      );
}
