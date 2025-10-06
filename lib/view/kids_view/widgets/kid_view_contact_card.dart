import 'package:quizzo/export.dart';

Widget kidViewContactCard(){
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
                  Center(child: customText(text: "Parent 1", fontWeight: FontWeight.w700, fontSize: 24, color:AppColors.purple)),
                  verticalSpacer(12),
                  customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),
                  verticalSpacer(8),
                  customText(text: "Name", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "Shelburne Mandi Martin", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                  verticalSpacer(12),
                  customText(text: "Phone", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "01054424522", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                  verticalSpacer(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                  customText(text: "Home Address", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "124, West Arabella", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                  verticalSpacer(12),
                  customText(text: "Authorized for Pickup", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "Yes", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                  verticalSpacer(12),

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: customText(text: "Emergency/Pickup Contact 1", fontWeight: FontWeight.w700, fontSize: 24, color:AppColors.purple)),
                  verticalSpacer(12),
                  customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),
                  verticalSpacer(8),
                  customText(text: "Name", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "Male", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                  verticalSpacer(12),
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
                  customText(text: "Relationship", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "Uncle", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),
                  verticalSpacer(12),
                  customText(text: "Authorized for Pickup", fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackShade),
                  verticalSpacer(8),
                  customText(text: "Yes", fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.sand),

                ],
              ),
            )
        ),
      ],
    ),
  );
}

