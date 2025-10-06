import 'package:quizzo/export.dart';

class InvoiceSlipPainter extends CustomPainter {
  final Color borderColor;
  final Color backgroundColor;
  final bool hasShadow;
  final bool isHeader;

  InvoiceSlipPainter({
    required this.borderColor,
    required this.backgroundColor,
    this.hasShadow = false,
    this.isHeader = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint =
        Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.fill;

    final borderPaint =
        Paint()
          ..color = borderColor
          ..strokeWidth = 1.5
          ..style = PaintingStyle.stroke
          ..strokeJoin = StrokeJoin.round
          ..strokeCap = StrokeCap.round
          ..strokeMiterLimit = 2; // 👈 Border andar hi rahega

    final dottedPaint =
        Paint()
          ..color = AppColors.lightestGreyShade
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;

    final path = _createSlipPath(size);

    // Shadow
    if (hasShadow) {
      final shadowPaint =
          Paint()
            ..color = Colors.black.withValues(alpha: 0.15)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
      canvas.drawPath(path.shift(const Offset(0, 3)), shadowPaint);
    }

    // Background
    canvas.drawPath(path, fillPaint);

    // Border (pehle border)
    canvas.drawPath(path, borderPaint);

    // Dotted line (baad me taake overlap clean ho)
    final notchPosition = size.width / 1.55;
    _drawDottedLine(
      canvas,
      dottedPaint,
      Offset(notchPosition, 10),
      Offset(notchPosition, size.height - 10.h),
    );
  }

  Path _createSlipPath(Size size) {
    final path = Path();
    final radius = 20.0;
    final notchRadius = 10.0;
    final notchPosition = size.width / 1.55;

    // Start from top-left
    path.moveTo(radius, 0);

    // Top edge + notch
    path.lineTo(notchPosition - notchRadius, 0);
    path.arcToPoint(
      Offset(notchPosition + notchRadius, 0),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(size.width - radius, 0);

    // Top-right corner
    path.arcToPoint(
      Offset(size.width, radius),
      radius: Radius.circular(radius),
    );

    // Right edge
    path.lineTo(size.width, size.height - radius);

    // Bottom-right corner
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: Radius.circular(radius),
    );

    // Bottom notch
    path.lineTo(notchPosition + notchRadius, size.height);
    path.arcToPoint(
      Offset(notchPosition - notchRadius, size.height),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    // Bottom-left corner
    path.lineTo(radius, size.height);
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: Radius.circular(radius),
    );

    // Left edge
    path.lineTo(0, radius);

    // Top-left corner
    path.arcToPoint(Offset(radius, 0), radius: Radius.circular(radius));

    path.close();
    return path;
  }

  void _drawDottedLine(Canvas canvas, Paint paint, Offset start, Offset end) {
    const dashWidth = 2.0;
    const dashSpace = 3.0;
    double distance = (end - start).distance;
    double totalDashSpace = dashWidth + dashSpace;
    int dashCount = (distance / totalDashSpace).floor();

    for (int i = 0; i < dashCount; i++) {
      double progress1 = (i * totalDashSpace) / distance;
      double progress2 = (i * totalDashSpace + dashWidth) / distance;

      double startX = start.dx + (end.dx - start.dx) * progress1;
      double startY = start.dy + (end.dy - start.dy) * progress1;
      double endX = start.dx + (end.dx - start.dx) * progress2;
      double endY = start.dy + (end.dy - start.dy) * progress2;

      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        paint..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
