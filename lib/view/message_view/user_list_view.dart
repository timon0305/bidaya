import 'package:quizzo/export.dart';
import 'package:quizzo/view/message_view/message_view.dart';

class ChatUserListView extends StatelessWidget {
   ChatUserListView({super.key});

  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
    child: Padding(
    padding:  EdgeInsets.only(top: 10.h),
        child: AppBar(
          excludeHeaderSemantics: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.white,elevation: 0,
          leadingWidth: 400.w,
          leading: Row(
            children: [
              horizontalSpacer(10),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Icon(
                    Icons.arrow_back
                ),
              ),
              horizontalSpacer(10),
              customText(text: "Messages", fontWeight: FontWeight.w700, fontSize: 24, color: AppColors.blackShade),
              Spacer(),
              SvgPicture.asset(AppImages.profile,color: AppColors.sand,height: 32.h,width: 32.w,fit: BoxFit.fill,),

            ],
          ),
        ),
      )
      ),
      backgroundColor: AppColors.white,
      body:   Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 24.w, vertical: 0.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
              children:[
                customTextFieldPrefixIcon(
                  controller: searchController,
                  readOnly: false,
                  hintClr: AppColors.grey.withOpacity(0.3),
                  borderClr: Colors.transparent,
                  height: 56,
                  width: 380,
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
                verticalSpacer(20),
                userCard(
                  username: "Ash Moon",
                  message: "Lorem ipsum dolor sit amet...",
                  time: "10:00 am",
                  profileImageUrl:AppImages.avatarPng,
                  notificationCount: "01",
                ),
                userCard(
                  username: "Lisa Himen",
                  message: "Lorem ipsum dolor sit amet...",
                  time: "10:00 am",
                  profileImageUrl:AppImages.avatarPng,
                  notificationCount: "03",
                ),
                userCard(
                  username: "Lila Noon",
                  message: "Lorem ipsum dolor sit amet...",
                  time: "10:00 am",
                  profileImageUrl:AppImages.avatarPng,
                  notificationCount: "",
                ),
                userCard(
                  username: "Moony Rao",
                  message: "Lorem ipsum dolor sit amet...",
                  time: "10:00 am",
                  profileImageUrl:
                  AppImages.avatarPng, notificationCount: "",
                ),
                userCard(
                  username: "Hira Nison",
                  message: "Lorem ipsum dolor sit amet...",
                  time: "10:00 am",
                  profileImageUrl:AppImages.avatarPng, notificationCount: "",
                ),
              ]),
        ),
      ),

    );
  }
}

Widget userCard({
  required String username,
  required String message,
  required String time,
  required String profileImageUrl,
  required String notificationCount,
}) {
  return GestureDetector(
    onTap: () {
      Get.to(() => MessageView(userName: username));
    },
    child: Container(
      height: 64.h, // thoda adjust height for better spacing
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 56.h,
            width: 56.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(AppImages.avatarPng),
              ),
            ),
          ),
          horizontalSpacer(8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(
                  text: username,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.blackShade,
                  textFlow: TextOverflow.ellipsis,
                ),
                customText(
                  text: message,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: AppColors.placeholder.withOpacity(0.90),
                  textFlow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),


          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                customText(
                  text: time,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: AppColors.sand.withOpacity(0.90),
                ),
                if (notificationCount.isNotEmpty) ...[
                  verticalSpacer(4.h),
                  Container(
                    height: 22.h,
                    width: 22.w,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: AppColors.purple.withOpacity(0.08),
                     ),
                    child: Center(
                      child: customText(
                        text: notificationCount,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

