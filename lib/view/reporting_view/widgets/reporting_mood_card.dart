
import 'dart:ui';

import 'package:quizzo/export.dart';
import 'package:quizzo/view/reporting_view/widgets/reporting_food_card.dart';

Future<String?> addMoodReportPopup(
    BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      TextEditingController newController=TextEditingController();
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              title:  customText(
                  text: "New Report (Mood)",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.blackShade),
              content: SingleChildScrollView(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      text: "Mood:",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(28),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          imageWithText(title: "Low",image: AppImages.happy,context: context),
                          horizontalSpacer(4),
                          imageWithText(title: "Sleepy",image: AppImages.sleepy,context: context),
                          horizontalSpacer(4),
                          imageWithText(title: "Sad",image: AppImages.sad,context: context),
                          horizontalSpacer(4),
                          imageWithText(title: "Angry",image: AppImages.angry,context: context),
                          horizontalSpacer(4),
                          imageWithText(title: "Excited",image: AppImages.excited,context: context),
                          horizontalSpacer(4),
                          imageWithText(title: "Shy",image: AppImages.shy,context: context),
                          horizontalSpacer(4),
                          imageWithText(title: "Calm",image: AppImages.calm,context: context),
                          horizontalSpacer(4),
                          imageWithText(title: "Unwell",image: AppImages.unwell,context: context),
                          horizontalSpacer(4),
                          imageWithText(title: "worried",image: AppImages.worried,context: context),

                        ],
                      ),
                    ),
                    verticalSpacer(30),
                    customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),
                    verticalSpacer(12),
                    customText(
                      text: "Notes",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    customTextField(
                      controller: newController,
                      height: 48,
                      width: 390,
                      isMinLine: 1,
                      hintFontSize: 16,
                      keyboardType: TextInputType.text,
                      hintText: "Optional",
                      borderRadius: 12,
                      obscureText: false,
                      isShow: false,
                      onShow: () {},
                      context: context,
                    ),
                    verticalSpacer(12),
                    customDivider(height: 1, width: 400, color: AppColors.lightestGreyShade),
                    verticalSpacer(12),
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
                            onPressed: (){
                              Get.back();
                            },
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
                    )
                  ],
                ),
              )
          ),
        ],
      );
    },
  );
}
