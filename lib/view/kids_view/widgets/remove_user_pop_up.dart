import 'dart:ui';

import 'package:quizzo/export.dart';

Future<String?> removeUserPopup(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
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
                  customText(
                    text: "Remove Student",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.blackShade,
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
                        "Are you sure you want to remove [STUDENT NAME] from the nursery? This action will permanently delete their record and cannot be undone.",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.blackShade,
                  ),
                  verticalSpacer(20),
                  Row(
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
                        isCircular: true,
                        fontWeight: FontWeight.w500,
                      ),
                      customButton(
                        context: context,
                        text: "Remove",
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
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
