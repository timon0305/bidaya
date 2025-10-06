import 'package:quizzo/export.dart';

Widget customTabBar(TabController controller, List<String> tabTitles) {
  return Container(
    height: 60.h,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: AppColors.lightestGreyShade, width: 1.5.w),
      ),
    ),
    child: TabBar(
      controller: controller,
      splashBorderRadius: BorderRadius.circular(6.r),
      labelPadding: EdgeInsets.symmetric(horizontal: 0.w),
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.resolveWith<Color?>((
        Set<MaterialState> states,
      ) {
        return states.contains(MaterialState.focused)
            ? null
            : Colors.transparent;
      }),
      indicator: RoundedRectangleTabIndicator(
        color: AppColors.purple,
        weight: 6.w,
      ),
      dividerColor: Colors.transparent,
      labelColor: AppColors.purple,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: AppColors.sand.withValues(alpha: 0.8),
      labelStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
      dividerHeight: 0,
      tabs: tabTitles.map((title) => Tab(text: title)).toList(),
    ),
  );
}
