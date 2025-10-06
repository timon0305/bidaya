

import 'package:quizzo/export.dart';
Widget customDropdownField({
  required BuildContext context,
  required String hintText,
   String? iconPath,
  Color? borderColor,
  required double width,
  double? height,
  Color? fillColor,
  double? hintFontSize,
  double? contentPadding,
  required double borderRadius,
  required String icon,
  required List<String> items,
  required void Function(String?) onChanged,
  String? value,
}) {
  return SizedBox(
    width: width.w,
   // height: height?.h,
    child: DropdownButtonFormField<String>(
      dropdownColor: AppColors.white,
      borderRadius: BorderRadius.circular(16.r),
      isDense: true,
      value: value ?? items.first,
      onChanged: onChanged,
      icon: iconPath != null && iconPath.isNotEmpty
          ? Padding(
        padding: EdgeInsets.only(right: 0.w),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            height: /*iconSize ??*/ 12.h,
            width: /*iconSize ??*/ 12.h,
            fit: BoxFit.scaleDown,
          ),
        ),
      ) : const Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
        size: 28,
      ),

      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? AppColors.bg,
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: borderColor??AppColors.purple, width: 1.w),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color:borderColor?? AppColors.purple, width: 1.w),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: borderColor??AppColors.purple, width: 1.w),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.placeholder,
          fontSize: hintFontSize ?? 20.sp,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontStyle: FontStyle.normal,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h,horizontal:
        contentPadding??18.w),
      ),
      style: TextStyle(
        color: AppColors.blackShade,
        fontSize: 20.sp,
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.bold,
      ),
      items: items
          .map((e) => DropdownMenuItem(
        enabled: true,

        value: e,
        child: Text(
          e,
          style: TextStyle(
            color: AppColors.blackShade,
            fontSize: 18.sp,
            fontFamily: GoogleFonts.nunito().fontFamily,
          ),
        ),
      ))
          .toList(),
    ),
  );
}
Widget customDropdownFieldWithPrefixIcon({
  required BuildContext context,
  required String hintText,
  String? iconPath, // trailing dropdown icon (optional SVG)
  String? prefixIconPath, // new param for prefix (left side)
  Color? borderColor,
  required double width,
  double? height,
  Color? fillColor,
  double? hintFontSize,
  required double borderRadius,
  required List<String> items,
  required void Function(String?) onChanged,
  String? value,
}) {
  return SizedBox(
    width: width.w,
    height: height?.h,
    child: DropdownButtonFormField<String>(
      dropdownColor: AppColors.white,
      borderRadius: BorderRadius.circular(16.r),
      isDense: true,
      value: value ?? items.first,
      onChanged: onChanged,
      icon: iconPath != null && iconPath.isNotEmpty
          ? Padding(
        padding: EdgeInsets.only(right: 0.w),
        child: SvgPicture.asset(
          iconPath,
          height: 16.h,
          width: 16.h,
          fit: BoxFit.scaleDown,
        ),
      )
          : const Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
        size: 28,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? AppColors.bg,
        prefixIcon: prefixIconPath != null && prefixIconPath.isNotEmpty
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: SvgPicture.asset(
            prefixIconPath,
            width: 20.w,
            height: 20.h,
            fit: BoxFit.scaleDown,
          ),
        ) : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
              color: borderColor ?? AppColors.purple, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
              color: borderColor ?? AppColors.purple, width: 1.w),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
              color: borderColor ?? AppColors.purple, width: 1.w),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.placeholder,
          fontSize: hintFontSize?.sp ?? 20.sp,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontStyle: FontStyle.normal,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: fillColor != null ? 18.w : 4.w,
        ),
      ),
      style: TextStyle(
        color: AppColors.blackShade,
        fontSize: 20.sp,
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.bold,
      ),
      items: items
          .map(
            (e) => DropdownMenuItem(
          value: e,
          child: Text(
            e,
            style: TextStyle(
              color: AppColors.blackShade,
              fontSize: 18.sp,
              fontFamily: GoogleFonts.nunito().fontFamily,
            ),
          ),
        ),
      )
          .toList(),
    ),
  );
}
