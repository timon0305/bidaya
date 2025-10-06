import 'package:quizzo/export.dart';

class SettingManageSubscription extends StatefulWidget {
  const SettingManageSubscription({super.key});
  @override
  State<SettingManageSubscription> createState() =>
      _SettingManageSubscriptionState();
}

class _SettingManageSubscriptionState extends State<SettingManageSubscription> {
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
      appBar: customAppBar(title: "Manage Subscription"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  AppImages.subPlaceholder,
                  height: 100.h,
                  width: 390.w,
                  fit: BoxFit.cover,
                ),
              ),
              verticalSpacer(12),
              Align(
                alignment: Alignment.topLeft,
                child: customText(
                  text: "Current Plan:",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              verticalSpacer(12),
              Container(
                width: 334.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.lightestGreyShade),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      text: "1 Month",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.blackShade,
                    ),
                    verticalSpacer(10),
                    customText(
                      text: "Started: 8/11/2025",
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppColors.sand,
                    ),
                    customText(
                      text: "Expires: 8/12/2025",
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppColors.sand,
                    ),
                    verticalSpacer(12),
                    Align(
                      alignment: Alignment.center,
                      child: customButtonWithPrefixIcon(
                        widget: SvgPicture.asset(AppImages.clear),
                        context: context,
                        text: "Cancel Subscription",
                        fontSize: 16,
                        height: 58,
                        width: 300,
                        borderColor: Colors.transparent,
                        bgColor: AppColors.red,
                        overlayColor: AppColors.white.withValues(alpha: 0.8),
                        fontColor: AppColors.redShade,
                        borderRadius: 100,
                        isCircular: true,
                        fontWeight: FontWeight.w700,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(12),
              customDivider(
                height: 1,
                width: 390,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(12),
              Align(
                alignment: Alignment.topLeft,
                child: customText(
                  text: "Plans:",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              verticalSpacer(12),
              Container(
                width: 334.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.lightestGreyShade),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      text: "14 days",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.blackShade,
                    ),
                    verticalSpacer(10),
                    customText(
                      text:
                          "Try Bidaya completely free for 14 days! Explore all the core features with no credit card required. Perfect for testing how Bidaya system can simplify managing your nursery.",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.sand,
                    ),
                    verticalSpacer(12),
                    Align(
                      alignment: Alignment.center,
                      child: customButtonWithPrefixIcon(
                        widget: SvgPicture.asset(AppImages.info),
                        context: context,
                        text: "Trial used",
                        fontSize: 16,
                        height: 58,
                        width: 300,
                        borderColor: Colors.transparent,
                        bgColor: AppColors.sand,
                        overlayColor: AppColors.white.withValues(alpha: 0.8),
                        fontColor: AppColors.sand,
                        borderRadius: 100,
                        isCircular: true,
                        fontWeight: FontWeight.w700,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(12),
              verticalSpacer(12),
              Container(
                width: 334.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.lightestGreyShade),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      text: "1 Month",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.blackShade,
                    ),
                    verticalSpacer(10),
                    customText(
                      text:
                          "Flexible and affordable. Ideal for nurseries that want to grow month-by-month with full access to Bidaya's",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.sand,
                    ),
                    verticalSpacer(12),
                    Align(
                      alignment: Alignment.center,
                      child: customButtonWithPrefixIcon(
                        widget: SvgPicture.asset(AppImages.shield),
                        context: context,
                        text: "Current Plan",
                        fontSize: 16,
                        height: 58,
                        width: 300,
                        borderColor: Colors.transparent,
                        bgColor: AppColors.sand,
                        overlayColor: AppColors.white.withValues(alpha: 0.8),
                        fontColor: AppColors.sand,
                        borderRadius: 100,
                        isCircular: true,
                        fontWeight: FontWeight.w700,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(12),
              Container(
                width: 334.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.lightestGreyShade),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      text: "12 Months (20% OFF)",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.purple,
                    ),
                    verticalSpacer(10),
                    customText(
                      text:
                          "Save 20% with our most popular plan! Designed for nurseries looking for long-term growth and stability. Includes everything in the Monthly Plan plus 2 months free (you save EGP 2,160!)",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.sand,
                    ),
                    verticalSpacer(12),
                    Align(
                      alignment: Alignment.center,
                      child: customButtonWithPrefixIcon(
                        widget: SvgPicture.asset(AppImages.cart),
                        context: context,
                        text: "Subscribe",
                        fontSize: 16,
                        height: 58,
                        width: 300,
                        borderColor: Colors.transparent,
                        bgColor: AppColors.lavenderPurple,
                        overlayColor: AppColors.white.withValues(alpha: 0.6),
                        fontColor: AppColors.purple,
                        borderRadius: 100,
                        isCircular: true,
                        fontWeight: FontWeight.w700,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(12),
              customDivider(
                height: 1.5,
                width: 432,
                color: AppColors.lightestGreyShade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
