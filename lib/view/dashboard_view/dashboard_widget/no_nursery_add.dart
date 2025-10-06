import 'package:quizzo/export.dart';


Widget notAddedInNursery(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(AppImages.noNursery,height: 294.h,width: 294.w,),
      customText(
        fontWeight: FontWeight.w700,
        fontSize: 32,
        color: AppColors.blackShade,
        text: "Oops!",
      ),
      customText(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: AppColors.placeholder,
        textAlign: TextAlign.center,
        text: "Looks like you’re not linked to a nursery yet. Contact your nursery to get added 💌👶",
      ),
    ],
  );
}