import 'package:quizzo/export.dart';
import 'package:quizzo/view/staff_view/widgets/add_staff_view.dart';
import 'package:quizzo/view/staff_view/widgets/staff_card.dart';

class StaffView extends StatefulWidget {
  const StaffView({super.key});

  @override
  State<StaffView> createState() => _StaffViewState();
}

class _StaffViewState extends State<StaffView> {
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
      appBar: customAppBar(title: "Staff"),
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
                width: 382,
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
              SizedBox(
                width: 382.w,
                child: customDropdownField(
                  borderColor: Colors.transparent,
                  context: context,
                  hintText: "",
                  width: double.infinity,
                  borderRadius: 16,
                  contentPadding: 14,

                  iconPath: AppImages.dropArrow,
                  icon: AppImages.dropArrow,
                  items: ["Senior Classes", "Junior Class", "All Classes"],
                  value: selectedClass,
                  onChanged: (val) {
                    selectedClass = val ?? "";
                  },
                ),
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
                        text: "  Staff",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.blackShade,
                      ),

                      horizontalSpacer(4),
                      customText(
                        text: "(3)",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.purple,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      addStaffPopup(context);
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
                            text: "Add Staff ",
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
              staffCard(context, "Tyra Shelburne", "Senior Class - Admin"),
              staffCard(context, "Clinton Mcclure", "Junior Class"),
              staffCard(context, "Daryl Kulikowski", "Junior - Staff"),
              verticalSpacer(20),
            ],
          ),
        ),
      ),
    );
  }
}
