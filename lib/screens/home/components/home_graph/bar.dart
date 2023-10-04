import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class BarChart extends StatelessWidget {
  const BarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300.0,
        height: 200.0,
        child: CustomPaint(
          painter: BarChartPainter(),
        ),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final barPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = Color(darkBglight)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final barWidth = 30.0;
    final barSpacing = 20.0;
    final data = [50.0, 30.0, 10.0, 70.0, 50.0];
    final lineY = size.height -
        0; // Ajuste a posição vertical da linha conforme necessário

    // Desenhe as barras
    for (int i = 0; i < data.length; i++) {
      final left = i * (barWidth + barSpacing);
      final top = size.height - data[i];
      final right = left + barWidth;
      final bottom = size.height;

      canvas.drawRect(Rect.fromLTRB(left, top, right, bottom), barPaint);
    }

    // Desenhe a linha
    canvas.drawLine(Offset(0, lineY), Offset(size.width, lineY), linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
