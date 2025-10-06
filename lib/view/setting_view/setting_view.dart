import 'package:quizzo/export.dart';

class SettingScreenView extends StatelessWidget {
  const SettingScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthViewModel>();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.white,
        systemNavigationBarColor: AppColors.white,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: customAppBar(title: 'Settings'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customListTile(
                context,
                title: "Personal Info",
                image: AppImages.userSetting,
                onPressed: () {
                  Get.toNamed(AppRoutes.settingInfo);
                },
              ),
              if (auth.userRole != "Parent") ...[
                customListTile(
                  context,
                  title: "Nursery Info",
                  image: AppImages.homeSetting,
                  onPressed: () {
                    Get.toNamed(AppRoutes.settingNursery);
                  },
                ),
                customListTile(
                  context,
                  title: "Send Notification",
                  image: AppImages.notificationSetting,
                  onPressed: () {
                    Get.toNamed(AppRoutes.sendNotification);
                  },
                ),
                customListTile(
                  context,
                  title: "Teacher Permission",
                  image: AppImages.permissionSetting,
                  onPressed: () {
                    Get.toNamed(AppRoutes.teacherPermission);
                  },
                ),

                customListTile(
                  context,
                  title: "Subscription",
                  image: AppImages.subSetting,
                  onPressed: () {
                    Get.toNamed(AppRoutes.manageSubs);
                  },
                ),
              ],

              customListTile(
                context,
                title: "Change Password",
                image: AppImages.passwordSetting,
                onPressed: () {
                  setPasswordPopUp(context);
                },
              ),
              customListTile(
                context,
                title: "App Settings",
                image: AppImages.appSetting,
                onPressed: () {
                  Get.toNamed(AppRoutes.appSetting);
                },
              ),
              customListTile(
                context,
                title: "Contact Us",
                image: AppImages.contactSetting,
                onPressed: () {
                  Get.toNamed(AppRoutes.contact);
                },
              ),
              customListTile(
                context,
                title: "Logout",
                image: AppImages.logoutSetting,
                onPressed: () {
                  Get.toNamed(AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customListTile(
  BuildContext context, {
  required String image,
  required String title,
  required Function() onPressed,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
    child: GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            height: 56.h,
            width: 56.w,
            fit: BoxFit.scaleDown,
          ),
          horizontalSpacer(14),
          Expanded(
            child: customText(
              text: title,
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColors.blackShade,
            ),
          ),
          image == AppImages.logoutSetting
              ? SizedBox.shrink()
              : Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: AppColors.blackShade,
              ),
        ],
      ),
    ),
  );
}
