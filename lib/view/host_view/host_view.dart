import 'dart:ui';

import 'package:quizzo/export.dart';
import 'package:quizzo/view/ai_chat_bot_view/ai_chat_view.dart';
import 'package:quizzo/view/dashboard_view/dashboard_widget/quick_action_bottom_sheet.dart';
import 'package:quizzo/view/message_view/user_list_view.dart';
class HostView extends StatefulWidget {
  const HostView({super.key});

  @override
  State<HostView> createState() => _HostViewState();
}

class _HostViewState extends State<HostView> {
  late List<Widget> _pages = [
  ];
  int _selectedIndex = 0;
  void update() {
    setState(() {});
  }

  @override
  void initState() {
    final role=Provider.of<AuthViewModel>(context, listen: false).userRole;
    if(role=="Admin") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        manualPopup(context);
      });
    }
    super.initState();
   _pages = role=="Parent"||role=="parent"? [
      DashboardView(),
      AiChatScreen(),
      ChatUserListView(),
      SettingScreenView(),
    ]:  [
      DashboardView(),
     AiChatScreen(),
     DashboardView(),
     ChatUserListView(),
     SettingScreenView(),
    ];

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness:
       Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _pages.elementAt(_selectedIndex),
    //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(
              color: AppColors.forestGrey,
              width: 1,
            ),
            left: BorderSide(
              color: AppColors.forestGrey,
              width: 1,
            ),
            right: BorderSide(
              color: AppColors.forestGrey,
              width: 1,
            ),
          ),
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent
          ),
          child: ClipRRect(
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.white,
              iconSize: 0,
              useLegacyColorScheme: true,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: AppColors.placeholder,
              selectedItemColor: AppColors.darkGrey,
              showUnselectedLabels: true,
              unselectedFontSize: 12.sp,
              selectedFontSize: 12.sp,
              selectedLabelStyle: TextStyle(
                fontFamily: GoogleFonts.nunito().fontFamily,
                fontSize: 10.sp,
              fontWeight: FontWeight.w700
              ),
              unselectedLabelStyle:  TextStyle(
                  fontFamily: GoogleFonts.nunito().fontFamily,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold
              ),
              showSelectedLabels: true,
              currentIndex: _selectedIndex,
              onTap: (index) {
                final role=Provider.of<AuthViewModel>(context, listen: false).userRole;
                if(role=="Staff"){
                  if(index==2){
                    quickActionStaffBottomSheet(context);
                  }
                }
                else if(role=="Admin"){
                  if(index==2){
                    quickActionAdminBottomSheet(context);
                  }
                }
                _onItemTapped(index);
              },
              items: Provider.of<AuthViewModel>(context, listen: false).userRole=="Parent"?[
                bottomBarItem(context, AppImages.home, "Home"),
                bottomBarItem(context, AppImages.ai, "Ai"),
                bottomBarItem(context, AppImages.chat, "Messages"),
                bottomBarItem(context, AppImages.setting, "Settings"),
              ]:[
                bottomBarItem(context, AppImages.home, "Home"),
                bottomBarItem(context, AppImages.ai, "Ai"),
              BottomNavigationBarItem(

                  icon: SvgPicture.asset(AppImages.add,),
                  label: "",
                ),
                bottomBarItem(context, AppImages.chat, "Messages"),
                bottomBarItem(context, AppImages.setting, "Settings"),
              ],
            ),
          ),
        ),
      )


    );
  }
}


BottomNavigationBarItem bottomBarItem(
    BuildContext context, String svg, String title) {

  return BottomNavigationBarItem(
    icon: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svg,
          colorFilter: const ColorFilter.mode(
              AppColors.placeholder, BlendMode.srcIn),
          width: 24.w,
          height: 24.h,
          fit: BoxFit.scaleDown,
        ),
        verticalSpacer(4),
      ],
    ),
    label: title,
    activeIcon: Column(
      children: [
        SvgPicture.asset(svg,
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(AppColors.darkGrey, BlendMode.srcIn),
            fit: BoxFit.scaleDown),
        verticalSpacer(4),
      ],
    ),
  );
}
/*
Future<void> showAppTour(BuildContext context) async {
  int step = 0;

  List<TourStep> steps = [
    TourStep(
      title: "Welcome to Biday!",
      description: "Your journey management tool. Let's take your first step.",
      image: Icons.school,
      buttonText: "Let's Start",
    ),
    TourStep(
      title: "Great! First step is to create a class.",
      description: "Click on classes to set up your first classroom.",
      image: Icons.class_,
      buttonText: "Continue",
    ),
    TourStep(
      title: "Need help anytime?",
      description: "Look for the help icon to get guidance.",
      image: Icons.help,
      buttonText: "Understood",
    ),
  ];

  await showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.3), // background blur/overlay
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return  AlertDialog(
            content: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(steps[step].image, size: 60),
                    const SizedBox(height: 8),
                    Text(
                      steps[step].title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      steps[step].description,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Skip Tour"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (step < steps.length - 1) {
                              setState(() => step++);
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          child: Text(steps[step].buttonText),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
*/

