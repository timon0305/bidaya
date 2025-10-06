import 'dart:ui';

import 'package:quizzo/export.dart';
Future<String?> setPasswordPopUp(BuildContext context) async {
  return  showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      TextEditingController newPasswordController=TextEditingController();
      TextEditingController confirmPasswordController=TextEditingController();
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.black.withOpacity(0.5), ), // required
            ),
          ),
          AlertDialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                customText(
                  textAlign: TextAlign.center,
                  text: "Change Password",
                  color: AppColors.blackShade,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                verticalSpacer(12),
                customDivider(height: 1, width: 400, color: AppColors.lightestGreyShade),
                verticalSpacer(12)
              ],
            ),
            content: SizedBox(
              width: 400.w,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(text: "New Password *", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
                    verticalSpacer(4),
                    customTextFieldNoMultiLine(

                      hintFontSize: 14,
                      controller: confirmPasswordController,
                      height: 48,
                      width: 390,
                      isMinLine: 1,
                      keyboardType: TextInputType.text,
                      hintText: "   Confirm Password",
                      borderRadius: 12,
                      obscureText: true,

                      onShow: () {
                      },
                      context: context, isShow: true,
                    ),
                    verticalSpacer(20),
                    customText(text: "Confirm Password *", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
                    verticalSpacer(4),
                    customTextFieldNoMultiLine(

                      hintFontSize: 14,
                      controller: confirmPasswordController,
                      height: 48,
                      width: 390,
                      isMinLine: 1,
                      keyboardType: TextInputType.text,
                      hintText: "   Confirm Password",
                      borderRadius: 12,
                      obscureText: true,
                      isShow: true,

                      onShow: () {
                      },
                      context: context,
                    ),
                    verticalSpacer(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customButton(context: context,
                            text: "Cancel",
                            fontSize: 16,
                            height: 58,
                            width: 214,
                            borderColor: Colors.transparent,
                            bgColor: AppColors.lavenderPurple.withOpacity(0.4),
                            fontColor: AppColors.purple,
                            overlayColor: AppColors.white.withOpacity(0.5),
                            borderRadius: 100,
                            isCircular: true,
                            onPressed: (){
                          Get.back();
                            },
                            fontWeight: FontWeight.w500),
                        customButton(context: context,
                            text: "Save",
                            fontSize: 16,
                            height: 58,
                            width: 120,
                            borderColor: Colors.transparent,
                            bgColor: AppColors.purple,
                            fontColor: AppColors.white,
                            borderRadius: 100,
                            isCircular: false,
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                    verticalSpacer(24),
                  ],
                ),
              ),
            ),

          ),
        ],
      );
    },
  );

}
Future<String?> viewFeaturePopUp(BuildContext context) async {
  return  showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      TextEditingController newPasswordController=TextEditingController();
      TextEditingController confirmPasswordController=TextEditingController();
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.black.withOpacity(0.5), ), // required
            ),
          ),
          AlertDialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8),
            titlePadding: EdgeInsets.zero,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpacer(20),
                customText(
                  textAlign: TextAlign.center,
                  text: "🚀 Request a feature",
                  color: AppColors.blackShade,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                verticalSpacer(12),
                customDivider(height: 1, width: 400, color: AppColors.lightestGreyShade),
                verticalSpacer(12)
              ],
            ),
            content: SizedBox(
              width: 400.w,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(text: "✨ Tell us more:", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
                    verticalSpacer(4),
                    customText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris", fontWeight: FontWeight.w400, fontSize: 18, color: AppColors.blackShade),
                    verticalSpacer(24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customButton(context: context,
                              text: "Cancel",
                              fontSize: 16,
                              height: 58,
                              width: 214,
                              borderColor: Colors.transparent,
                              bgColor: AppColors.lavenderPurple.withOpacity(0.4),
                              fontColor: AppColors.purple,
                              overlayColor: AppColors.white.withOpacity(0.5),
                              borderRadius: 100,
                              isCircular: true,
                              fontWeight: FontWeight.w500),
                          customButton(context: context,
                              text: "Save",
                              fontSize: 16,
                              height: 58,
                              width: 120,
                              borderColor: Colors.transparent,
                              bgColor: AppColors.purple,
                              fontColor: AppColors.white,
                              borderRadius: 100,
                              isCircular: false,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                    ),
                    verticalSpacer(24),
                  ],
                ),
              ),
            ),

          ),
        ],
      );
    },
  );

}