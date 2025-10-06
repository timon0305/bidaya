import 'dart:ui';
import 'package:quizzo/export.dart';
import 'package:quizzo/view/reporting_view/widgets/reporting_activity_card.dart';
import 'package:quizzo/view/reporting_view/widgets/reporting_food_card.dart';
import 'package:quizzo/view/reporting_view/widgets/reporting_mood_card.dart';
import 'package:quizzo/view/reporting_view/widgets/reporting_sleep_card.dart';
import 'package:quizzo/view/reporting_view/widgets/reporting_toilet_card.dart';

Future<String?> addNewReportPopup(
  BuildContext context, {
  required String title,
  required List<Map<String, String>> reportFeatureItems,
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
              child: Container(color: Colors.black.withValues(alpha: 0.5)),
            ),
          ),
          AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            insetPadding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 24.h,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 24.h,
            ),
            title: customText(
              text: title,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColors.blackShade,
            ),
            content: SizedBox(
              width: 400.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: reportFeatureItems.length - 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 167.w / 120.h,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.back();
                          if (index == 0) {
                            addFoodReportPopup(context);
                          }
                          if (index == 1) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  backgroundColor: Colors.white,
                                  insetPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 24,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: 24,
                                  ),
                                  content: sleepTimePopup(
                                    context: context,
                                    onSave: (bedtime, wakeup) {},
                                  ),
                                );
                              },
                            );
                          }
                          if (index == 2) {
                            addToiletReportPopup(context);
                          }
                          if (index == 3) {
                            addActivityReportPopup(context);
                          }
                          if (index == 4) {
                            addMoodReportPopup(context);
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Stack(
                            children: [
                              Image.asset(
                                reportFeatureItems[index]["image"].toString(),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 120.h,
                              ),
                              Container(
                                width: double.infinity,
                                height: 120.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withValues(alpha: 0.8),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),

                              Positioned(
                                left: 8.w,
                                bottom: 8.h,
                                child: customText(
                                  text:
                                      reportFeatureItems[index]["name"]
                                          .toString(),
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  verticalSpacer(12),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      addMoodReportPopup(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Stack(
                        children: [
                          Image.asset(
                            reportFeatureItems.last["image"].toString(),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 120.h,
                          ),
                          Container(
                            width: double.infinity,
                            height: 120.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withValues(alpha: 0.8),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            bottom: 8,
                            child: customText(
                              text: reportFeatureItems.last["name"].toString(),
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(24),
                  customButton(
                    context: context,
                    text: "Close",
                    fontSize: 16,
                    height: 58,
                    width: 382,
                    borderColor: AppColors.freshBlue.withValues(alpha: 0.04),
                    bgColor: AppColors.blue.withValues(alpha: 0.5),
                    overlayColor: Colors.white.withValues(alpha: 0.8),
                    fontColor: AppColors.blue,
                    borderRadius: 100,
                    isCircular: true,
                    fontWeight: FontWeight.w600,
                    onPressed: () {
                      Get.back();
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
