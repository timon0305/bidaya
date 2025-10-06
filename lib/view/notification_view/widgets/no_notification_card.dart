import 'package:quizzo/export.dart';


Widget noNotificationCard(){
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 38.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpacer(150),
        SvgPicture.asset(AppImages.noNotification,height: 80.h,width: 80.w,),
        customText(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: AppColors.blackShade,
          text: "No Notifications",
        ),
        verticalSpacer(20),
        customText(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: AppColors.placeholder,
          textAlign: TextAlign.center,
          text: "We’ll let you know when there will be something to update you.",
        ),
      ],
    ),
  );
}