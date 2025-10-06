
import 'package:quizzo/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomExpansionTile extends StatefulWidget {
  final String label;
  final String index;
  final List<Widget> children;

  const CustomExpansionTile({
    required this.label,
    required this.children,
    Key? key, required this.index,
  }) : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(bottom: 8.h),
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightestGreyShade, width: 1),
        borderRadius:  BorderRadius.circular(12.r),

        color: AppColors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),

          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            backgroundColor:AppColors.white,
            initiallyExpanded: false,
            iconColor: AppColors.blackShade,
            collapsedIconColor: AppColors.blackShade,
            trailing: Padding(
                padding:  EdgeInsets.only(right: 15.w),
                child: SvgPicture.asset(AppImages.dropArrow,height: 14.h,width: 14.w,fit: BoxFit.scaleDown)
            ) ,
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
                text: widget.label, fontWeight: FontWeight.w700,
                fontSize: 14, color: AppColors.blackShade),
            children: widget.children,
            onExpansionChanged: (expanded) {
              setState(() {
                _isExpanded = expanded;
              });
            },
          ),
        ),
      ),
    );
  }
}