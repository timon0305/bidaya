import 'package:quizzo/export.dart';

class SettingPermissionView extends StatefulWidget {
  const SettingPermissionView({super.key});

  @override
  State<SettingPermissionView> createState() => _SettingPermissionViewState();
}

class _SettingPermissionViewState extends State<SettingPermissionView> {
  String? selectedGender;
  TextEditingController searchController = TextEditingController();

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTextFieldPrefixIcon(
                controller: searchController,
                readOnly: false,
                hintClr: AppColors.grey.withValues(alpha: 0.3),
                borderClr: Colors.transparent,
                height: 56,
                width: 432,
                hintFontSize: 16,
                icon: AppImages.search,
                isMinLine: 1,
                keyboardType: TextInputType.text,
                hintText: "Search",
                fillColor: AppColors.bg,
                borderRadius: 16,
                obscureText: false,
                onShow: () {},
                context: context,
              ),
              verticalSpacer(16),
              customDropdownField(
                context: context,
                hintText: "Male",
                width: 400,
                borderRadius: 16,
                fillColor: AppColors.bg,
                icon: AppImages.dropArrow,
                iconPath: AppImages.dropArrow,
                borderColor: Colors.transparent,
                items: ["All Classes", "Junior", "Senior"],
                value: selectedGender,
                onChanged: (val) {
                  selectedGender = val ?? "";
                },
              ),
              verticalSpacer(12),
              customDivider(
                height: 1.5,
                width: 432,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(20),
              Row(
                children: [
                  customText(
                    text: "  Staff",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.blackShade,
                  ),

                  horizontalSpacer(4),
                  customText(
                    text: "(3)",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.freshBlue,
                  ),
                ],
              ),
              userInfCard("Tyra Shelburne", "Senior Class"),
              userInfCard("Clinton Mcclure", "Junior Class"),
              userInfCard("Daryl Kulikowski", "Senior Class"),
              verticalSpacer(20),
            ],
          ),
        ),
      ),
    );
  }
}

Widget userInfCard(String title, String subtitle) {
  return GestureDetector(
    onTap: () {
      Get.to(() => TeacherPermissionsScreen());
    },
    child: Card(
      color: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: AppColors.bg.withValues(alpha: 0.9), width: 1),
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
        trailing: Container(
          height: 28.h,
          width: 28.w,
          decoration: BoxDecoration(
            color: AppColors.lightestGreyShade,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              AppImages.fillSetting,
              width: 23.w,
              height: 23.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ),
  );
}
