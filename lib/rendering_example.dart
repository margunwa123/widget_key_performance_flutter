import 'package:flutter/material.dart';

renderingExample() {
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
    return Column(
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
              if (textColor == Colors.green) {
                textColor = Colors.red;
              } else {
                textColor = Colors.green;
              }
            });
          },
        )
      ],
    );
  }
}
