import 'package:quizzo/export.dart';
import 'package:quizzo/view/staff_view/widgets/staff_view_info_card.dart';

class StaffViewDetail extends StatefulWidget {
  const StaffViewDetail({super.key});

  @override
  State<StaffViewDetail> createState() => _StaffViewDetailState();
}

class _StaffViewDetailState extends State<StaffViewDetail> {
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
      appBar: customAppBar(title: "View Details"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 390.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.lightestGreyShade),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 107.h,
                      width: 107.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppImages.avatarPng),
                        ),
                      ),
                    ),
                    horizontalSpacer(8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          text: "Tyra Shelburne",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: AppColors.blackShade,
                        ),
                        customText(
                          text: "Senior Class",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColors.placeholder,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpacer(12),
              staffViewInfoCard(),
            ],
          ),
        ),
      ),
    );
  }
}
