import 'package:quizzo/export.dart';

class AppSettingView extends StatelessWidget {
  const AppSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.white,
        systemNavigationBarColor: AppColors.white,
      ),
    );
    return Scaffold(
      appBar: customAppBar(title: "App Settings"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                AppImages.permissionPlaceholder,
                height: 100.h,
                width: 430.w,
                fit: BoxFit.cover,
              ),
            ),
            verticalSpacer(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: "Push Notification",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.blackShade,
                ),
                toggleButton(context, "notification"),
              ],
            ),

            verticalSpacer(24),
            Row(
              children: [
                customText(
                  text: "Language",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.blackShade,
                ),
                Spacer(),
                customText(
                  text: "English",
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: AppColors.placeholder,
                ),
                horizontalSpacer(12),

                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: AppColors.blackShade,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
        child: customButton(
          context: context,
          text: "Save Settings",
          fontSize: 16,
          height: 58,
          width: 300,
          borderColor: Colors.transparent,
          bgColor: AppColors.blue,
          fontColor: Colors.white,
          borderRadius: 100,
          isCircular: true,
          fontWeight: FontWeight.w600,
          onPressed: () {
            Get.toNamed(AppRoutes.otp);
          },
        ),
      ),
    );
  }
}
