import 'package:quizzo/export.dart';

Widget selectAccountCard() {
  return Consumer<SignupViewModel>(
    builder: (context, auth, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpacer(60),
          customText(
            text: "What type of account do you like to create? 👦",
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: AppColors.blackShade,
          ),
          verticalSpacer(40),
          accountCard(
            "Nursery Owner",
            AppColors.blueShade,
            AppImages.user,
            nextStep: () {
              auth.updateAccountType("Nursery Owner");
            },
          ),
          accountCard(
            "Teacher",
            AppColors.amber,
            AppImages.teacher,
            nextStep: () {
              auth.updateAccountType("Teacher");
            },
          ),
          accountCard(
            "Parent",
            AppColors.teal,
            AppImages.parent,
            nextStep: () {
              auth.updateAccountType("Parent");
            },
          ),
        ],
      );
    },
  );
}

Widget infoCard({
  required BuildContext context,
  required TextEditingController nameController,
  required TextEditingController phoneController,
  required String selectedGender,
  required TextEditingController dobController,
  required ValueChanged<String> onGenderChanged,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacer(20),
        customText(
          text: "Tell Us About Yourself ✨",
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w700,
          fontSize: 32,
          color: AppColors.blackShade,
        ),
        verticalSpacer(40),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
              text: "Full Name",
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
              hintText: "Enter Name",
              borderRadius: 12,
              obscureText: false,
              isShow: false,
              onShow: () {},
              context: context,
            ),
            verticalSpacer(20),
            customText(
              text: "Phone Number",
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
              keyboardType: TextInputType.phone,
              hintText: "Enter Phone Number",
              borderRadius: 12,
              obscureText: false,
              isShow: false,
              onShow: () {},
              context: context,
            ),
            verticalSpacer(20),
            customText(
              text: "Date of Birth",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black,
            ),
            verticalSpacer(8),
            customTextFieldSuffixIcon(
              controller: dobController,
              readOnly: false,
              height: 48,
              width: 390,
              icon: AppImages.calenderSvg,
              isMinLine: 1,
              keyboardType: TextInputType.phone,
              hintText: "12/02/2025",
              borderRadius: 0,
              obscureText: false,
              onShow: () {
                selectDateBottomSheet(context, dobController);
              },
              context: context,
            ),
            verticalSpacer(20),
            customText(
              text: "Gender",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black,
            ),
            verticalSpacer(8),
            customDropdownField(
              context: context,
              hintText: "Select",
              width: 390,
              fillColor: AppColors.white,
              borderRadius: 0,
              iconPath: AppImages.dropdownArrow,
              icon: AppImages.dropdownArrow,
              items: ["Select", "Male", "Female"],
              value:
                  (selectedGender.isEmpty || selectedGender == "Select")
                      ? "Select"
                      : selectedGender,
              onChanged: (val) {
                if (val != null) {
                  onGenderChanged(val);
                }
              },
            ),
          ],
        ),
      ],
    ),
  );
}

Widget setPassword({
  required BuildContext context,
  required bool showPassword,
  required bool showConfirmPassword,
  required TextEditingController confirmPasswordTextController,
  required TextEditingController passwordTextController,
  required TextEditingController phoneController,
  required TextEditingController dobController,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 18.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacer(40),
        customText(
          text: "Set Your Password ✨ 🔐",
          fontWeight: FontWeight.w700,
          fontSize: 32,
          color: AppColors.blackShade,
        ),
        verticalSpacer(20),
        customText(
          text: "Create a new password",
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black,
        ),
        verticalSpacer(4),
        customTextFieldNoMultiLine(
          controller: passwordTextController,
          height: 48,
          width: 390,
          keyboardType: TextInputType.text,
          hintText: "Password",
          hintFontSize: 16,
          borderRadius: 12,
          obscureText: showPassword,
          isShow: true,
          onShow: () {
            context.read<SignupViewModel>().showHidePasswordVisibility();
          },
          context: context,
        ),
        verticalSpacer(20),
        customText(
          text: "Confirm a new password",
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black,
        ),
        verticalSpacer(4),
        customTextFieldNoMultiLine(
          controller: confirmPasswordTextController,
          height: 48,
          width: 390,
          keyboardType: TextInputType.text,
          hintText: "Confirm Password",
          hintFontSize: 16,
          borderRadius: 12,
          obscureText: showConfirmPassword,
          isShow: true,
          onShow: () {
            context.read<SignupViewModel>().showHideConfirmPasswordVisibility();
          },
          context: context,
        ),
      ],
    ),
  );
}

