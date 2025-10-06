import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzo/export.dart';

class VerticalDottedStepper extends StatelessWidget {
  final List<StepperItem> items;
  final double lineWidth;
  final Color lineColor;



  const VerticalDottedStepper({
    super.key,
    required this.items,
    this.lineWidth = 2,
    this.lineColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final isFirst = index == 0;
        final isLast = index == items.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(
                children: [

                  if (isFirst)
                    CustomPaint(
                      size: Size(lineWidth, 24.h),
                      painter: DottedLinePainter(color: lineColor),
                    ),

                  ClipPath(
                    clipper: ZigZagClipper(),
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
                      color: items[index].color,
                      child: Padding(
                        padding: EdgeInsets.only(left: 6.w),
                        child: customText( text: item.time, fontWeight: FontWeight.w700, fontSize: 12, color: AppColors.white, ), ),

                    ),
                  ),
                    Expanded(
                      child: Container(
                        width: lineWidth,
                        decoration: BoxDecoration(
                          color: lineColor,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.forestGrey,

                              offset: const Offset(-2, 0),
                            )
                          ],
                        ),
                      ),
                    ),

                  if (isLast)
                    CustomPaint(
                      size: Size(lineWidth, 60.h),
                      painter: DottedLinePainter(color: lineColor),
                    ),
                ],
              ),

              SizedBox(width: 6.w),
              
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8.r),
                            topRight: Radius.circular(8.r),
                            bottomLeft: Radius.circular(8.r),
                            ),
                        color: AppColors.purple.withOpacity(0.08),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        customText( text: item.title,
                          fontWeight: FontWeight.w700,
                          fontSize: 16, color: AppColors.blackShade, ),

                          SizedBox(height: 8.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.r),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              AppImages.kid,
                              height: 180.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),

                            Container(
                              height: 180.h,
                              width: double.infinity,
                              color: item.isNew?AppColors.white.withOpacity(0.1):AppColors.blackShade.withOpacity(0.8),
                            ),
                            item.isNew? SizedBox.shrink():Icon(
                              Icons.visibility,
                              color: Colors.white,
                              size: 32.sp,
                            ),
                          ],
                        ),
                      )
                        ]
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: customText( text: "By Desai   ",
                        textAlign: TextAlign.right,
                        fontWeight: FontWeight.w700,
                        fontSize: 9, color: AppColors.sand, ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Painter for Dotted Line
class DottedLinePainter extends CustomPainter {
  final Color color;
  final double dotSpacing;
  final double dotLength;

  DottedLinePainter({
    required this.color,
    this.dotSpacing = 10,
    this.dotLength = 6,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.width
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double y = 0;
    while (y < size.height) {
      canvas.drawLine(
          Offset(size.width / 2, y),
          Offset(size.width / 2, y + dotLength),
          paint);
      y += dotLength + dotSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Stepper Item Model
class StepperItem {
  final String time;
  final String title;
  final String description;
  final String? imageUrl;
  final Color color;
  final bool isNew; // 👈 add this

  StepperItem({
    required this.time,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.color,
    this.isNew = false, // default false
  });
}

/// ZigZag Clipper for time container
class ZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    double zigzagSize = 4;

    for (double y = 0; y < size.height; y += zigzagSize) {
      path.lineTo(zigzagSize, y + zigzagSize / 2);
      path.lineTo(0, y + zigzagSize);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
