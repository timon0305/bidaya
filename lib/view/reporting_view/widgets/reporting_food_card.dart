import 'dart:ui';
import 'package:quizzo/export.dart';

Future<String?> addFoodReportPopup(BuildContext context) async {
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
            insetPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 24.h,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 0.w,
              vertical: 24.h,
            ),
            title: customText(
              text: "New Report (Meal)",
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColors.blackShade,
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customDivider(
                          height: 1,
                          width: 390,
                          color: AppColors.lightestGreyShade,
                        ),
                        verticalSpacer(20),
                        customText(
                          text: "Meal Type:",
                          color: AppColors.blackShade,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        verticalSpacer(20),
                        Padding(
                          padding: EdgeInsets.only(right: 24.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              imageWithText(
                                title: "Breakfast",
                                image: AppImages.breakFast,
                                context: context,
                              ),
                              imageWithText(
                                title: "Snack",
                                image: AppImages.snack,
                                context: context,
                              ),
                              imageWithText(
                                title: "Lunch",
                                image: AppImages.reportLunchMeal,
                                context: context,
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
                        customText(
                          text: "Amount Eaten:",
                          color: AppColors.blackShade,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        verticalSpacer(20),
                        Padding(
                          padding: EdgeInsets.only(right: 24.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              imageWithText2(
                                title: "All",
                                image: AppImages.allFood,
                                context: context,
                              ),
                              imageWithText2(
                                title: "Some",
                                image: AppImages.someFood,
                                context: context,
                              ),
                              imageWithText2(
                                title: "None",
                                image: AppImages.noFood,
                                context: context,
                              ),
                            ],
                          ),
                        ),
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
                      ],
                    ),
                  ),
                  verticalSpacer(24),
                  customDivider(
                    height: 1,
                    width: double.infinity,
                    color: AppColors.lightestGreyShade,
                  ),
                  verticalSpacer(24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customButton(
                          context: context,
                          text: "Cancel",
                          fontSize: 16,
                          height: 58,
                          width: 214,
                          borderColor: Colors.transparent,
                          bgColor: AppColors.lavenderPurple.withValues(
                            alpha: 0.4,
                          ),
                          fontColor: AppColors.purple,
                          overlayColor: AppColors.white.withValues(alpha: 0.5),
                          borderRadius: 100,
                          onPressed: () {
                            Get.back();
                          },
                          isCircular: true,
                          fontWeight: FontWeight.w500,
                        ),
                        customButton(
                          context: context,
                          text: "Save",
                          fontSize: 16,
                          height: 58,
                          width: 120,
                          borderColor: Colors.transparent,
                          bgColor: AppColors.purple,
                          fontColor: AppColors.white,
                          borderRadius: 100,
                          isCircular: false,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
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

/*Widget imageWithText({required String title,required String image}){
  return   Column(
    children: [
      Image.asset(image,height: 80.h,width: 80.w,fit: BoxFit.scaleDown,),
      customText(
        text: title,
        color: AppColors.blackShade,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ],
  );
}*/
Widget imageWithText({
  required String title,
  required String image,
  required BuildContext context,
}) {
  final selectionProvider = Provider.of<QuickActionViewModel>(context);
  final isSelected = selectionProvider.selectedTitle == title;

  return GestureDetector(
    onTap: () {
      selectionProvider.select(title);
    },
    child: Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.purple : Colors.transparent,
                width: 3.w,
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          verticalSpacer(8),
          customText(
            text: title,
            color: AppColors.blackShade,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    ),
  );
}

Widget imageWithText2({
  required String title,
  required String image,
  required BuildContext context,
}) {
  final selectionProvider = Provider.of<QuickActionViewModel>(context);
  final isSelected = selectionProvider.selectedTitle2 == title;

  return GestureDetector(
    onTap: () {
      selectionProvider.select2(title);
    },
    child: Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.purple : Colors.transparent,
                width: 3.w,
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          verticalSpacer(8),
          customText(
            text: title,
            color: AppColors.blackShade,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    ),
  );
}