Widget aboutNursery({
  required BuildContext context,
  required TextEditingController nameController,
  required TextEditingController emailController,
  required TextEditingController addressController,
  required String selectedCity,
  required String selectedCountry,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 18.w),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacer(40),
          customText(
            text: "About Your Nursery 🏫",
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: AppColors.blackShade,
          ),
          verticalSpacer(20),
          Consumer<AuthViewModel>(
            builder: (context, auth, child) {
              return GestureDetector(
                onTap: auth.pickNurseryLogo,
                child: Container(
                  height: 230.h,
                  width: 382.w,
                  decoration: BoxDecoration(
                    color: AppColors.blueShade.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.blueShade),
                  ),
                  child:
                      auth.nurseryLogo == null
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.imagePlaceholder),
                              verticalSpacer(8),
                              customText(
                                text: "Nursery Logo (Optional)",
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: AppColors.blueShade,
                              ),
                            ],
                          )
                          : ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.file(
                              auth.nurseryLogo!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                ),
              );
            },
          ),
          verticalSpacer(20),
          customText(
            text: "Nursery Name *",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
          verticalSpacer(4),
          customTextField(
            controller: nameController,
            height: 48,
            width: 390,
            isMinLine: 1,
            keyboardType: TextInputType.text,
            hintText: "Enter your nursery name",
            borderRadius: 12,
            obscureText: false,
            isShow: false,
            onShow: () {},
            context: context,
          ),
          verticalSpacer(20),
          customText(
            text: "Address *",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
          verticalSpacer(4),
          customTextField(
            controller: addressController,
            height: 48,
            width: 390,
            isMinLine: 1,
            keyboardType: TextInputType.text,
            hintText: "Enter your nursery address",
            borderRadius: 12,
            obscureText: false,
            isShow: false,
            onShow: () {},
            context: context,
          ),
          verticalSpacer(20),
          customText(
            text: "City *",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
          verticalSpacer(4),
          customDropdownField(
            context: context,
            hintText: "",
            iconPath: AppImages.dropdownArrow,
            width: 390,
            borderRadius: 0,
            fillColor: AppColors.white,
            icon: AppImages.dropdownArrow,
            items: ["Isl", "Karachi", "Lahore"],
            value: selectedCity.isEmpty ? null : selectedCity,
            onChanged: (val) {
              selectedCity = val ?? "";
            },
          ),
          verticalSpacer(20),
          customText(
            text: "Country *",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
          verticalSpacer(4),
          customDropdownField(
            context: context,
            hintText: "",
            width: 390,
            borderRadius: 0,
            fillColor: AppColors.white,
            iconPath: AppImages.dropdownArrow,
            icon: AppImages.dropdownArrow,
            items: ["USA", "Pakistan", "Lahore"],
            value: selectedCountry.isEmpty ? null : selectedCountry,
            onChanged: (val) {
              selectedCountry = val ?? "";
            },
          ),
          verticalSpacer(20),
          customText(
            text: "Nursery Phone Number (optional)",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
          verticalSpacer(4),
          customTextField(
            controller: addressController,
            height: 48,
            width: 390,
            isMinLine: 1,
            hintFontSize: 16,
            keyboardType: TextInputType.text,
            hintText: "Enter your nursery phone number",
            borderRadius: 12,
            obscureText: false,
            isShow: false,
            onShow: () {},
            context: context,
          ),
          verticalSpacer(20),
          customText(
            text: "Nursery Email (optional)",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
          verticalSpacer(4),
          customTextField(
            controller: emailController,
            height: 48,
            width: 390,
            isMinLine: 1,
            hintFontSize: 16,
            keyboardType: TextInputType.text,
            hintText: "Enter your nursery email",
            borderRadius: 12,
            obscureText: false,
            isShow: false,
            onShow: () {},
            context: context,
          ),
          verticalSpacer(20),
          customText(
            text: "Nursery Features",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
          verticalSpacer(8),
          Consumer<AuthViewModel>(
            builder: (context, auth, child) {
              return Container(
                width: 390.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.r),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.forestGrey),
                ),
                child: Wrap(
                  spacing: 4.w,
                  runSpacing: 0.w,
                  children: addChoiceChips(context, auth.nurseryFeatures),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

List<Widget> addChoiceChips(BuildContext context, List<String> list) {
  final provider = context.watch<AuthViewModel>();

  return list.map((category) {
    final isSelected = provider.selectedCategories.contains(category);

    return ChoiceChip(
      label: customText(
        text: category,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: isSelected ? Colors.white : AppColors.purple,
      ),
      selected: isSelected,
      showCheckmark: false,
      onSelected: (selected) => provider.onToggleChip(category, selected),
      selectedColor: AppColors.purple,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.purple),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
    );
  }).toList();
}

Widget otpView(BuildContext context, {required String otpControllers}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 18.w),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacer(20),
          Center(
            child: customText(
              text: "You’ve got a text! 📲",
              fontWeight: FontWeight.w700,
              fontSize: 32,
              color: AppColors.blackShade,
            ),
          ),
          verticalSpacer(20),
          customText(
            text:
                "We have sent the OTP verification code to your phone number. Check your phone and enter the code below.",
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.black,
          ),
          verticalSpacer(20),

          Consumer<SignupViewModel>(
            builder: (context, vm, child) {
              return OtpTextField(
                cursorColor: AppColors.purple,
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fieldWidth: 47.w,
                fieldHeight: 70.h,
                contentPadding: EdgeInsets.zero,
                obscureText: false,
                fillColor: AppColors.purple.withValues(alpha: 0.02),
                focusedBorderColor: AppColors.purple,
                showFieldAsBox: true,
                borderWidth: 1.w,
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                filled: true,
                textStyle: TextStyle(
                  color: AppColors.blackShade.withValues(alpha: 0.9),
                ),
                keyboardType: TextInputType.number,
                onCodeChanged: (value) {
                  //  vm.updateOtp(value);
                },
                onSubmit: (otp) {
                  vm.updateOtp(otp);
                },
              );
            },
          ),
          verticalSpacer(8),
          Center(
            child: customText(
              text: "Didn't receive a text?",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          verticalSpacer(8),
          Center(
            child: customText(
              text: "You can resend code in 55 s",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          verticalSpacer(20),
        ],
      ),
    ),
  );
}

Widget accountCard(
  String title,
  Color color,
  String icon, {
  required VoidCallback nextStep,
}) {
  return GestureDetector(
    onTap: nextStep,
    child: Container(
      height: 92.h,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.forestGrey),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            height: 92.h,
            width: 92.w,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                topLeft: Radius.circular(16.r),
              ),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundColor: AppColors.blackShade.withValues(alpha: 0.1),
                radius: 30.r,
                child: SvgPicture.asset(icon),
              ),
            ),
          ),
          horizontalSpacer(12),
          customText(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black,
          ),
        ],
      ),
    ),
  );
}
