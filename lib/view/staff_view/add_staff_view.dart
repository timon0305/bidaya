import 'package:quizzo/export.dart';

class AddStaffView extends StatefulWidget {
  final bool isEdit;
  final String phone;

  const AddStaffView({super.key, this.isEdit = false, required this.phone});

  @override
  State<AddStaffView> createState() => _AddStaffViewState();
}

class _AddStaffViewState extends State<AddStaffView>
    with SingleTickerProviderStateMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  String? selectedGender;
  TextEditingController educationController = TextEditingController();
  TextEditingController homePhoneController = TextEditingController();
  String? selectedClass;
  TextEditingController homeAddressController = TextEditingController();
  TextEditingController addInfoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      nameController.text = "Michael Johnson";
      phoneController.text = "+1 202-555-0136";
      dobController.text = "1988-04-15";
      selectedGender = "Male";

      educationController.text = "Bachelor of Arts in History";
      homePhoneController.text = "+1 305-555-0199";
      homeAddressController.text =
          "742 Evergreen Terrace, Springfield, IL 62704, USA";
      addInfoController.text =
          "Part-time coach, enjoys community volunteering.";

      selectedClass = "Junior";
      phoneController.text = widget.phone;
    }
    phoneController.text = widget.phone;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
      ),
    );

    return Scaffold(
      appBar: customAppBar(title: widget.isEdit ? "Edit Staff" : "Add Staff"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child:
            widget.isEdit
                ? SingleChildScrollView(
                  child: Column(
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
                      customDivider(
                        height: 1,
                        width: 390,
                        color: AppColors.lightestGreyShade,
                      ),
                      verticalSpacer(20),
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
                            bgColor: AppColors.freshBlue.withValues(
                              alpha: 0.09,
                            ),
                            fontColor: AppColors.purple,
                            overlayColor: AppColors.white.withValues(
                              alpha: 0.5,
                            ),
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
                            bgColor: AppColors.freshBlue.withValues(
                              alpha: 0.09,
                            ),
                            fontColor: AppColors.purple,
                            overlayColor: AppColors.white.withValues(
                              alpha: 0.5,
                            ),
                            borderRadius: 100,
                            isCircular: true,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      verticalSpacer(8),
                      staffInfoCard(
                        isEdit: true,
                        context: context,
                        nameController: nameController,
                        phoneController: phoneController,
                        selectedGender: selectedGender ?? "",
                        dobController: dobController,
                        homePhoneController: homePhoneController,
                        addInfoController: addInfoController,
                        educationController: educationController,
                        homeAddressController: homePhoneController,
                        selectedClass: selectedClass ?? "",
                      ),
                    ],
                  ),
                )
                : staffInfoCard(
                  isEdit: false,
                  context: context,
                  nameController: nameController,
                  phoneController: phoneController,
                  selectedGender: selectedGender ?? "",
                  dobController: dobController,
                  homePhoneController: homePhoneController,
                  addInfoController: addInfoController,
                  educationController: educationController,
                  homeAddressController: homePhoneController,
                  selectedClass: selectedClass ?? "",
                ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: customButton(
          context: context,
          text: widget.isEdit ? "Save Change" : "Save",
          fontSize: 16,
          height: 58,
          width: 390,
          borderColor: Colors.transparent,
          bgColor: AppColors.blue,
          fontColor: Colors.white,
          borderRadius: 100,
          isCircular: true,
          fontWeight: FontWeight.w600,
          onPressed: () {},
        ),
      ),
    );
  }
}
