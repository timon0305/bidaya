



import 'package:quizzo/export.dart';

Widget customText({
  required String text,
  required FontWeight fontWeight,
  required double fontSize,
  required Color color,
  TextOverflow? textFlow,
  int? maxLine,
  Color? decorationColor,
  TextDecoration? decoration,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    overflow: textFlow,
    textAlign: textAlign,
    maxLines: maxLine,
    style: GoogleFonts.nunito(
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
    ),
  );
}
