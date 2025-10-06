import 'package:quizzo/export.dart';

class SettingInfoView extends StatefulWidget {
  const SettingInfoView({super.key});

  @override
  State<SettingInfoView> createState() => _SettingInfoViewState();
}

class _SettingInfoViewState extends State<SettingInfoView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  String? selectedGender;
  @override
  void initState() {
    super.initState();

    // ✅ Set initial data here (maybe from API or DB)
    nameController = TextEditingController(text: "Ashley Moon");
    phoneController = TextEditingController(text: "+1-300-555-0399");
    dobController = TextEditingController(text: "27/12/1995");
    addressController = TextEditingController(
      text: "West Arabella, 2150 Ave. - Next to Sphinx Hotel.",
    );
    selectedGender = "Female"; // Default selected
  }

  @override
  void dispose() {
    // ✅ Always dispose controllers
    nameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.white,
        systemNavigationBarColor: AppColors.white,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: customAppBar(title: 'Personal Info'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.blue,
                  radius: 82.r,
                  child: CircleAvatar(
                    radius: 80.r,
                    child: Image.asset(AppImages.avatarPng),
                  ),
                ),
              ),
              verticalSpacer(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customButtonWithPrefixIcon(
                    context: context,
                    text: "Upload Picture",
                    widget: SvgPicture.asset(
                      AppImages.imagePlaceholder,
                      width: 17.w,
                      height: 17.h,
                      fit: BoxFit.cover,
                    ),
                    fontSize: 16,
                    height: 43,
                    width: 183,
                    borderColor: Colors.transparent,
                    bgColor: AppColors.freshBlue.withValues(alpha: 0.09),
                    fontColor: AppColors.purple,
                    overlayColor: AppColors.white.withValues(alpha: 0.5),
                    borderRadius: 100,
                    isCircular: true,
                    fontWeight: FontWeight.w500,
                  ),
                  customButtonWithPrefixIcon(
                    context: context,
                    text: "Change Avatar",
                    widget: Icon(
                      Icons.favorite,
                      color: AppColors.purple,
                      size: 18,
                    ),
                    fontSize: 16,
                    height: 43,
                    width: 183,
                    borderColor: Colors.transparent,
                    bgColor: AppColors.freshBlue.withValues(alpha: 0.09),
                    fontColor: AppColors.purple,
                    overlayColor: AppColors.white.withValues(alpha: 0.5),
                    borderRadius: 100,
                    isCircular: true,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              verticalSpacer(20),
              customDivider(
                height: 1,
                width: 390,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(20),
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
                hintText: "Ashley Moon",
                borderRadius: 12,
                obscureText: false,
                isShow: false,
                onShow: () {},
                context: context,
              ),
              verticalSpacer(20),
              customText(
                text: "Phone Number *",
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
                hintText: "+1-300-555-0399",
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
                hintText: "27/12/1995",

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
                hintText: "Male",
                width: 390,
                borderRadius: 0,
                fillColor: AppColors.white,
                icon: AppImages.dropdownArrow,
                iconPath: AppImages.dropdownArrow,
                items: ["Male", "Female"],
                value: selectedGender,
                onChanged: (val) {
                  selectedGender = val ?? "";
                },
              ),
              verticalSpacer(20),
              customText(
                text: "Address",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
              verticalSpacer(8),
              customTextField(
                controller: addressController,
                height: 48,
                width: 390,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.text,
                hintText: "West Arabella, 2150 Ave. - Next to Sphinx Hotel.",
                borderRadius: 12,
                obscureText: false,
                isShow: false,
                onShow: () {},
                context: context,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        child: customButton(
          context: context,
          text: "Save Settings",
          fontSize: 16,
          height: 58,
          width: 300,
          borderColor: Colors.transparent,
          bgColor: AppColors.blue,
          fontColor: Colors.white,
          borderRadius: 100,
          isCircular: true,
          fontWeight: FontWeight.w600,
          onPressed: () {
            Get.toNamed(AppRoutes.otp);
          },
        ),
      ),
    );
  }
}
