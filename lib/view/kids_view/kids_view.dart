import 'package:quizzo/export.dart';

class KidsView extends StatefulWidget {
  const KidsView({super.key});

  @override
  State<KidsView> createState() => _KidsViewState();
}

class _KidsViewState extends State<KidsView> {
  String? selectedGender;
  String? selectedClass;

  TextEditingController searchController = TextEditingController();

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
      appBar: customAppBar(title: "Kids"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTextFieldPrefixIcon(
                controller: searchController,
                readOnly: false,
                hintClr: AppColors.grey.withValues(alpha: 0.3),
                borderClr: Colors.transparent,
                height: 56,
                width: 432,
                hintFontSize: 16,
                icon: AppImages.search,
                isMinLine: 1,
                keyboardType: TextInputType.phone,
                hintText: "Search",
                fillColor: AppColors.bg,
                borderRadius: 16,
                obscureText: false,
                onShow: () {},
                context: context,
              ),

              verticalSpacer(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customDropdownField(
                    borderColor: Colors.transparent,
                    context: context,
                    hintText: "",
                    width: 195,
                    hintFontSize: 14,
                    borderRadius: 16,
                    iconPath: AppImages.dropArrow,
                    icon: AppImages.dropArrow,
                    items: ["Male", "Female"],
                    value: selectedGender,
                    onChanged: (val) {
                      selectedGender = val ?? "";
                    },
                  ),
                  verticalSpacer(12),
                  customDropdownField(
                    borderColor: Colors.transparent,
                    context: context,
                    hintText: "",
                    width: 195,
                    borderRadius: 16,
                    hintFontSize: 14,
                    iconPath: AppImages.dropArrow,
                    icon: AppImages.dropArrow,
                    items: ["Senior Classes", "Junior Class", "All Classes"],
                    value: selectedClass,
                    onChanged: (val) {
                      selectedClass = val ?? "";
                    },
                  ),
                ],
              ),
              verticalSpacer(12),
              customDivider(
                height: 1.5,
                width: 432,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      customText(
                        text: "  Kids",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.blackShade,
                      ),

                      horizontalSpacer(4),
                      customText(
                        text: "(3)",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.freshBlue,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.addKids);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),

                        color: AppColors.purple,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppImages.addUser),
                          customText(
                            text: " Add User ",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              kidsCard(context, "Tyra Shelburne", "Senior Class"),
              kidsCard(context, "Clinton Mcclure", "Junior Class"),
              kidsCard(context, "Daryl Kulikowski", "Senior Class"),
              verticalSpacer(20),
            ],
          ),
        ),
      ),
    );
  }
}
