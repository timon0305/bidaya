
import 'package:quizzo/export.dart';
SnackbarController snackBar({required String title,required String subTitle,required Color bgColor}){
 return Get.snackbar(
    title,
    subTitle,
    snackPosition: SnackPosition.TOP,
    colorText: AppColors.white,
    backgroundColor: bgColor,
    borderRadius: 12,
  );
}