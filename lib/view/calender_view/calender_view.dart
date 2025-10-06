import 'dart:ui';

import 'package:quizzo/export.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  TextEditingController dateController = TextEditingController();
  DateTime _selectedDay = DateTime.now();
  final List<Map<String, dynamic>> events = [
    {
      "title": "Thanks Giving",
      "date": DateTime(2025, 8, 6),
      "subtitle": "Day Off: Aug 6 - Aug 7"
    },
    {
      "title": "Parent-Teacher Meeting",
      "date": DateTime(2025, 8, 30),
      "subtitle": "Number of kids: 13"
    },
    {
      "title": "Project Demo",
      "date": DateTime(2025, 9, 2),
      "subtitle": "With Client at 11AM"
    },
  ];

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      dateController.text = DateFormat('d MMMM yyyy').format(_selectedDay);
    });
  }

  Color? _getDayColor(DateTime day) {
    if (day.year == 2025 && day.month == 8 && (day.day == 6 || day.day == 7)) {
      return Colors.red;
    }
     if (day.year == 2025 && day.month == 8 && day.day == 6 ) {
      return AppColors.green;
    }
    if (isSameDay(day, DateTime.now())) {
      return Colors.green;
    }

    return AppColors.white; // default no color
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthViewModel>();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));

    return Scaffold(
      appBar: customAppBar(title: "Calendar"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(10),
              TableCalendar(
                locale: 'en_US',
                rowHeight: 35.h,
                daysOfWeekHeight: 35.h,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  leftChevronPadding: EdgeInsets.only(left: 25.w),
                  rightChevronPadding: EdgeInsets.only(right: 25.w),
                  titleTextStyle: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.blackShade,
                    fontFamily: GoogleFonts.nunito().fontFamily,
                  ),
                  leftChevronIcon: Center(
                    child: Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lavenderPurple,
                      ),
                      child: Center(
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.greyWhiteShade
                          ),
                          child: const Icon(
                            Icons.chevron_left,
                            color: AppColors.freshBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  rightChevronIcon: Center(
                    child: Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lavenderPurple,
                      ),
                      child: Center(
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.greyWhiteShade
                          ),
                          child: const Icon(
                            Icons.chevron_right,
                            color: AppColors.freshBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  decoration:   BoxDecoration(
                    color: AppColors.white,
                  ),
                  weekdayStyle: TextStyle(
                    color: AppColors.sand,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    fontFamily: GoogleFonts.nunito().fontFamily,
                  ),
                  weekendStyle: TextStyle(
                    color: AppColors.sand,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    fontFamily: GoogleFonts.nunito().fontFamily,
                  ),
                ),
                calendarStyle: CalendarStyle(
                    defaultDecoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(width: 0,color: Colors.white),
                    ),
                    tableBorder:TableBorder.all(
                        color: AppColors.white
                    ),
                    todayDecoration: const BoxDecoration(
                    ),
                    selectedDecoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.blueShade
                    ),
                    todayTextStyle:  TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: GoogleFonts.nunito().fontFamily,
                    ),
                    // borderRadius: BorderRadius.circular(12), ),
                    tablePadding: EdgeInsets.symmetric(
                        horizontal: 20.w, vertical: 8.h),
                    cellPadding: EdgeInsets.symmetric(
                        horizontal: 2.w, vertical: 2.h),
                    cellMargin: EdgeInsets.symmetric(
                        horizontal: 2.w, vertical: 2.h),
                    cellAlignment: Alignment.center

                ),
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    final color = _getDayColor(day);

                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color

                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${day.day}',
                        style:  TextStyle(
                          color: color==AppColors.white?AppColors.sand:AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          fontFamily: GoogleFonts.nunito().fontFamily,
                        ),
                      ),
                    );
                  },
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
                focusedDay: _selectedDay,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                onDaySelected: _onDaySelected,
              ),
              verticalSpacer(12),
           Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    auth.userRole=="Admin"?  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customButton(
                            context: context,
                            text: "+ Add Day Off",
                            fontSize: 16,
                            height: 58,
                            width: 183,
                            borderColor: Colors.transparent,
                            bgColor: AppColors.lavenderPurple.withValues(alpha: 0.4),
                            fontColor: AppColors.purple,
                            overlayColor: AppColors.white.withValues(alpha: 0.5),
                            borderRadius: 100,
                            isCircular: true,
                            fontWeight: FontWeight.w500),
                        customButton(
                            context: context,
                            text: "+ Add Event",
                            fontSize: 16,
                            height: 58,
                            width: 183,
                            borderColor: Colors.transparent,
                            bgColor: AppColors.purple,
                            fontColor: AppColors.white,
                            borderRadius: 100,
                            isCircular: false,
                            onPressed: (){
                              calender(context);
                            },
                            fontWeight: FontWeight.w500),
                      ],
                    ):SizedBox.shrink(),
                    verticalSpacer(20),
                    customDivider(
                        height: 1.5,
                        width: 390,
                        color: AppColors.lightestGreyShade),
                    verticalSpacer(20),
                    customText(
                        text: " Upcoming",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.blackShade),
                    verticalSpacer(10),
                    ...events.map((e) {
                      return eventCard(e["title"], e["subtitle"]);
                    }),

                    verticalSpacer(20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
TextEditingController startDate=TextEditingController(text: "09/09/2025");
TextEditingController endDate=TextEditingController(text: "09/09/2025");
Widget eventCard(String title, String subtitle) {
  return Card(
    color: AppColors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
      side: BorderSide(
        color: AppColors.lightestGreyShade.withValues(alpha: 0.9),
        width: 1,
      ),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      title: customText(
          text: title,
          fontWeight: FontWeight.bold,
          color: AppColors.blackShade,
          fontSize: 18),
      subtitle: customText(
          text: subtitle,
          fontWeight: FontWeight.w400,
          color: AppColors.placeholder,
          fontSize: 14),
      trailing: Container(
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          color: AppColors.redShade,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
            child: SvgPicture.asset(
              AppImages.delete,
              height: 24.h,
              width: 24.w,
              fit: BoxFit.cover,
            )),
      ),
    ),
  );
}

