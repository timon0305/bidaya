import 'package:quizzo/export.dart';
Future<void>  selectDateBottomSheet(BuildContext context,TextEditingController dateController){
  return    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50.r),topRight: Radius.circular(50.r)),side: const BorderSide(color: Colors.transparent)),
      context: context,
      builder: (BuildContext context) {
        return Padding(
                padding: EdgeInsets.only(
                    bottom: Get.mediaQuery.viewInsets.bottom
                ),
                child: Container(
                  height:403.h,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only( top: 20.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(18.r),topRight: Radius.circular(18.r)),
                      color: Colors.white
                  ),
                  child:    CalendarScreen(controller: dateController),

                ),
              );
      });
}
@ immutable
class CalendarScreen extends StatefulWidget {

  TextEditingController? controller;

  CalendarScreen({Key? key, required this.controller}) : super(key: key);
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDay = DateTime.now();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      widget.controller!.text = DateFormat('yyyy-MM-dd').format(_selectedDay);

    });
  }


  @override
  Widget build(BuildContext context) {
    return
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.h),
      padding: EdgeInsets.zero,
    decoration: BoxDecoration(
    border: Border.all(
    color: AppColors.lightestGreyShade,
    width: 1,
    ),
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
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
          focusedDay: _selectedDay,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          onDaySelected: _onDaySelected,
        ),
      )
      );


  }
}


/*
Future<void>  selectTimeBottomSheet(BuildContext context,TextEditingController timeController){
  return    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50.r),topRight: Radius.circular(50.r)),side: const BorderSide(color: Colors.transparent)),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: Get.mediaQuery.viewInsets.bottom
                ),
                child: Container(
                  height:411.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(18.r),topRight: Radius.circular(18.r)),
                      color: Colors.white
                  ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSpacer(15),
                      Container(height: 4.h,width:33.w,color: AppColors.slateGrey.withOpacity(0.20),),
                      verticalSpacer(20),
                      customText("Select Starting Time", FontWeight.w900, 18, AppColors.darkBlue),
                      verticalSpacer(20),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children:[
                            Container(height: 1.h,color: AppColors.slateGrey.withOpacity(0.20),),
                            verticalSpacer(40),
                            CustomTimePicker(controller: timeController,),
                            verticalSpacer(40),
                          ],
                        ),
                      ),
                      const  Spacer(),
                      Container(height: 1.h,color: AppColors.slateGrey.withOpacity(0.20),),
                      SizedBox(
                        height: 90.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            customButton(context, "Close", 16, () => {Get.back()}, 165.w, 48.h, Colors.transparent, AppColors.iceBlu, AppColors.freshBlue, 6, true,FontWeight.w700),
                            horizontalSpacer(8),
                            customButton(context, "Select", 16, () => {}, 165.w, 48.h, Colors.transparent, AppColors.freshBlue, Colors.white, 6, true,FontWeight.w700)
                          ],
                        ),
                      ),
                    ],
                  ),

                ),
              );
            }
        );
      });
}

class CustomTimePicker extends StatefulWidget {
  TextEditingController? controller;

  CustomTimePicker({Key? key, required this.controller}) : super(key: key);
  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}
class _CustomTimePickerState extends State<CustomTimePicker> {
  int _hour = 10;
  int _minute = 0;
  bool _isAm = true;
  String _formatTime() {
    final hour = _hour == 12 ? 12 : _hour % 12;
    final ampm = _isAm ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:${_minute.toString().padLeft(2, '0')} $ampm';
  }

  void _incrementHour() {
    setState(() {
      _hour = (_hour % 12) + 1;
      widget.controller?.text = _formatTime();
    });
  }

  void _decrementHour() {
    setState(() {
      _hour = (_hour - 1) == 0 ? 12 : (_hour - 1) % 12;
      widget.controller?.text = _formatTime();
    });
  }

  void _incrementMinute() {
    setState(() {
      _minute = (_minute + 1) % 60;
      widget.controller?.text = _formatTime();
    });
  }

  void _decrementMinute() {
    setState(() {
      _minute = (_minute - 1) < 0 ? 59 : (_minute - 1) % 60;
      widget.controller?.text = _formatTime();
    });
  }

  void _toggleAmPm() {
    setState(() {
      _isAm = !_isAm;
      widget.controller?.text = _formatTime();
    });
  }


  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            IconButton(
              icon: SvgPicture.asset(AppImages.upArrow),
              onPressed: _incrementHour,
            ),
            verticalSpacer(10),
            customText(_hour.toString(), FontWeight.w700, 24, AppColors.darkBlue),
            verticalSpacer(10),
            IconButton(
              icon: SvgPicture.asset(AppImages.downArrow2),
              onPressed: _decrementHour,
            ),
          ],
        ),
        horizontalSpacer(20),
        customText(":", FontWeight.w700, 24, AppColors.darkBlue),

        horizontalSpacer(20),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset(AppImages.upArrow),
              onPressed: _incrementMinute,
            ),
            verticalSpacer(10),
            customText(_minute.toString().padLeft(2, '0'), FontWeight.w700, 24, AppColors.darkBlue),
            verticalSpacer(10),
            IconButton(
              icon: SvgPicture.asset(AppImages.downArrow2),
              onPressed: _decrementMinute,
            ),
          ],
        ),
        horizontalSpacer(20),
        Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            GestureDetector(
              onTap: _toggleAmPm,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: _isAm ?Colors.white:AppColors.slateGrey
                ),
                child: Center(
                  child: Text(
                    _isAm ? 'AM' : 'PM',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: _isAm ? FontWeight.bold : FontWeight.normal,
                      color: _isAm ?     AppColors.slateGrey : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4,),
            GestureDetector(
              onTap: _toggleAmPm,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: !_isAm ?  Colors.white:AppColors.slateGrey
                ),
                child: Center(
                  child: Text(
                    _isAm ? 'PM' : 'AM',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: !_isAm ?  AppColors.slateGrey: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );

  }
}*/
