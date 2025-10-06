import 'package:quizzo/export.dart';

Widget inventoryItemCard(String title, String subtitle) {
  return Card(
    color: AppColors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
      side: BorderSide(
        color: AppColors.forestGrey.withValues(alpha: 0.9),
        width: 1, // thickness
      ),
    ),
    child: ListTile(
      title: customText(
        text: title,
        fontWeight: FontWeight.bold,
        color: AppColors.blackShade,
        fontSize: 18,
      ),
      subtitle: customText(
        text: subtitle,
        fontWeight: FontWeight.bold,
        color: AppColors.placeholder,
        fontSize: 14,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                AppImages.arrowUp,
                height: 24.h,
                width: 24.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpacer(4),
          Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                AppImages.arrowDown,
                height: 24.h,
                width: 24.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpacer(4),
          Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
              color: AppColors.redShade,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                AppImages.delete,
                height: 24.h,
                width: 24.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget inventoryCategoryCard(String title) {
  return Card(
    color: AppColors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
      side: BorderSide(
        color: AppColors.forestGrey.withValues(alpha: 0.9),
        width: 1, // thickness
      ),
    ),
    child: ListTile(
      title: customText(
        text: title,
        fontWeight: FontWeight.bold,
        color: AppColors.blackShade,
        fontSize: 18,
      ),
      trailing: Container(
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          color: AppColors.redShade,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppImages.delete,
            height: 24.h,
            width: 24.w,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
