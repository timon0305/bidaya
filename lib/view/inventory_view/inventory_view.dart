import 'package:quizzo/export.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({super.key});

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<String> tabList = ["Items", "Categories"];
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
      appBar: customAppBar(title: "Inventory"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          children: [
            customTabBar(_tabController!, tabList),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacer(10),
                      Row(
                        children: [
                          customText(
                            text: "Items",
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

                      verticalSpacer(10),
                      inventoryItemCard("LEGO", "Toys - Number 20"),
                      inventoryItemCard("Night Stories", "Books - Number 30"),
                      inventoryItemCard("How to Paint 101", "Books - Number 5"),
                      verticalSpacer(20),
                      customAddButton(
                        title: "Add Item",
                        onTap: () {},
                        color: AppColors.purple,
                      ),
                    ],
                  ),

                  // Categories Tab
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.verticalSpace,
                      Row(
                        children: [
                          customText(
                            text: "Categories",
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
                      10.verticalSpace,
                      inventoryCategoryCard("Books"),
                      inventoryCategoryCard("Toys"),
                      20.verticalSpace,
                      customAddButton(
                        title: "Add Categories",
                        onTap: () {},
                        color: AppColors.purple,
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
