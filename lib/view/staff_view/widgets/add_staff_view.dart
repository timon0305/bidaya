import 'dart:ui';

import 'package:quizzo/export.dart';

Future<String?> addStaffPopup(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      TextEditingController newController = TextEditingController();
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.black.withValues(alpha: 0.5)),
            ),
          ),
          AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 44),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            title: SizedBox(),
            titlePadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        text: "Add Staff Member",
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: AppColors.blackShade,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(AppImages.cross),
                      ),
                    ],
                  ),

                  verticalSpacer(12),
                  customDivider(
                    height: 1,
                    width: 430,
                    color: AppColors.lightestGreyShade,
                  ),
                  verticalSpacer(12),
                  customText(
                    text:
                        "Enter the phone number of the staff member you want to add to your nursery.",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.blackShade,
                  ),
                  verticalSpacer(8),
                  customText(
                    text: "Phone Number",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.blackShade,
                  ),
                  verticalSpacer(8),
                  customTextField(
                    controller: newController,
                    height: 48,
                    width: double.infinity,
                    isMinLine: 1,
                    hintFontSize: 16,
                    keyboardType: TextInputType.text,
                    hintText: "01012345678",
                    borderRadius: 12,
                    obscureText: false,
                    isShow: false,
                    onShow: () {},
                    context: context,
                  ),

                  verticalSpacer(20),
                  customButton(
                    context: context,
                    text: "Continue",
                    fontSize: 16,
                    height: 48,
                    width: 400,
                    borderColor: Colors.transparent,
                    bgColor: AppColors.purple,
                    fontColor: AppColors.white,
                    borderRadius: 100,
                    isCircular: false,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                      Get.to(
                        () => AddStaffView(
                          phone: newController.text,
                          isEdit: false,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
