import 'package:quizzo/export.dart';

class BillingView extends StatefulWidget {
  const BillingView({super.key});

  @override
  State<BillingView> createState() => _BillingViewState();
}

class _BillingViewState extends State<BillingView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<String> tabList = ["Pending", "Past"];

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
      appBar: customAppBar(title: "Billing"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          children: [
            customTabBar(_tabController!, tabList),
            verticalSpacer(12),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          pendingBillingInvoice(context);
                        },
                        child: parentInvoiceCardSlip(
                          context: context,
                          name: 'Clinton Mcclure Martin',
                          status: 'Pending',
                          statusColor: Colors.grey.shade600,
                          dueDate: '19/8/2025',
                          amount: '12,600 EGP',
                          amountColor: Colors.orange.shade600,
                        ),
                      ),
                      verticalSpacer(12),
                      GestureDetector(
                        onTap: () {
                          pendingBillingInvoice(context);
                        },
                        child: billingTabInvoiceCardSlip(
                          name: 'Clinton Mcclure Martin',
                          status: 'Pending',
                          statusColor: Colors.grey.shade600,
                          dueDate: '19/8/2025',
                          amount: '12,600 EGP',
                          amountColor: Colors.orange.shade600,
                        ),
                      ),
                      verticalSpacer(12),
                      GestureDetector(
                        onTap: () {
                          pendingBillingInvoice(context);
                        },
                        child: billingTabInvoiceCardSlip(
                          name: 'Ashleigh Reight Culture',
                          status: 'Awaiting Confirmation',
                          statusColor: Colors.grey.shade600,
                          dueDate: '19/8/2025',
                          amount: '3,200 EGP',
                          amountColor: AppColors.redShade,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          pendingBillingPaid(context);
                        },
                        child: billingTabInvoiceCardSlip(
                          name: 'Clinton Mcclure Martin',
                          status: 'Paid',
                          statusColor: Colors.grey.shade600,
                          dueDate: '19/8/2025',
                          amount: '12,600 EGP',
                          amountColor: AppColors.green,
                        ),
                      ),
                      verticalSpacer(12),
                      GestureDetector(
                        onTap: () {
                          pendingBillingPaid(context);
                        },
                        child: billingTabInvoiceCardSlip(
                          name: 'Clinton Mcclure Martin',
                          status: 'Pending',
                          statusColor: Colors.grey.shade600,
                          dueDate: '19/8/2025',
                          amount: '12,600 EGP',
                          amountColor: AppColors.green,
                        ),
                      ),
                      verticalSpacer(12),
                      GestureDetector(
                        onTap: () {
                          pendingBillingPaid(context);
                        },
                        child: billingTabInvoiceCardSlip(
                          name: 'Ashleigh Reight Culture',
                          status: 'Awaiting Confirmation',
                          statusColor: Colors.grey.shade600,
                          dueDate: '19/8/2025',
                          amount: '3,200 EGP',
                          amountColor: AppColors.green,
                        ),
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
