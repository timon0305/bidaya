import 'package:quizzo/export.dart';

Widget kidViewMedicineCard() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
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
                Center(
                  child: customText(
                    text: "Medicines",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.purple,
                  ),
                ),
                verticalSpacer(12),
                customDivider(
                  height: 1,
                  width: 390,
                  color: AppColors.lightestGreyShade,
                ),
                verticalSpacer(8),
                customText(
                  text: "Amoxicillin",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.blackShade,
                ),
                verticalSpacer(8),
                customText(
                  text:
                      "Take 5 ml twice daily after meals. Shake well before use and store in the refrigerator.",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.sand,
                ),
                verticalSpacer(12),
                customText(
                  text: "Albuterol",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.blackShade,
                ),
                verticalSpacer(8),
                customText(
                  text:
                      "2 puffs as needed up to 3 times per day. Use with spacer during wheezing episodes. Notify parents if used more than once during school hours.",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.sand,
                ),
                verticalSpacer(12),
              ],
            ),
          ),
        ),
        verticalSpacer(20),
        customDivider(
          height: 1,
          width: 400,
          color: AppColors.lightestGreyShade,
        ),
        verticalSpacer(20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
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
                Center(
                  child: customText(
                    text: "Allergies",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.purple,
                  ),
                ),
                verticalSpacer(12),
                customDivider(
                  height: 1,
                  width: 390,
                  color: AppColors.lightestGreyShade,
                ),
                verticalSpacer(8),
                customText(
                  text: "Peanut Allergy",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.blackShade,
                ),
                verticalSpacer(8),
                customText(
                  text:
                      "Symptoms may include hives, swelling of lips/tongue, and difficulty breathing. Avoid all peanut products.",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.sand,
                ),
                verticalSpacer(12),
                customText(
                  text: "Dairy Allergy",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.blackShade,
                ),
                verticalSpacer(8),
                customText(
                  text:
                      "Symptoms may include rash, stomach cramps, and diarrhea. Avoid milk, cheese, and other dairy products. Provide dairy-free alternatives and notify parents if exposed.",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.sand,
                ),
                verticalSpacer(12),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
