import 'package:quizzo/export.dart';

class SettingContactUsView extends StatefulWidget {
  const SettingContactUsView({super.key});

  @override
  State<SettingContactUsView> createState() => _SettingContactUsViewState();
}

class _SettingContactUsViewState extends State<SettingContactUsView> {
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
      appBar: customAppBar(title: "Contact Us"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpacer(20),
            Image.asset(AppImages.logo, fit: BoxFit.fill, height: 130.h),
            verticalSpacer(20),
            contactCard(icon: AppImages.whatsappSvg, title: "WhatsApp"),
            contactCard(icon: AppImages.web, title: "Website"),
            contactCard(icon: AppImages.fb, title: "Facebook"),
            contactCard(icon: AppImages.insta, title: "Instagram"),
            GestureDetector(
              onTap: () {
                viewFeaturePopUp(context);
              },
              child: contactCard(
                icon: AppImages.star,
                title: "Request a new feature",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget contactCard({required String icon, required String title}) {
  return Container(
    width: 390.w,
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
    margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: AppColors.lightestGreyShade),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(icon),
        horizontalSpacer(8),
        customText(
          text: title,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black,
        ),
      ],
    ),
  );
}
