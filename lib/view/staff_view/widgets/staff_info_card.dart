import 'package:quizzo/export.dart';

Widget staffInfoCard({
  required BuildContext context,
  required TextEditingController nameController,
  required String selectedGender,
  required bool isEdit,
  required TextEditingController phoneController,
  required TextEditingController educationController,
  required TextEditingController homePhoneController,
  required TextEditingController dobController,
  required String selectedClass,
  required TextEditingController homeAddressController,
  required TextEditingController addInfoController,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isEdit == false
              ? Container(
                height: 230.h,
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
                      text: "Staff Photo (optional)",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.blue,
                    ),
                  ],
                ),
              )
              : SizedBox.shrink(),
          verticalSpacer(20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                text: "Name *",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
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
              verticalSpacer(24),
              customText(
                text: "Gender *",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
              customDropdownField(
                context: context,
                contentPadding: 0,
                hintText: "",
                width: 390,
                borderRadius: 0,
                fillColor: AppColors.white,
                icon: AppImages.dropArrow,
                iconPath: AppImages.dropArrow,
                items: ["Select", "Male", "Female"],
                value: selectedGender.isEmpty ? null : selectedGender,
                onChanged: (val) {
                  selectedGender = val ?? "";
                },
              ),
              verticalSpacer(24),
              customText(
                text: "Education *",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
              customTextField(
                controller: educationController,
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
              verticalSpacer(24),
              customText(
                text: "Phone Number *",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
              customTextFieldSuffixIcon(
                controller: phoneController,
                readOnly: true,
                height: 48,
                width: 390,
                icon: AppImages.calender,
                isMinLine: 1,
                keyboardType: TextInputType.phone,
                fillColor: AppColors.lightestGreyShade,
                hintText: "",
                borderRadius: 0,
                obscureText: false,
                onShow: () {
                  selectDateBottomSheet(context, dobController);
                },
                context: context,
              ),
              verticalSpacer(24),
              customText(
                text: "Home Phone Number (optional)",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
              customTextFieldSuffixIcon(
                controller: homePhoneController,
                readOnly: false,
                height: 48,
                width: 390,
                icon: AppImages.calender,
                isMinLine: 1,
                keyboardType: TextInputType.phone,
                hintText: "",
                borderRadius: 0,
                obscureText: false,
                fillColor: AppColors.white,
                onShow: () {
                  selectDateBottomSheet(context, dobController);
                },
                context: context,
              ),
              verticalSpacer(18),
              customText(
                text: "Birth Date *",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
              customTextFieldSuffixIcon(
                controller: dobController,
                readOnly: true,
                height: 48,
                width: 390,
                icon: AppImages.calenderSvg,
                fillColor: AppColors.white,

                keyboardType: TextInputType.phone,
                hintText: "",
                borderRadius: 0,
                obscureText: false,
                onShow: () {
                  selectDateBottomSheet(context, dobController);
                },
                context: context,
              ),
              verticalSpacer(18),

              customText(
                text: "Class (optional)",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
              customDropdownField(
                context: context,
                contentPadding: 0,
                hintText: "",
                width: 390,
                borderRadius: 0,
                fillColor: AppColors.white,
                icon: AppImages.dropArrow,
                iconPath: AppImages.dropArrow,
                items: ["Select", "Senior", "Junior"],
                value: selectedClass.isEmpty ? null : selectedClass,
                onChanged: (val) {
                  selectedGender = val ?? "";
                },
              ),
              verticalSpacer(18),
              customText(
                text: "Home Address (optional)",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
              customTextFieldSuffixIcon(
                controller: homeAddressController,
                readOnly: false,
                height: 48,
                width: 390,
                icon: AppImages.calender,
                isMinLine: 1,
                keyboardType: TextInputType.text,
                hintText: "",
                borderRadius: 0,
                obscureText: false,
                onShow: () {
                  selectDateBottomSheet(context, dobController);
                },
                context: context,
              ),
              verticalSpacer(18),
              customText(
                text: "Additional Info (optional)",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
              customTextField(
                controller: addInfoController,
                width: 390,
                isMinLine: 1,
                isShow: false,
                keyboardType: TextInputType.text,
                hintText: "",
                borderRadius: 0,
                obscureText: false,
                onShow: () {
                  selectDateBottomSheet(context, dobController);
                },
                context: context,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
