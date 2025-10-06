import 'dart:ui';

import 'package:quizzo/export.dart';

/*Future<String?> exitAppPopUp(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customText(
              textAlign: TextAlign.center,
              text: "Exit App",
              color: AppColors.grey,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width / 2.6,
          child: customText(
            textAlign: TextAlign.center,
            text: "Do you really want to exit the app?",
            color: AppColors.blackShade,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop("No");
                },
                child: Container(
                  height: 30.h,
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: customText(
                      text: 'Cancel',
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      color: Theme.of(context).scaffoldBackgroundColor == AppColors.white
                          ? AppColors.white
                          : AppColors.darkBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Container(
                  height: 30.h,
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.sky,
                  ),
                  child: Center(
                    child: customText(
                      text: 'Confirm',
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Future<String?> alertDialogForLogout(BuildContext context) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        title: Center(
          child: customText(
            text: 'Confirm',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).scaffoldBackgroundColor == AppColors.white
                ? AppColors.darkBlue
                : AppColors.white,
          ),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width / 2.6,
          child: customText(
            text: 'Are you sure you want to logout?',
            textAlign: TextAlign.center,
            fontSize: 14,
            color: Theme.of(context).scaffoldBackgroundColor == AppColors.white
                ? AppColors.darkBlue
                : AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop("No");
                },
                child: Container(
                  height: 30.h,
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: customText(
                      text: 'Cancel',
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      color: Theme.of(context).scaffoldBackgroundColor == AppColors.white
                          ? AppColors.white
                          : AppColors.darkBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                 Get.to(()=>SignInView());
                },
                child: Container(
                  height: 30.h,
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.sky,
                  ),
                  child: Center(
                    child: customText(
                      text: 'Confirm',
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}*/

Future<String?> customMessagePopup(
  BuildContext context, {
  required String icon,
  required String title,
  required String subTitle,
  required String buttonTitle,
  VoidCallback? onButtonPressed,
}) async {
  return showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: Colors.black.withValues(alpha: 0.5),
              ), // required
            ),
          ),
          AlertDialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(44.r)),
            ),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 186.w,
                  height: 180.h,
                  fit: BoxFit.contain,
                ),
                customText(
                  textAlign: TextAlign.center,
                  text: title,
                  color: AppColors.purple,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width / 4.6,
              child: customText(
                textAlign: TextAlign.center,
                text: subTitle,
                color: AppColors.blackShade,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              onButtonPressed != null
                  ? customButton(
                    context: context,
                    text: buttonTitle,
                    fontSize: 16,
                    height: 58,
                    width: 276,
                    borderColor: Colors.transparent,
                    bgColor: AppColors.blue,
                    fontColor: Colors.white,
                    borderRadius: 100,
                    isCircular: true,
                    fontWeight: FontWeight.w600,
                    onPressed: onButtonPressed,
                  )
                  : Center(
                    child: SpinKitCircle(color: AppColors.purple, size: 55),
                  ),
            ],
          ),
        ],
      );
    },
  );
}
