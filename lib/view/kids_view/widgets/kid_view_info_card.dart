import 'package:quizzo/export.dart';
Widget kidViewInfoCard(){
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(

            padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 12.h),
            width: 382.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.purple),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: customText(text: "Personal Information", fontWeight: FontWeight.w700, fontSize: 24, color:AppColors.purple)),
                  verticalSpacer(12),
                  customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),
                  verticalSpacer(8),
                  customText(text: "Gender", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "Male", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                  verticalSpacer(12),
                  customText(text: "Age", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "2 years, 3 months", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                  verticalSpacer(12),
                  customText(text: "Birthdate", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "August 16th, 2020", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                  verticalSpacer(12),
                  customText(text: "Nationality", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "American", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                  verticalSpacer(12),
                  customText(text: "Religion", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "Muslim", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                  verticalSpacer(12),
                  customText(text: "Admission Date", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "August 6th, 2025", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                  verticalSpacer(12),
                  customText(text: "Address", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "West Arabella, 2150 Ave. - Next to Sphinx Hotel.", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
    
                ],
              ),
            )
        ),
        verticalSpacer(20),
        customDivider(height: 1, width: 400, color: AppColors.lightestGreyShade),
        verticalSpacer(20),
        Container(
    padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 12.h),
    width: 382.w,
    decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(16.r),
    border: Border.all(color: AppColors.purple),
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: customText(text: "Documents", fontWeight: FontWeight.w700, fontSize: 24, color:AppColors.purple)),
      verticalSpacer(12),
      customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),
      verticalSpacer(8),
      docCard(),
      docCard(),
      docCard()
    
    ],
    )
    ),
        verticalSpacer(30),
      ],
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
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.lightestGreyShade
            ),
            child: SvgPicture.asset(AppImages.doc,color: AppColors.grey,)),
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