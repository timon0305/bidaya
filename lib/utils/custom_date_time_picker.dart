import 'package:quizzo/export.dart';

Future<void> selectDateBottomSheet(
  BuildContext context,
  TextEditingController dateController,
) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50.r),
        topRight: Radius.circular(50.r),
      ),
      side: const BorderSide(color: Colors.transparent),
    ),
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
        child: Container(
          height: 403.h,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              topRight: Radius.circular(18.r),
            ),
            color: Colors.white,
          ),
          child: CalendarScreen(controller: dateController),
        ),
      );
    },
  );
}

class CalendarScreen extends StatefulWidget {
  final TextEditingController? controller;

  const CalendarScreen({super.key, required this.controller});

  @override
  State<CalendarScreen> createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDay = DateTime.now();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      widget.controller!.text = DateFormat('yyyy-MM-dd').format(_selectedDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightestGreyShade, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TableCalendar(
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
                      color: AppColors.greyWhiteShade,
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
                      color: AppColors.greyWhiteShade,
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
            decoration: BoxDecoration(color: AppColors.white),
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
              border: Border.all(width: 0, color: Colors.white),
            ),
            tableBorder: TableBorder.all(color: AppColors.white),
            todayDecoration: const BoxDecoration(),
            selectedDecoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blueShade,
            ),
            todayTextStyle: TextStyle(
              color: AppColors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              fontFamily: GoogleFonts.nunito().fontFamily,
            ),
            tablePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            cellPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            cellMargin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            cellAlignment: Alignment.center,
          ),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
          focusedDay: _selectedDay,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          onDaySelected: _onDaySelected,
        ),
      ),
    );
  }
}