Future<String?> calender(
    BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      final auth = context.watch<AuthViewModel>();
      TextEditingController newController=TextEditingController();
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
              titlePadding: EdgeInsets.zero,
              title:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacer(20),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.w),
                    child: customText(
                        text: "Add to Calendar",
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: AppColors.blackShade),
                  ),
                  verticalSpacer(20),
                  customDivider(height: 1, width: 430, color: AppColors.lightestGreyShade),
                ],

              ),
              content: SingleChildScrollView(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   customText(
                      text: "Title/Reason:",
                      color: AppColors.blackShade,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(8),
                    customTextFieldSuffixIcon(
                      readOnly: false,
                      icon: "",
                      fillColor: AppColors.lightestGreyShade,
                      borderClr: Colors.white,
                      controller: newController,
                      height: 48,
                      width: 350,
                      isMinLine: 1,
                      hintFontSize: 14,
                      keyboardType: TextInputType.text,
                      hintText: "Enter Day off reason or Event name",
                      borderRadius: 8,
                      obscureText: false,
                      onShow: () {},
                      context: context,
                    ),
                    verticalSpacer(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                              text: "Start Date:",
                              color: AppColors.blackShade,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            customTextFieldSuffixIconForOnlyBorderDecoration(
                              controller: startDate,
                              readOnly: true,
                              width: 168,
                              icon: AppImages.calenderSvg,
                              isMaxLine: 1,
                              hintFontSize: 16,
                              keyboardType: TextInputType.phone,
                              hintText: "27/12/1995",
                              borderRadius: 0,
                              obscureText: false,
                              onShow: () {
                                selectDateBottomSheet(context,startDate);
                              },
                              context: context,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                              text: "End Date:",
                              color: AppColors.blackShade,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            customTextFieldSuffixIconForOnlyBorderDecoration(
                              controller: endDate,
                              readOnly: true,
                              height: 48,
                              width: 168,
                              icon: AppImages.calenderSvg,
                              isMaxLine: 1,
                              hintFontSize: 16,
                              keyboardType: TextInputType.phone,
                              hintText: "27/12/1995",
                              borderRadius: 0,
                              obscureText: false,
                              onShow: () {
                                selectDateBottomSheet(context,endDate);
                              },
                              context: context,
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpacer(18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          value: auth.isRememberMe,
                          side: BorderSide(color: AppColors.purple,width: 2.w),
                          activeColor: AppColors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          onChanged: (value) {
                            auth.isRememberMeValue(value??false);

                          },
                        ),
                        customText(text: "Send notifications to staff & parents", fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
                      ],
                    ),
                    verticalSpacer(30),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customButton(context: context,
                              text: "Cancel",
                              fontSize: 16,
                              height: 58,
                              width: 214,
                              borderColor: Colors.transparent,
                              bgColor: AppColors.lavenderPurple.withOpacity(0.4),
                              fontColor: AppColors.purple,
                              overlayColor: AppColors.white.withOpacity(0.5),
                              borderRadius: 100,
                              isCircular: true,
                              onPressed: (){
                                Get.back();
                              },
                              fontWeight: FontWeight.w500),
                          customButton(context: context,
                              text: "Save",
                              fontSize: 16,
                              height: 58,
                              width: 120,
                              borderColor: Colors.transparent,
                              bgColor: AppColors.purple,
                              fontColor: AppColors.white,
                              borderRadius: 100,
                              isCircular: false,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
        ],
      );
    },
  );
}
