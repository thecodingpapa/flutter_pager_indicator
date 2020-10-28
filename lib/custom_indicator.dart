import 'dart:math';
import 'package:flutter/material.dart';

class CustomIndicator extends CustomPainter {
  double dotSize;
  final int numOfDots;
  final double curPos;

  CustomIndicator(
    this.numOfDots,
    this.curPos,
  );

  @override
  void paint(Canvas canvas, Size size) {
    dotSize = (size.width / (numOfDots * 2 - 1));
    for (int i = 0; i < 5; i++) {
      canvas.drawCircle(
          Offset(i * dotSize * 2, 100),
          dotSize / 2,
          Paint()
            ..color = Colors.black26
            ..style = PaintingStyle.fill);
    }

    double decimalValue = curPos - curPos.floor();
    print((curPos ?? 0) * dotSize * 2);
    canvas.drawCircle(
        Offset((curPos ?? 0) * dotSize * 2, 100 + -sin(decimalValue * pi) * 20),
        dotSize / 2 + (sin(decimalValue * pi) * 5),
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
