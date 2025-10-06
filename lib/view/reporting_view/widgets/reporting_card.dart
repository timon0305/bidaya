import 'package:quizzo/export.dart';

import 'add_new_report_card.dart';

Widget reportingCard(
  BuildContext context,
  String title,
  String subtitle,
  bool isNew,
) {
  List<Map<String, String>> reportFeatureList = [
    {"image": AppImages.reportFood, "name": "Food"},
    {"image": AppImages.reportSleep, "name": "Sleep"},
    {"image": AppImages.reportToilet, "name": "Toilet"},
    {"image": AppImages.reportActivity, "name": "Activity Level"},
    {"image": AppImages.reportMood, "name": "Mood"},
  ];

  return Card(
    color: AppColors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
      side: BorderSide(color: AppColors.bg.withValues(alpha: 0.9), width: 1),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
      leading: Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(AppImages.avatarPng)),
        ),
      ),
      horizontalTitleGap: 5,
      title: customText(
        text: title,
        fontWeight: FontWeight.w700,
        color: AppColors.blackShade,
        fontSize: 18,
      ),
      subtitle: customText(
        text: subtitle,
        fontWeight: FontWeight.w400,
        color: AppColors.placeholder,
        fontSize: 14,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              addNewReportPopup(
                context,
                title: 'New Report',
                reportFeatureItems: reportFeatureList,
              );
            },
            child: Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                isNew ? Icons.add : Icons.remove_red_eye,
                color: AppColors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
