import 'package:quizzo/export.dart';

class ReportingView extends StatefulWidget {
  const ReportingView({super.key});

  @override
  State<ReportingView> createState() => _ReportingViewState();
}

class _ReportingViewState extends State<ReportingView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String? selectedGender;
  TextEditingController searchController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<String> reportTabList = ["New Report", "Past Reports"];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
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
      appBar: customAppBar(title: "Reporting"),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpacer(20),
            Center(
              child: customTextFieldPrefixIcon(
                controller: searchController,
                readOnly: false,
                hintClr: AppColors.grey.withValues(alpha: 0.3),
                borderClr: Colors.transparent,
                height: 56,
                width: 382,
                hintFontSize: 16,
                icon: AppImages.search,
                isMinLine: 1,
                keyboardType: TextInputType.text,
                hintText: "Search",
                fillColor: AppColors.bg,
                borderRadius: 16,
                obscureText: false,
                onShow: () {},
                context: context,
              ),
            ),
            verticalSpacer(10),
            Center(
              child: SizedBox(
                width: 382.w,
                child: Row(
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
                      hintText: " 12/2/2025",
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
                      contentPadding: 12,
                      iconPath: AppImages.dropArrow,
                      icon: AppImages.dropArrow,
                      items: ["Senior Classes", "Junior Class", "All Classes"],
                      value: selectedGender,
                      onChanged: (val) {
                        selectedGender = val ?? "";
                      },
                    ),
                  ],
                ),
              ),
            ),
            verticalSpacer(12),
            customTabBar(_tabController!, reportTabList),
            verticalSpacer(20),
            SizedBox(
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      reportingCard(
                        context,
                        "Tyra Shelburne",
                        "Senior Class",
                        true,
                      ),
                      reportingCard(
                        context,
                        "Clinton Mcclure",
                        "Junior Class",
                        true,
                      ),
                      reportingCard(
                        context,
                        "Daryl Kulikowski",
                        "Senior Class",
                        true,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      reportingCard(
                        context,
                        "Maggie Franklin",
                        "Senior Class",
                        false,
                      ),
                      reportingCard(
                        context,
                        "Desa Calic",
                        "Junior Class",
                        false,
                      ),
                      reportingCard(
                        context,
                        "Ashliegh Khalid",
                        "All Classes",
                        false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
