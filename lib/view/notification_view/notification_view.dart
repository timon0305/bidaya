import 'package:quizzo/export.dart';
class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}
class _NotificationViewState extends State<NotificationView> {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Welcome",
      "body": "Your Exotic Veggie Platter is on the menu. Get excited!sada",
      "isRead": true,
      "createdAt": "Today",
    },
    {
      "title": "Tomorrow's Treats!",
      "body": "Last chance to add a little extra to your Tuesday delivery. Lorem Impsum, Siant, Madelno Batngana Fotana",
      "isRead": true,
      "createdAt": "6 days ago",

    },
    {
      "title": "Payment Due",
      "body": "Please May the required amount for Ellie. 590EGP Before due date.",
      "isRead": false,
      "createdAt": "13 days ago",

    },  {
      "title": "Weekend Bonus!",
      "body": "Get 10% off on a surprise side for your next order. Yum!",
      "isRead": false,
      "createdAt": "13 days ago",

    },
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));
    return Scaffold(
      appBar: customAppBar(title: "Notifications"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final item = notifications[index];
            final bgColor =item["isRead"]? AppColors.purple.withValues(alpha: 0.08):AppColors.forestGrey.withValues(alpha: 0.2);
            return notificationCard(
              context,
              item["body"],
              item["title"],
              bgColor,
              item["createdAt"],
            );
          },
        ),
      ),
    );
  }

  Widget notificationCard(
      BuildContext context,
      String text,
      String title,
      Color bg,
      String dateTime,
      ) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 24.w ),
      decoration: BoxDecoration(
        color: bg,
      ),
      child: GestureDetector(
        onTap: () {

        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: title.split(' ').last.capitalizeFirst ?? "",
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppColors.blackShade,
                ),
                 customText(
                    text: dateTime,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.sand,
                  ),

              ],

            ),
            SizedBox(
              width: 300.w,
              child: customText(
                text: text,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: AppColors.placeholder,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
