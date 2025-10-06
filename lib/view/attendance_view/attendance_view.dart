import 'package:quizzo/export.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({super.key});

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String? selectedGender;

  List<String> attendanceUserList = ["Kids", "Staff"];
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthViewModel>();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.white,
        systemNavigationBarColor: AppColors.white,
      ),
    );
    return Scaffold(
      appBar: customAppBar(title: "Take Attendance"),
      backgroundColor: AppColors.white,
      body:
          auth.userRole == "Staff"
              ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 0.h),
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
                          customTextFieldSuffixIcon(
                            controller: dateController,
                            readOnly: true,
                            height: 55,
                            width: 186,
                            icon: AppImages.calenderSvg,
                            isMinLine: 1,
                            keyboardType: TextInputType.phone,
                            borderClr: Colors.transparent,
                            hintText: "   12/2/2025",
                            fillColor: AppColors.bg,
                            hintFontSize: 16,
                            borderRadius: 12,
                            obscureText: false,
                            onShow: () {
                              selectDateBottomSheet(context, dateController);
                            },
                            context: context,
                          ),
                          customDropdownField(
                            borderColor: Colors.transparent,
                            context: context,
                            hintText: "",
                            height: 55,
                            width: 186,
                            borderRadius: 12,
                            iconPath: AppImages.dropArrow,
                            icon: AppImages.dropArrow,
                            items: [
                              "Senior Classes",
                              "Junior Class",
                              "All Classes",
                            ],
                            value: selectedGender,
                            onChanged: (val) {
                              selectedGender = val ?? "";
                            },
                          ),
                        ],
                      ),
                      verticalSpacer(12),

                      attendanceStatusCard(),
                      verticalSpacer(20),
                      customDivider(
                        height: 1.5,
                        width: 432,
                        color: AppColors.lightestGreyShade,
                      ),
                      verticalSpacer(20),
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
                      attendanceUserCard("Tyra Shelburne", "Senior Class"),
                      attendanceUserCard("Clinton Mcclure", "Junior Class"),
                      attendanceUserCard("Daryl Kulikowski", "Senior Class"),
                      verticalSpacer(20),
                    ],
                  ),
                ),
              )
              : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customTabBar(_tabController!, attendanceUserList),
                    verticalSpacer(20),
                    Expanded(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                customTextFieldPrefixIcon(
                                  controller: searchController,
                                  readOnly: false,
                                  hintClr: AppColors.grey.withValues(
                                    alpha: 0.3,
                                  ),
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
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      customTextFieldSuffixIcon(
                                        controller: dateController,
                                        readOnly: true,
                                        height: 55,
                                        width: 186,
                                        icon: AppImages.calenderSvg,
                                        isMinLine: 1,
                                        keyboardType: TextInputType.phone,
                                        borderClr: Colors.transparent,
                                        hintText: "   12/2/2025",
                                        fillColor: AppColors.bg,
                                        hintFontSize: 16,
                                        borderRadius: 12,
                                        obscureText: false,
                                        onShow: () {
                                          selectDateBottomSheet(
                                            context,
                                            dateController,
                                          );
                                        },
                                        context: context,
                                      ),
                                      customDropdownField(
                                        borderColor: Colors.transparent,
                                        context: context,
                                        hintText: "",
                                        height: 55,
                                        width: 186,
                                        borderRadius: 12,
                                        iconPath: AppImages.dropArrow,
                                        icon: AppImages.dropArrow,
                                        items: [
                                          "Senior Classes",
                                          "Junior Class",
                                          "All Classes",
                                        ],
                                        value: selectedGender,
                                        onChanged: (val) {
                                          selectedGender = val ?? "";
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpacer(12),

                                attendanceStatusCard(),
                                verticalSpacer(20),
                                customDivider(
                                  height: 1.5,
                                  width: 432,
                                  color: AppColors.lightestGreyShade,
                                ),
                                verticalSpacer(20),
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
                                attendanceUserCard(
                                  "Tyra Shelburne",
                                  "Senior Class",
                                ),
                                attendanceUserCard(
                                  "Clinton Mcclure",
                                  "Junior Class",
                                ),
                                attendanceUserCard(
                                  "Daryl Kulikowski",
                                  "Senior Class",
                                ),
                                verticalSpacer(20),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                customTextFieldPrefixIcon(
                                  controller: searchController,
                                  readOnly: false,
                                  hintClr: AppColors.grey.withValues(
                                    alpha: 0.3,
                                  ),
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
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      customTextFieldSuffixIcon(
                                        controller: dateController,
                                        readOnly: true,
                                        height: 55,
                                        width: 186,
                                        icon: AppImages.calenderSvg,
                                        isMinLine: 1,
                                        keyboardType: TextInputType.phone,
                                        borderClr: Colors.transparent,
                                        hintText: "   12/2/2025",
                                        fillColor: AppColors.bg,
                                        hintFontSize: 16,
                                        borderRadius: 12,
                                        obscureText: false,
                                        onShow: () {
                                          selectDateBottomSheet(
                                            context,
                                            dateController,
                                          );
                                        },
                                        context: context,
                                      ),
                                      customDropdownField(
                                        borderColor: Colors.transparent,
                                        context: context,
                                        hintText: "",
                                        height: 55,
                                        width: 186,
                                        borderRadius: 12,
                                        contentPadding: 12,
                                        iconPath: AppImages.dropArrow,
                                        icon: AppImages.dropArrow,
                                        items: [
                                          "Senior Classes",
                                          "Junior Class",
                                          "All Classes",
                                        ],
                                        value: selectedGender,
                                        onChanged: (val) {
                                          selectedGender = val ?? "";
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpacer(12),
                                attendanceStatusCard(),
                                verticalSpacer(20),
                                customDivider(
                                  height: 1.5,
                                  width: 432,
                                  color: AppColors.lightestGreyShade,
                                ),
                                verticalSpacer(20),
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
                                      color: AppColors.freshBlue,
                                    ),
                                  ],
                                ),
                                attendanceUserCard(
                                  "Maggie Franklin",
                                  "Senior Class",
                                ),
                                attendanceUserCard(
                                  "Desa Calic",
                                  "Junior Class",
                                ),
                                attendanceUserCard(
                                  "Ashliegh Khalid",
                                  "All Classes",
                                ),
                                verticalSpacer(20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: SizedBox(
          height: 100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpacer(10),
              customDivider(
                height: 1.5,
                width: 432,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(10),
              customButton(
                context: context,
                text: "Save Attendance",
                fontSize: 16,
                height: 58,
                width: 390,
                borderColor: Colors.transparent,
                bgColor: AppColors.blue,
                fontColor: Colors.white,
                borderRadius: 100,
                isCircular: true,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  Get.toNamed(AppRoutes.setPassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
