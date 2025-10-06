import 'package:quizzo/export.dart';

Widget customTextField({
  required BuildContext context,
  required TextEditingController controller,
  double? height,
  double? hintFontSize,
  required double width,
  required String hintText,
  required double borderRadius,
  required bool obscureText,
  required bool isShow,
  required void Function() onShow,
  void Function(String)? onChanged,
  TextInputType? keyboardType,
  FocusNode? inputFocusNode,
  int? maxLines,
  int? minLines,
  int? isMinLine,
}) {
  return SizedBox(
    width: width.w,
    child: TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      mouseCursor: WidgetStateMouseCursor.textable,
      cursorColor: AppColors.purple,
      cursorRadius: const Radius.circular(0),
      controller: controller,
      focusNode: inputFocusNode,
      autocorrect: true,
      obscureText: obscureText,
      minLines: isMinLine ?? 1,
      maxLines: isShow == false ? maxLines : null,
      style: TextStyle(
        color: AppColors.blackShade,
        fontSize: hintFontSize ?? 20.sp,
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      readOnly: false,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.purple, width: 1.w),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.purple, width: 1.w),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.purple, width: 1.w),
        ),
        hintText: hintText,
        enabled: true,
        suffixIcon:
            isShow
                ? GestureDetector(
                  onTap: onShow,
                  child: Icon(
                    obscureText
                        ? Icons.visibility_off_sharp
                        : Icons.visibility_sharp,
                    color: AppColors.purple,
                    size: 24.w,
                  ),
                )
                : null,
        hintStyle: TextStyle(
          color: AppColors.placeholder,
          fontSize: hintFontSize ?? 20.sp,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontStyle: FontStyle.normal,
        ),
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 0.w),
        filled: true,
      ),
    ),
  );
}

Widget customTextFieldNoMultiLine({
  required BuildContext context,
  required TextEditingController controller,
  double? height,
  double? hintFontSize,
  required double width,
  required String hintText,
  required double borderRadius,
  required bool obscureText,
  required bool isShow,
  required void Function() onShow,
  void Function(String)? onChanged,
  TextInputType? keyboardType,
  FocusNode? inputFocusNode,

  int? isMinLine,
}) {
  return SizedBox(
    width: width.w,
    child: TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      mouseCursor: WidgetStateMouseCursor.textable,
      cursorColor: AppColors.purple,
      cursorRadius: const Radius.circular(0),
      controller: controller,
      focusNode: inputFocusNode,
      autocorrect: true,
      obscureText: obscureText,
      maxLines: 1,
      style: TextStyle(
        color: AppColors.blackShade,
        fontSize: hintFontSize ?? 20.sp,
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      readOnly: false,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.purple, width: 1.w),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.purple, width: 1.w),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.purple, width: 1.w),
        ),
        hintText: hintText,
        enabled: true,
        suffixIcon:
            isShow
                ? GestureDetector(
                  onTap: onShow,
                  child: Icon(
                    obscureText
                        ? Icons.visibility_off_sharp
                        : Icons.visibility_sharp,
                    color: AppColors.purple,
                    size: 24.w,
                  ),
                )
                : null,
        hintStyle: TextStyle(
          color: AppColors.placeholder,
          fontSize: hintFontSize ?? 20.sp,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontStyle: FontStyle.normal,
        ),
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 0.w),
        filled: true,
      ),
    ),
  );
}

Widget customTextFieldSuffixIcon({
  required BuildContext context,
  required TextEditingController controller,
  double? height,
  double? hintFontSize,
  Color? borderClr,
  Color? fillColor,
  required double width,
  required String icon,
  required String hintText,
  required double borderRadius,
  required bool obscureText,
  required bool readOnly,
  required void Function() onShow,
  void Function(String)? onChanged,
  TextInputType? keyboardType,
  FocusNode? inputFocusNode,
  int? maxLines,
  int? isMinLine,
}) {
  return SizedBox(
    width: width.w,
    // height: height?.h,
    child: TextFormField(
      readOnly: readOnly,
      keyboardType: keyboardType,
      onChanged: onChanged,
      mouseCursor: WidgetStateMouseCursor.textable,
      cursorColor: AppColors.purple,
      cursorRadius: const Radius.circular(0),
      controller: controller,
      focusNode: inputFocusNode,
      autocorrect: true,
      obscureText: obscureText,
      minLines: isMinLine ?? 1,
      maxLines: maxLines,
      style: TextStyle(
        color: AppColors.blackShade,
        fontSize: hintFontSize ?? 20.sp,
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: borderClr ?? AppColors.purple,
            width: 1.w,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: borderClr ?? AppColors.purple,
            width: 1.w,
          ),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: borderClr ?? AppColors.purple,
            width: 1.w,
          ),
        ),
        hintText: hintText,
        enabled: true,
        suffixIconConstraints: BoxConstraints(
          minHeight: 28.h,
          minWidth: 28.w,
          maxHeight: 32.h,
          maxWidth: 32.w,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: GestureDetector(onTap: onShow, child: SvgPicture.asset(icon)),
        ),
        hintStyle: TextStyle(
          color: AppColors.placeholder,
          fontSize: hintFontSize ?? 16.sp,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontStyle: FontStyle.normal,
        ),
        fillColor: fillColor ?? Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        filled: true,
      ),
    ),
  );
}

