import 'package:quizzo/export.dart';

Widget kidInfoCard({
  required BuildContext context,
  required TextEditingController nameController,
  required TextEditingController phoneController,
  required String selectedGender,
  required TextEditingController dobController,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 230.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.purple.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.purple),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.imagePlaceholder),
                verticalSpacer(8),
                customText(
                  text: "Child Photo (optional)",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.blue,
                ),
              ],
            ),
          ),
          verticalSpacer(20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                text: "Name *",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
              verticalSpacer(8),
              customTextField(
                controller: nameController,
                height: 48,
                width: 390,
                isMinLine: 1,
                keyboardType: TextInputType.text,
                hintText: "",
                borderRadius: 12,
                obscureText: false,
                isShow: false,
                onShow: () {},
                context: context,
              ),
              verticalSpacer(20),
              customText(
                text: "Nationality *",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
              verticalSpacer(8),
              customTextField(
                controller: phoneController,
                height: 48,
                width: 390,
                isMinLine: 1,
                keyboardType: TextInputType.text,
                hintText: "",
                borderRadius: 12,
                obscureText: false,
                isShow: false,
                onShow: () {},
                context: context,
              ),
              verticalSpacer(20),
              customText(
                text: "Date of Birth *",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
              verticalSpacer(8),
              customTextFieldSuffixIcon(
                controller: dobController,
                readOnly: true,
                height: 48,
                width: 390,
                icon: AppImages.calenderSvg,
                isMinLine: 1,
                keyboardType: TextInputType.phone,
                hintText: "",
                borderRadius: 0,
                obscureText: false,
                onShow: () {
                  selectDateBottomSheet(context, dobController);
                },
                context: context,
              ),
              verticalSpacer(20),
              customText(
                text: "Gender *",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
              verticalSpacer(8),
              customDropdownField(
                context: context,
                contentPadding: 0,
                hintText: "",
                width: 390,
                borderRadius: 0,
                fillColor: AppColors.white,
                icon: AppImages.dropdownArrow,
                iconPath: AppImages.dropdownArrow,
                items: ["Male", "Female"],
                value: selectedGender.isEmpty ? null : selectedGender,
                onChanged: (val) {
                  selectedGender = val ?? "";
                },
              ),
              verticalSpacer(20),
              customText(
                text: "Religion *",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
              verticalSpacer(8),
              customDropdownField(
                context: context,
                fillColor: AppColors.white,
                contentPadding: 0,
                hintText: "",
                width: 390,
                borderRadius: 0,

                iconPath: AppImages.dropdownArrow,
                icon: AppImages.dropdownArrow,
                items: ["Islam", "Christian", "Athiest"],
                value: selectedGender.isEmpty ? null : selectedGender,
                onChanged: (val) {
                  selectedGender = val ?? "";
                },
              ),
              verticalSpacer(20),
              Container(
                height: 128.h,
                width: 382.w,
                decoration: BoxDecoration(
                  color: AppColors.purple.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.purple),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.imagePlaceholder),
                    verticalSpacer(8),
                    customText(
                      text: "Upload Documents (optional)",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColors.purple,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
