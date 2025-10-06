import 'package:quizzo/export.dart';
Widget classesCard(String title, String subtitle) {
  return Card(
    color: AppColors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
      side: BorderSide(
        color: AppColors.forestGrey.withOpacity(0.9),
        width: 1, // thickness
      ),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      title: customText(text: title,fontWeight: FontWeight.w700,color: AppColors.blackShade,fontSize: 18),
      subtitle: customText(text: subtitle,fontWeight: FontWeight.w400,color: AppColors.placeholder,fontSize: 14),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
              height:32.h,
              width: 32.w,
              decoration: BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(child: SvgPicture.asset(AppImages.edit,height: 24.h,width: 24.w,fit: BoxFit.cover,))),
          horizontalSpacer(16),
          Container(
              height:32.h,
              width: 32.w,
              decoration: BoxDecoration(
                color: AppColors.redShade,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(child: SvgPicture.asset(AppImages.delete,height: 24.h,width: 24.w,fit: BoxFit.cover,))),
        ],
      ),
    ),
  );
}
