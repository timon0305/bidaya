import 'package:quizzo/export.dart';

Widget customAddButton({
  required String title,
  required VoidCallback onTap,
  required Color color,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 382.w,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color),
      ),
      child: Center(
        child: customText(
          text: " + $title",
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: AppColors.purple,
        ),
      ),
    ),
  );
}

Widget customAddButton2({
  required String title,
  required VoidCallback onTap,
  required Color color,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 382.w,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color),
      ),
      child: Center(
        child: customText(
          text: title,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: AppColors.purple,
        ),
      ),
    ),
  );
}
