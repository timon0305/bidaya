import 'package:quizzo/export.dart';

class TeacherPermissionsScreen extends StatelessWidget {
  const TeacherPermissionsScreen({super.key});

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
      appBar: customAppBar(title: "Teacher Permissions"),
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              AppImages.permissionPlaceholder,
              height: 100.h,
              width: 390.w,
              fit: BoxFit.cover,
            ),
          ),
          verticalSpacer(24),
          permissionRow(context, "Take Attendance", "attendance"),
          permissionRow(context, "Manage Gallery", "gallery"),
          permissionRow(context, "Manage Kids", "kids"),
          permissionRow(context, "Manage Inventory", "inventory"),
        ],
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

  Widget permissionRow(BuildContext context, String title, String key) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customText(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.blackShade,
          ),
          toggleButton(context, key),
        ],
      ),
    );
  }
}

Widget toggleButton(BuildContext context, String key) {
  final ghost = context.watch<SettingViewModel>().permissions[key] ?? false;

  return GestureDetector(
    onTap: () {
      context.read<SettingViewModel>().togglePermission(key, !ghost);
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 50,
      height: 26,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: ghost ? AppColors.purple : AppColors.forestGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Align(
        alignment: ghost ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 18,
          height: 18,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    ),
  );
}
