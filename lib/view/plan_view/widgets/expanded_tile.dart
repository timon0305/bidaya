import 'package:quizzo/export.dart';

class CustomExpansionTile extends StatefulWidget {
  final String label;
  final String index;
  final List<Widget> children;

  const CustomExpansionTile({
    required this.label,
    required this.children,
    super.key,
    required this.index,
  });

  @override
  State<CustomExpansionTile> createState() => CustomExpansionTileState();
}

class CustomExpansionTileState extends State<CustomExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(bottom: 8.h),
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightestGreyShade, width: 1),
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            backgroundColor: AppColors.white,
            initiallyExpanded: false,
            iconColor: AppColors.blackShade,
            collapsedIconColor: AppColors.blackShade,
            trailing: Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: SvgPicture.asset(
                AppImages.dropArrow,
                height: 14.h,
                width: 14.w,
                fit: BoxFit.scaleDown,
              ),
            ),
            leading: ReorderableDragStartListener(
              index: int.parse(widget.index),
              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: SvgPicture.asset(AppImages.dots),
              ),
            ),
            childrenPadding: EdgeInsets.zero,
            enabled: true,
            title: customText(
              text: widget.label,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColors.blackShade,
            ),
            children: widget.children,
            onExpansionChanged: (expanded) {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
