import 'package:flutter/material.dart';

// SMALL WIDGET TREE

benchmarkOne() {
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
        padding: const EdgeInsets.all(8.0),
        child: text,
      );

  get secondWidget => text;

  get text => LineChart(
        key: key,
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
          child: const Text("Hello"),
        )
      ],
    );
  }

  get firstWidget => Padding(
        padding: const EdgeInsets.all(8.0),
        child: text,
      );

  get secondWidget => text;

  get text => const LineChart();
}

class LineChart extends StatelessWidget {
  const LineChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LineChartPainter(),
      child: const SizedBox(
        height: 200,
        width: 200,
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final axisPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final dataPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final markingLinePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final mockDataPoints = [
      const Offset(15, 155),
      const Offset(20, 133),
      const Offset(34, 125),
      const Offset(40, 105),
      const Offset(70, 85),
      const Offset(80, 95),
      const Offset(90, 60),
      const Offset(120, 54),
      const Offset(160, 60),
      const Offset(200, -10),
    ];

    final axis = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height);

    final markingLine = Path()
      ..moveTo(-10, 50)
      ..lineTo(size.width + 10, 50);

    final data = Path()..moveTo(1, 180);

    for (var dataPoint in mockDataPoints) {
      data.lineTo(dataPoint.dx, dataPoint.dy);
    }

    canvas.drawPath(axis, axisPaint);
    canvas.drawPath(data, dataPaint);
    canvas.drawPath(markingLine, markingLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
