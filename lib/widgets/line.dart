import 'package:flutter/widgets.dart';

class Line extends StatelessWidget {
  const Line({
    super.key,
    this.size,
    required this.color,
    required this.axis,
    this.strokeWidth = 2,
  });

  final Size? size;
  final Color color;
  final Axis axis;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size?.height,
      width: size?.width,
      child: Center(
        child: CustomPaint(
          painter: _LinePainter(
            color: color,
            axis: axis,
            strokeWidth: strokeWidth,
          ),
          size: size ?? Size.zero,
        ),
      ),
    );
  }
}

class _LinePainter extends CustomPainter {
  _LinePainter({
    required this.color,
    required this.axis,
    this.strokeWidth = 2,
  });

  final Color color;
  final Axis axis;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = strokeWidth;
    paint.color = color;

    switch (axis) {
      case Axis.vertical:
        final p1 = Offset(size.width / 2, 0);
        final p2 = Offset(size.width / 2, size.height);
        canvas.drawLine(p1, p2, paint);
        break;
      case Axis.horizontal:
        final p1 = Offset(0, size.height / 2);
        final p2 = Offset(size.width, size.height / 2);
        canvas.drawLine(p1, p2, paint);
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