Future<String?> manualPopup(BuildContext context) async {
  int step = 0;

  List<TourStep> steps = [
    TourStep(
      title: "👋 Welcome to Bidaya!!",
      description: "Your journey management tool. Let's take your first step.",
      image: AppImages.classWelcome,
      buttonText: "Let's Start",
    ),
    TourStep(
      title: "🎉 Great! The first step is to create a class.",
      description: "Click on classes to set up your first classroom.",
      image: AppImages.classGuide,
      buttonText: "Continue",
    ),
    TourStep(
      title: "💡 Need help anytime?",
      description: "Look for the help icon to get guidance.",
      image: AppImages.help,
      buttonText: "Understood",
    ),
  ];

  return showDialog<String>(
    context: context,
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (BuildContext context) {
      return  StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 400.w,
                child:

          steps[step].title=="👋 Welcome to Bidaya!!"? Container(
            margin: EdgeInsets.only(right: 8.w,bottom: 100.h,left: 50.w),
            padding: const EdgeInsets.all(0),
            width:220.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Image.asset(
                  steps[step].image,
                  height: 180.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                verticalSpacer(16),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.w),
                  child: customText(
                    text:steps[step].title,

                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackShade,
                  ),
                ),
                verticalSpacer(8),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w),
                  child: customText(
                    text: steps[step].description,
                    fontWeight: FontWeight.w400,
                    fontSize: 14, color: AppColors.darkGrey,
                  ),
                ),

                verticalSpacer(20),
                customDivider(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.lightestGreyShade,
                ),
                verticalSpacer(12),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      simpleCustomButton(
                        context: context,
                        text: "Skip Tour",
                        fontSize: 14,
                        height: 32,
                        width: 100,
                        borderColor: AppColors.sand,
                        bgColor: AppColors.white,
                        fontColor: AppColors.sand,
                        borderRadius: 100,
                        onPressed: () => Navigator.pop(context),
                        isCircular: true,
                        fontWeight: FontWeight.w500,
                      ),
                      horizontalSpacer(24),
                      simpleCustomButton(
                        context: context,
                        text:   steps[step].buttonText,
                        fontSize: 14,
                        height: 32,
                        width: 100,
                        borderColor: AppColors.purple,
                        bgColor: AppColors.white,
                        fontColor: AppColors.purple,
                        borderRadius: 100,
                        onPressed: () {
                          if (step < steps.length - 1) {
                            setState(() => step++);
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        isCircular: true,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                )
              ],
            ),

          ):     SizedBox(
            width: 430.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8.w,bottom: 135.h),
                        child: Card(
                          elevation: 7,
                          surfaceTintColor: AppColors.forestGrey,
                          color: AppColors.white,
                          shadowColor: AppColors.purple.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: SizedBox(

                            height: 149.h,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 4.h),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child:  Image.asset(AppImages.classes,height: 105.h,fit: BoxFit.cover,width: 105.w,),
                                  ),
                                ),
                                customText(
                                    text: "Classes",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.blackShade)
                              ],
                            ),
                          ),
                        )

                      ),
                      Container(
                        margin: EdgeInsets.only(right: 0.w,bottom: 100.h),
                        padding: const EdgeInsets.all(0),
                        width:260.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child:  Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Image.asset(
                                  steps[step].image,
                                  height: 180.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                verticalSpacer(16),

                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 15.w),
                                  child: customText(
                                    text:steps[step].title,

                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackShade,
                                  ),
                                ),
                                verticalSpacer(8),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 8.w),
                                  child: customText(
                                    text: steps[step].description,
                                    fontWeight: FontWeight.w400,
                                   fontSize: 14, color: AppColors.darkGrey,
                                  ),
                                ),

                                verticalSpacer(20),
                                customDivider(
                                  height: 1,
                                  width: double.infinity,
                                  color: AppColors.lightestGreyShade,
                                ),
                                verticalSpacer(12),

                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 12.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      simpleCustomButton(
                                        context: context,
                                        text: "Skip Tour",
                                        fontSize: 14,
                                        height: 32,
                                        width: 100,
                                        borderColor: AppColors.sand,
                                        bgColor: AppColors.white,
                                        fontColor: AppColors.sand,
                                        borderRadius: 100,
                                        onPressed: () => Navigator.pop(context),
                                        isCircular: true,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      horizontalSpacer(24),
                                      simpleCustomButton(
                                        context: context,
                                        text:   steps[step].buttonText,
                                        fontSize: 14,
                                        height: 32,
                                        width: 100,
                                        borderColor: AppColors.purple,
                                        bgColor: AppColors.white,
                                        fontColor: AppColors.purple,
                                        borderRadius: 100,
                                        onPressed: () {
                                      if (step < steps.length - 1) {
                                      setState(() => step++);
                                      } else {
                                      Navigator.pop(context);
                                      }
                                        },
                                        isCircular: true,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                      ),
                    ],
                  ),
          ),
              ),
            ),
          );
        },
      );
    },
  );
}

class TourStep {
  final String title;
  final String description;
  final String image; // asset path
  final String buttonText;

  TourStep({
    required this.title,
    required this.description,
    required this.image,
    required this.buttonText,
  });
}
