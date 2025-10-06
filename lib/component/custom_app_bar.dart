import 'package:quizzo/export.dart';

PreferredSize customAppBar({required String title}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight),
    child: Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: AppBar(
        excludeHeaderSemantics: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,
        elevation: 0,
        leadingWidth: 400.w,
        leading: Row(
          children: [
            horizontalSpacer(10),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back),
            ),
            horizontalSpacer(10),
            customText(
              text: title,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColors.blackShade,
            ),
          ],
        ),
      ),
    ),
  );
}
