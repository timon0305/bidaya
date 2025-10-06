import 'package:quizzo/export.dart';

class SettingSendNotification extends StatefulWidget {
  const SettingSendNotification({super.key});

  @override
  State<SettingSendNotification> createState() =>
      _SettingSendNotificationState();
}

class _SettingSendNotificationState extends State<SettingSendNotification> {
  late TextEditingController titleController;
  late TextEditingController messageController;
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: "Lorem ipsum dolor sit amet");
    messageController = TextEditingController(
      text:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip",
    );
    selectedGender = "Recipient";
  }

  @override
  void dispose() {
    titleController.dispose();
    messageController.dispose();
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
      appBar: customAppBar(title: 'Send Notification'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(8),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Container(
                  height: 100.h,
                  width: 382.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      AppImages.notificationBanner,
                      height: 100.h,
                      width: 382.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              customDivider(
                height: 1,
                width: 390,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(20),
              customText(
                text: "Recipients",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
              verticalSpacer(8),
              customDropdownField(
                context: context,
                hintText: "Select recipient",
                width: 390,
                borderRadius: 0,
                fillColor: AppColors.white,
                icon: AppImages.dropdownArrow,
                iconPath: AppImages.dropdownArrow,
                items: ["Recipient", "All", "Kids"],
                value: selectedGender,
                onChanged: (val) {
                  setState(() {
                    selectedGender = val;
                  });
                },
              ),
              verticalSpacer(20),
              customText(
                text: "Title",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
              verticalSpacer(8),
              customTextField(
                hintText: "",
                controller: titleController,
                height: 48,
                width: 390,
                onShow: () {},
                isMinLine: 1,
                keyboardType: TextInputType.text,
                borderRadius: 12,
                obscureText: false,
                isShow: false,
                context: context,
              ),
              verticalSpacer(20),
              customText(
                text: "Message",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
              verticalSpacer(8),
              SizedBox(
                width: 430.w,
                child: customTextField(
                  controller: messageController,
                  width: 430,
                  onShow: () {},
                  hintText: "",
                  isMinLine: 1,
                  maxLines: 6,
                  hintFontSize: 16,
                  keyboardType: TextInputType.multiline,
                  borderRadius: 12,
                  obscureText: false,
                  isShow: false,
                  context: context,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
        child: customButton(
          context: context,
          text: "Send Notification",
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
