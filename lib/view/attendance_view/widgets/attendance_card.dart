import 'package:quizzo/export.dart';

Widget attendanceStatusCard() {
  return Container(
    width: 382.w,
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      color: AppColors.bg,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        attendanceLegends(
          total: "10",
          colorText: AppColors.blackShade,
          status: "Total",
        ),
        attendanceLegends(
          total: "7",
          colorText: AppColors.green,
          status: "Present",
        ),
        attendanceLegends(
          total: "3",
          colorText: AppColors.red,
          status: "Absent",
        ),
      ],
    ),
  );
}

Widget attendanceLegends({
  required String total,
  required Color colorText,
  required String status,
}) {
  return Column(
    children: [
      customText(
        text: total,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: colorText,
      ),
      horizontalSpacer(8),
      customText(
        text: status,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        color: AppColors.lightGreyShade,
      ),
    ],
  );
}

String? status;
Widget attendanceUserCard(String title, String subtitle) {
  return StatefulBuilder(
    builder: (context, attendanceState) {
      return Card(
        color: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(
            color: AppColors.bg.withValues(alpha: 0.9),
            width: 1,
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
          leading: Container(
            height: 60.h,
            width: 60.w,
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
                  attendanceState(() {
                    if (status == "present") {
                      status = "";
                    } else {
                      status = "present";
                    }
                  });
                },
                child: Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                    color:
                        status == "present"
                            ? AppColors.present
                            : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.tick,
                      colorFilter: ColorFilter.mode(
                        status == "present"
                            ? AppColors.white
                            : AppColors.blackShade,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpacer(8),
              GestureDetector(
                onTap: () {
                  attendanceState(() {
                    if (status == "absent") {
                      status = "";
                    } else {
                      status = "absent";
                    }
                  });
                },
                child: Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                    color:
                        status == "absent"
                            ? AppColors.redShade
                            : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.cross,
                      colorFilter: ColorFilter.mode(
                        status == "absent"
                            ? AppColors.white
                            : AppColors.blackShade,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