Widget customTextFieldSuffixIconForOnlyBorderDecoration({
  required BuildContext context,
  required TextEditingController controller,
  double? height,
  double? hintFontSize,
  Color? borderClr,
  Color? fillColor,
  required double width,
  required String icon,
  required String hintText,
  required double borderRadius,
  required bool obscureText,
  required bool readOnly,
  required void Function() onShow,
  void Function(String)? onChanged,
  TextInputType? keyboardType,
  FocusNode? inputFocusNode,

  int? isMaxLine,
}) {
  return SizedBox(
    width: width.w,
    // height: height?.h,
    child: TextFormField(
      readOnly: readOnly,
      keyboardType: keyboardType,
      onChanged: onChanged,
      mouseCursor: WidgetStateMouseCursor.textable,
      cursorColor: AppColors.purple,
      cursorRadius: const Radius.circular(0),
      controller: controller,
      focusNode: inputFocusNode,
      autocorrect: true,
      obscureText: obscureText,
      maxLines: isMaxLine ?? 1,
      style: TextStyle(
        color: AppColors.blackShade,
        fontSize: hintFontSize ?? 20.sp,
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: borderClr ?? AppColors.purple,
            width: 1.w,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: borderClr ?? AppColors.purple,
            width: 1.w,
          ),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: borderClr ?? AppColors.purple,
            width: 1.w,
          ),
        ),
        hintText: hintText,
        enabled: true,
        suffixIconConstraints: BoxConstraints(
          minHeight: 28.h,
          minWidth: 28.w,
          maxHeight: 32.h,
          maxWidth: 32.w,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: GestureDetector(onTap: onShow, child: SvgPicture.asset(icon)),
        ),
        hintStyle: TextStyle(
          color: AppColors.placeholder,
          fontSize: hintFontSize ?? 16.sp,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontStyle: FontStyle.normal,
        ),
        fillColor: fillColor ?? Colors.transparent,
        contentPadding: EdgeInsets.only(top: 6.h, left: 4.w),
        filled: true,
      ),
    ),
  );
}

Widget customTextFieldPrefixIcon({
  required BuildContext context,
  required TextEditingController controller,
  double? height,
  double? hintFontSize,
  Color? hintClr,
  Color? fillColor,
  required double width,
  required String icon,
  required String hintText,
  required double borderRadius,
  required Color borderClr,
  required bool obscureText,
  required bool readOnly,
  required void Function() onShow,
  void Function(String)? onChanged,
  TextInputType? keyboardType,
  FocusNode? inputFocusNode,
  int? minLines,
  int? maxLines,
  int? isMinLine,
}) {
  return SizedBox(
    width: width.w,
    // height: height?.h,
    child: TextFormField(
      readOnly: readOnly,
      keyboardType: keyboardType,
      onChanged: onChanged,
      mouseCursor: WidgetStateMouseCursor.textable,
      cursorColor: AppColors.purple,
      cursorRadius: const Radius.circular(0),
      controller: controller,
      focusNode: inputFocusNode,
      autocorrect: true,
      obscureText: obscureText,
      minLines: isMinLine ?? 1,
      maxLines: maxLines,
      style: TextStyle(
        color: AppColors.blackShade,
        fontSize: hintFontSize ?? 20.sp,
        fontFamily: GoogleFonts.nunito().fontFamily,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: Colors.transparent, width: 1.w),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: borderClr, width: 1.w),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(color: borderClr, width: 1.w),
        ),
        hintText: hintText,
        enabled: true,
        prefixIconConstraints: BoxConstraints(
          minHeight: 24.h,
          minWidth: 24.w,
          maxHeight: 32.h,
          maxWidth: 32.w,
        ),
        prefixIcon: GestureDetector(
          onTap: onShow,
          child: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: SvgPicture.asset(icon),
          ),
        ),
        hintStyle: TextStyle(
          color: hintClr,
          fontSize: hintFontSize ?? 20.sp,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontStyle: FontStyle.normal,
        ),
        fillColor: fillColor ?? Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 4.w),
        filled: true,
      ),
    ),
  );
}
