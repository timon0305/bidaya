import 'package:quizzo/export.dart';
Widget staffViewInfoCard(){
  return SingleChildScrollView(
    child: Container(

        padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 12.h),
        width: 390.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.purple),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(12),

              customText(text: "Gender", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
              customText(text: "Male", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
              verticalSpacer(18),
              customText(text: "Age", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
              customText(text: "2 years, 3 months", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
              verticalSpacer(18),
              customText(text: "Birthdate", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
              customText(text: "August 16th, 2020", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
              verticalSpacer(18),
              customText(text: "Role", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
              customText(text: "Staff", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
              verticalSpacer(18),
              customText(text: "Education", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
              customText(text: "Master", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
              verticalSpacer(18),
              customText(text: "Address", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
              customText(text: "West Arabella, 2150 Ave. - Next to Sphinx Hotel.", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
              verticalSpacer(18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(text: "Phone", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                      verticalSpacer(8),
                      customText(text: "0227592421", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                      verticalSpacer(12),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.green
                      ),
                      child: SvgPicture.asset(AppImages.call)),
                ],
              ),
              verticalSpacer(18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(text: "Home Phone", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                      verticalSpacer(8),
                      customText(text: "0227592421", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                      verticalSpacer(12),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.green
                      ),
                      child: SvgPicture.asset(AppImages.call)),
                ],
              ),
              verticalSpacer(18),
              customText(text: "Additional Info", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
              customText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
              verticalSpacer(18),
              customText(text: "Join Date", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
              customText(text: "August 6th, 2025", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
              verticalSpacer(30),
            ],
          ),
        )
    ),
  );
}

Widget docCard(){
  return  Container(
    width: 390.w,
    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 18.h),
    margin:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 8.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.lightestGreyShade)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(AppImages.doc,color: AppColors.grey,),
        horizontalSpacer(8),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(text: "Waiver.docx", fontWeight: FontWeight.w700, fontSize: 18, color: AppColors.blackShade),
            customText(text: "August 17th, 2025",  fontWeight: FontWeight.w700, fontSize: 14, color: AppColors.placeholder)
          ],
        )
      ],
    ),
  );
}