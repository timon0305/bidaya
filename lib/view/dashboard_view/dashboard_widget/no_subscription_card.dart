import 'package:quizzo/export.dart';


Widget noSubsCard(BuildContext context,{required String role}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(AppImages.noSub,height: 250.h,width: 250.w,),
      SizedBox(
        width: 200.w,
        child: customText(
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w700,
          fontSize: 32,
          color: AppColors.blackShade,
          text: "Subscription has ended",
        ),
      ),
      SizedBox(
        width: 270.w,
        child: customText(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: AppColors.placeholder,
          textAlign: TextAlign.center,
          text: "Please renew your subscription to continue using Bidaya ✨",
        ),
      ),
      verticalSpacer(100),
      role=="Admin"?
      customButton(
        context: context,
        text: "Manage Subscription",
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

        },
      ):SizedBox(),  ],
  );
}