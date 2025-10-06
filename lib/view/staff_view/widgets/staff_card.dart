import 'package:quizzo/export.dart';
import 'package:quizzo/view/staff_view/widgets/remove_staff_pop_up.dart';

Widget staffCard(BuildContext context, String title, String subtitle) {
  return Card(
    color: AppColors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
      side: BorderSide(color: AppColors.bg.withValues(alpha: 0.9), width: 1),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
      leading: CircleAvatar(
        radius: 26,
        backgroundColor: AppColors.white,
        backgroundImage: AssetImage(AppImages.avatarPng),
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
      trailing: PopupMenuButton<int>(
        color: AppColors.white,
        offset: Offset(100.w, 35.h),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        onSelected: (int value) {
          if (value == 1) {
            Get.to(() => StaffViewDetail());
          }
          if (value == 4) {
            removeStaffPopup(context);
          }
          if (value == 2) {
            Get.to(() => AddStaffView(phone: "+1 305-555-0199", isEdit: true));
          }
        },
        itemBuilder:
            (context) => [
              popupItem0(
                1,
                "View Details",
                popupIcon: "",
                isDivider: true,
                icon: Icons.remove_red_eye_outlined,
                isIcon: true,
              ),
              popupItem0(2, "Edit", popupIcon: AppImages.edit, isDivider: true),
              popupItem0(
                3,
                "Assign to class",
                icon: Icons.arrow_forward,
                isDivider: true,
                isIcon: true,
              ),
              popupItem0(
                3,
                "Set as admin",
                popupIcon: AppImages.profile,
                isDivider: true,
                isIcon: false,
              ),
              popupItem0(
                4,
                "Delete",
                popupIcon: AppImages.delete,
                isDivider: false,
                isIcon: true,
              ),
            ],
        child: Container(
          height: 32.h,
          width: 32.w,
          decoration: BoxDecoration(
            color: AppColors.lightestGreyShade,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Icons.more_horiz_rounded,
            color: AppColors.blackShade,
            size: 18,
          ),
        ),
      ),
    ),
  );
}

PopupMenuItem<int> popupItem0(
  int value,
  String text, {
  IconData? icon,
  String? popupIcon,
  bool isIcon = false,
  bool isDivider = false,
}) {
  return PopupMenuItem<int>(
    value: value,
    height: 60.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            isIcon && icon != null
                ? Icon(icon, size: 22.sp)
                : popupIcon != null
                ? SvgPicture.asset(
                  popupIcon,
                  height: 22.h,
                  width: 22.w,
                  colorFilter: ColorFilter.mode(
                    popupIcon == AppImages.delete
                        ? AppColors.red
                        : AppColors.blackShade,
                    BlendMode.srcIn,
                  ),
                )
                : const SizedBox.shrink(),
            horizontalSpacer(8),
            customText(
              text: text,
              color:
                  popupIcon == AppImages.delete
                      ? AppColors.red
                      : AppColors.blackShade,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        if (isDivider) ...[
          verticalSpacer(12),
          customDivider(
            height: 1,
            width: 200.w,
            color: AppColors.lightestGreyShade,
          ),
        ],
      ],
    ),
  );
}
