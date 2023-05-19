import 'package:flutter/widgets.dart';

class Arrow extends StatelessWidget {
  const Arrow({
    super.key,
    this.size,
    required this.color,
    required this.direction,
    this.strokeWidth = 2,
  });

  final Size? size;
  final Color color;
  final AxisDirection direction;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size?.height,
      width: size?.width,
      child: Center(
        child: CustomPaint(
          painter: _ArrowPainter(
            color: color,
            direction: direction,
            strokeWidth: strokeWidth,
          ),
          size: size ?? Size.zero,
        ),
      ),
    );
  }
}

class _ArrowPainter extends CustomPainter {
  _ArrowPainter({
    required this.color,
    required this.direction,
    this.strokeWidth = 2,
  });

  final Color color;
  final AxisDirection direction;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();
    paint.style = PaintingStyle.stroke;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = strokeWidth;
    paint.color = color;

    switch (direction) {
      case AxisDirection.down:
        path.moveTo(size.width / 2, 0);
        path.lineTo(size.width / 2, size.height);
        path.moveTo(size.width / 2, size.height);
        path.lineTo(0, size.height - size.width / 2);
        path.moveTo(size.width / 2, size.height);
        path.lineTo(size.width, size.height - size.width / 2);
      case AxisDirection.left:
        path.moveTo(size.width, size.height / 2);
        path.lineTo(0, size.height / 2);
        path.moveTo(0, size.height / 2);
        path.lineTo(0 + size.height / 2, 0);
        path.moveTo(0, size.height / 2);
        path.lineTo(0 + size.height / 2, size.height);
      case AxisDirection.right:
        path.moveTo(0, size.height / 2);
        path.lineTo(size.width, size.height / 2);
        path.moveTo(size.width, size.height / 2);
        path.lineTo(size.width - size.height / 2, 0);
        path.moveTo(size.width, size.height / 2);
        path.lineTo(size.width - size.height / 2, size.height);
      case AxisDirection.up:
        path.moveTo(size.width / 2, size.height);
        path.lineTo(size.width / 2, 0);
        path.moveTo(size.width / 2, 0);
        path.lineTo(0, 0 + size.width / 2);
        path.moveTo(size.width / 2, 0);
        path.lineTo(size.width, 0 + size.width / 2);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
