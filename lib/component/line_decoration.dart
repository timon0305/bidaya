
import 'package:quizzo/export.dart';
class RoundedRectangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  RoundedRectangleTabIndicator({required Color color, required double weight})
      : _painter = _RRectanglePainter(color, weight);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _RRectanglePainter extends BoxPainter {
  final Paint _paint;
  final double weight;

  _RRectanglePainter(Color color, this.weight)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final double xOffset = offset.dx;
    final double yOffset = offset.dy + cfg.size!.height - weight;

    // 👇 full tab width
    final Rect rect = Rect.fromLTWH(
      xOffset,
      yOffset,
      cfg.size!.width,
      weight,
    );

    final RRect rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(weight), // rounded ends
    );
    canvas.drawRRect(rRect, _paint);
  }
}