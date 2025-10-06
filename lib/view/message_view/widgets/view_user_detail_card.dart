import 'dart:ui';

import 'package:quizzo/export.dart';

Future<String?> viewDetailCardParentCard(BuildContext context) async {
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
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: "View Details",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.blackShade,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.clear, size: 16),
                ),
              ],
            ),
            content: SizedBox(
              child: userCard(
                name: "Nayal Khan",
                classStandard: "Junior",
                isParent: false,
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future<String?> viewDetailCardStaffAdmin(BuildContext context) async {
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
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: "View Details",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.blackShade,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.clear, size: 16),
                ),
              ],
            ),
            content: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: customText(
                        text: "  Parent",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.blackShade,
                      ),
                    ),
                    verticalSpacer(4),
                    userCard(
                      name: "Rai Bon",
                      classStandard: "Junior",
                      isParent: true,
                    ),
                    verticalSpacer(4),
                    Align(
                      alignment: Alignment.topLeft,
                      child: customText(
                        text: "  Kids(2)",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.blackShade,
                      ),
                    ),
                    verticalSpacer(4),
                    userCard(
                      name: "Nayal Khan",
                      classStandard: "Junior",
                      isParent: false,
                    ),
                    userCard(
                      name: "Sonam",
                      classStandard: "Senior",
                      isParent: false,
                    ),
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

Future<String?> viewDetailCardParent(BuildContext context) async {
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
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: "View Details",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.blackShade,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.clear, size: 16),
                ),
              ],
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    userCard(
                      name: "Nayal Khan",
                      classStandard: "Junior",
                      isParent: false,
                    ),
                    userCard(
                      name: "Sonam",
                      classStandard: "Senior",
                      isParent: false,
                    ),
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

Widget userCard({
  required String name,
  required String classStandard,
  required bool isParent,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.h),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20.h),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.lightestGreyShade),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.white,
          backgroundImage: AssetImage(AppImages.avatarPng),
        ),
        horizontalSpacer(12),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
              text: name,
              fontWeight: FontWeight.w700,
              color: AppColors.blackShade,
              fontSize: 18,
            ),
            customText(
              text: classStandard,
              fontWeight: FontWeight.w400,
              color: AppColors.placeholder,
              fontSize: 14,
            ),
          ],
        ),
        isParent
            ? Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.phone, color: AppColors.white),
            )
            : SizedBox.shrink(),
      ],
    ),
  );
}
