
import 'dart:ui';

import 'package:quizzo/export.dart';
import 'package:quizzo/view/reporting_view/widgets/reporting_food_card.dart';
Future<String?> addToiletReportPopup(
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
                  text: "New Report (Toilet)",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.blackShade),
              content: SingleChildScrollView(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),
                    verticalSpacer(20),

                    customText(
                      text: "Toilet Type:",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(28),
                    Row(
                      children: [
                        imageWithText2(title: "Urine",image: AppImages.urine,context: context),
                        imageWithText2(title: "Stool",image: AppImages.stool,context: context),
                      ],
                    ),
                    verticalSpacer(30),
                    customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),
                    verticalSpacer(12),
                    customText(
                      text: "Location:",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(28),
                    Row(
                      children: [
                        imageWithText(title: "Diaper",image: AppImages.diaper,context: context),
                        imageWithText(title: "Clothes",image: AppImages.clothes,context: context),
                        imageWithText(title: "Toilet",image: AppImages.toilet,context: context),
                      ],
                    ),
                    verticalSpacer(12),
                    customText(
                      text: "Notes",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(28),
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