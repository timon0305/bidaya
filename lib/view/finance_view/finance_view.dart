import 'package:quizzo/export.dart';
import 'package:quizzo/view/inventory_view/widgets/custom_invoice_shape.dart';

class FinanceSlipView extends StatefulWidget {
  const FinanceSlipView({super.key});

  @override
  State<FinanceSlipView> createState() => _FinanceSlipViewState();
}

class _FinanceSlipViewState extends State<FinanceSlipView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String? selectedClass;
  TextEditingController searchController = TextEditingController();

  List<String> attendanceUserList = ["Parent", "Salaries", "Expenses"];
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
      appBar: AppBar(
        excludeHeaderSemantics: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,
        elevation: 0,
        leadingWidth: 400.w,
        leading: Row(
          children: [
            horizontalSpacer(10),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back),
            ),
            horizontalSpacer(10),
            customText(
              text: "Finance",
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColors.blackShade,
            ),
            Spacer(),
            SvgPicture.asset(AppImages.filter),
            horizontalSpacer(4),
            GestureDetector(
              onTap: () {
                Get.to(() => PaymentSettingView());
              },
              child: SvgPicture.asset(AppImages.setting),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
      body: DefaultTabController(
        length: 3,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 186 / 70,
                children: [
                  statusCard(
                    icon: AppImages.expProfit,
                    title: "Income",
                    amount: "17,509 EGP",
                    color: Colors.deepPurple,
                  ),

                  statusCard(
                    icon: AppImages.expDown,
                    title: "Expenses",
                    amount: "-1,660 EGP",
                    color: Colors.deepPurple,
                  ),

                  statusCard(
                    icon: AppImages.expWallet,
                    title: "Net Balance",
                    amount: "17,500 EGP",
                    color: Colors.deepPurple,
                  ),

                  statusCard(
                    icon: AppImages.expPending,
                    title: "Pending Invoices",
                    amount: "12,345 EGP",
                    color: Colors.deepPurple,
                  ),
                ],
              ),
              verticalSpacer(20),
              customDivider(
                height: 1.5,
                width: 432,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(20),
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customTextFieldPrefixIcon(
                                  controller: searchController,
                                  readOnly: false,
                                  hintClr: AppColors.grey.withValues(
                                    alpha: 0.3,
                                  ),
                                  borderClr: Colors.transparent,
                                  width: 186,
                                  hintFontSize: 18,
                                  icon: AppImages.search,
                                  isMinLine: 1,
                                  keyboardType: TextInputType.text,
                                  hintText: "Search...",
                                  fillColor: AppColors.bg,
                                  borderRadius: 16,
                                  obscureText: false,
                                  onShow: () {},
                                  context: context,
                                ),
                                verticalSpacer(12),
                                customDropdownField(
                                  borderColor: Colors.transparent,
                                  context: context,
                                  hintText: "",
                                  height: 48,
                                  width: 186,
                                  borderRadius: 16,
                                  hintFontSize: 14,
                                  iconPath: AppImages.dropArrow,
                                  icon: AppImages.dropArrow,
                                  items: [
                                    "Senior Classes",
                                    "Junior Class",
                                    "All Classes",
                                  ],
                                  value: selectedClass,
                                  onChanged: (val) {
                                    selectedClass = val ?? "";
                                  },
                                ),
                              ],
                            ),
                          ),
                          verticalSpacer(12),
                          CustomPaint(
                            painter: InvoiceSlipPainter(
                              borderColor: AppColors.purple,
                              backgroundColor: Colors.white,
                              hasShadow: true,
                              isHeader: false,
                            ),
                            child: Container(
                              width: double.infinity,

                              margin: EdgeInsets.symmetric(vertical: 8.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 24.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  horizontalSpacer(50),
                                  customText(
                                    text: "Add Parent Invoice",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: AppColors.purple,
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 32.h,
                                    width: 32.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: AppColors.purple,
                                        width: 1.w,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: AppColors.purple,
                                      ),
                                    ),
                                  ),
                                  horizontalSpacer(20),
                                ],
                              ),
                            ),
                          ),
                          verticalSpacer(12),
                          parentInvoiceCardSlip(
                            context: context,
                            name: 'Clinton Mcclure Martin',
                            status: 'Pending',
                            statusColor: Colors.grey.shade600,
                            dueDate: '19/8/2025',
                            amount: '12,600 EGP',
                            amountColor: Colors.orange.shade600,
                          ),
                          verticalSpacer(12),
                          parentInvoiceCardSlip(
                            context: context,
                            name: 'Clinton Mcclure Martin',
                            status: 'Pending',
                            statusColor: Colors.grey.shade600,
                            dueDate: '19/8/2025',
                            amount: '12,600 EGP',
                            amountColor: AppColors.redShade,
                          ),
                          verticalSpacer(12),
                          parentInvoiceCardSlip(
                            context: context,
                            name: 'Ashleigh Reight Culture',
                            status: 'Awaiting Confirmation',
                            statusColor: Colors.grey.shade600,
                            dueDate: '19/8/2025',
                            amount: '3,200 EGP',
                            amountColor: AppColors.green,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          customTextFieldPrefixIcon(
                            controller: searchController,
                            readOnly: false,
                            hintClr: AppColors.grey.withOpacity(0.3),
                            borderClr: Colors.transparent,
                            height: 58,
                            width: double.infinity,
                            hintFontSize: 16,
                            icon: AppImages.search,
                            isMinLine: 1,
                            keyboardType: TextInputType.phone,
                            hintText: "Search...",
                            fillColor: AppColors.bg,
                            borderRadius: 16,
                            obscureText: false,
                            onShow: () {},
                            context: context,
                          ),
                          verticalSpacer(20),
                          CustomPaint(
                            painter: InvoiceSlipPainter(
                              borderColor: AppColors.purple,
                              backgroundColor: Colors.white,
                              hasShadow: false,
                              isHeader: false,
                            ),
                            child: Container(
                              width: double.infinity,

                              margin: EdgeInsets.symmetric(vertical: 8.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 24.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  horizontalSpacer(50),
                                  customText(
                                    text: "Add Staff Invoice",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: AppColors.purple,
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 32.h,
                                    width: 32.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: AppColors.purple,
                                        width: 1.w,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: AppColors.purple,
                                      ),
                                    ),
                                  ),
                                  horizontalSpacer(20),
                                ],
                              ),
                            ),
                          ),
                          verticalSpacer(12),
                          salariesSlip(
                            context: context,
                            name: 'Clinton Mcclure Martin',
                            status: 'Pending',
                            statusColor: Colors.grey.shade600,
                            dueDate: '19/8/2025',
                            amount: '12,600 EGP',
                            amountColor: Colors.orange.shade600,
                          ),
                          verticalSpacer(12),
                          salariesSlip(
                            context: context,
                            name: 'Clinton Mcclure Martin',
                            status: 'Pending',
                            statusColor: Colors.grey.shade600,
                            dueDate: '19/8/2025',
                            amount: '12,600 EGP',
                            amountColor: Colors.orange.shade600,
                          ),
                          verticalSpacer(12),

                          salariesSlip(
                            context: context,
                            name: 'Ashleigh Reight Culture',
                            status: 'Awaiting Confirmation',
                            statusColor: Colors.grey.shade600,
                            dueDate: '19/8/2025',
                            amount: '3,200 EGP',
                            amountColor: Colors.orange.shade600,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          customTextFieldPrefixIcon(
                            controller: searchController,
                            readOnly: false,
                            hintClr: AppColors.grey.withValues(alpha: 0.3),
                            borderClr: Colors.transparent,
                            height: 58,
                            width: double.infinity,
                            hintFontSize: 16,
                            icon: AppImages.search,
                            isMinLine: 1,
                            keyboardType: TextInputType.phone,
                            hintText: "Search...",
                            fillColor: AppColors.bg,
                            borderRadius: 16,
                            obscureText: false,
                            onShow: () {},
                            context: context,
                          ),
                          verticalSpacer(20),
                          CustomPaint(
                            painter: InvoiceSlipPainter(
                              borderColor: AppColors.purple,
                              backgroundColor: Colors.white,
                              hasShadow: false,
                              isHeader: false,
                            ),
                            child: Container(
                              width: double.infinity,

                              margin: EdgeInsets.symmetric(vertical: 8.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 24.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  horizontalSpacer(50),
                                  customText(
                                    text: "Add Expense Invoice",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: AppColors.purple,
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 32.h,
                                    width: 32.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: AppColors.purple,
                                        width: 1.w,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: AppColors.purple,
                                      ),
                                    ),
                                  ),
                                  horizontalSpacer(20),
                                ],
                              ),
                            ),
                          ),
                          verticalSpacer(12),
                          salariesSlip(
                            context: context,
                            name: 'Clinton Mcclure Martin',
                            status: 'Pending',
                            statusColor: Colors.grey.shade600,
                            dueDate: '19/8/2025',
                            amount: '12,600 EGP',
                            amountColor: Colors.orange.shade600,
                          ),
                          verticalSpacer(12),
                          salariesSlip(
                            context: context,
                            name: 'Clinton Mcclure Martin',
                            status: 'Pending',
                            statusColor: Colors.grey.shade600,
                            dueDate: '19/8/2025',
                            amount: '12,600 EGP',
                            amountColor: Colors.orange.shade600,
                          ),
                          verticalSpacer(12),

                          salariesSlip(
                            context: context,
                            name: 'Ashleigh Reight Culture',
                            status: 'Awaiting Confirmation',
                            statusColor: Colors.grey.shade600,
                            dueDate: '19/8/2025',
                            amount: '3,200 EGP',
                            amountColor: Colors.orange.shade600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
