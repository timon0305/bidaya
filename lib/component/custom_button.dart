

import 'package:quizzo/export.dart';

Widget customButton({
  required BuildContext context,
  required String text,
  required double fontSize,
  Function()? onPressed,
  double? width,
  required double height,
  required Color borderColor,
  required Color bgColor,
  Color? overlayColor,
  required Color fontColor,
  required double borderRadius,
  required bool isCircular,
  required FontWeight fontWeight,
  bool isLoading = false, // 👈 new param
}) {
  return Container(
    width: width?.w,
    height: height.h + 5,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(borderRadius.r),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 0.h,
          left: 0,
          right: 0,
          bottom: 6.h,
          child: IgnorePointer(
            child: Container(
              width: width?.w,
              height: height.h,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: overlayColor ?? Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(borderRadius.r),
              ),
            ),
          ),
        ),
        MaterialButton(
          height: height + 5,
          onPressed: isLoading ? null : onPressed, // disable while loading
          padding: EdgeInsets.zero,
          highlightColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              isCircular ? height.h / 2 : borderRadius.r,
            ),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: fontColor,
              ),
            )
                : customText(
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: fontColor,
              text: text,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customButtonWithPrefixIcon({
  required BuildContext context,
  required String text,
  required double fontSize,
  Function()? onPressed,
  double? width,
  required double height,
  required Color borderColor,
  required Color bgColor,
   Color ? overlayColor,
  required Color fontColor,
  required double borderRadius,
  required bool isCircular,
  required FontWeight fontWeight,
  required Widget widget,
}) {
  return Container(
    width: width?.w,
    height: height.h+5,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(borderRadius.r),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 0.h,
          left: 0,
          right: 0,
          bottom: 6.h,
           child: IgnorePointer(
    child: Container(
    width: width?.w,
      height: height.h,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color:overlayColor?? Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
    ),
  ),
    ),
        MaterialButton(
          height: height,
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          highlightColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              isCircular ? height.h / 2 : borderRadius.r,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget,
                horizontalSpacer(4),
                customText(
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                  color: fontColor,
                  text: text,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget simpleCustomButton({
  required BuildContext context,
  required String text,
  required double fontSize,
  Function()? onPressed,
  double? width,
  required double height,
  required Color borderColor,
  required Color bgColor,
  Color ? overlayColor,
  required Color fontColor,
  required double borderRadius,
  required bool isCircular,
  required FontWeight fontWeight,
}) {
  return Container(
    width: width?.w,
    height: height.h+5,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      color: bgColor,
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(borderRadius.r),
    ),
    child: MaterialButton(
      height: height+5,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          isCircular ? height.h / 2 : borderRadius.r,
        ),
      ),
      child: Center(
        child: customText(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: fontColor,
          text: text,
        ),
      ),
    ),
  );
}

