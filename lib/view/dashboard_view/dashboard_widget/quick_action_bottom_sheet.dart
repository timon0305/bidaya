import 'package:quizzo/export.dart';

import '../../reporting_view/widgets/reporting_food_card.dart';

Future<void> quickActionStaffBottomSheet(BuildContext context) {
  final List<Map<String, dynamic>> actions = [
    {
      "title": "+ Food",
      "icon": AppImages.quickActionFood,
      "onTap": () => quickActionFoodBottomSheet(context),
    },
    {
      "title": "+ Toilet",
      "icon": AppImages.quickActionToilet,
      "onTap": () => quickActionToiletBottomSheet(context),
    },
    {
      "title": "+ Sleep",
      "icon": AppImages.quickActionSleep,
      "onTap":
          () => quickActionPickTimeBottomSheet(
            context: context,
            onSave: (bedtime, wakeup) {},
          ),
    },
    {
      "title": "+ Mood",
      "icon": AppImages.quickActionMood,
      "onTap": () => quickActionMoodBottomSheet(context),
    },
    {
      "title": "+ Activity Level",
      "icon": AppImages.quickActionLive,
      "onTap": () => quickActionActivityBottomSheet(context),
    },
    {
      "title": "+ Live Activity",
      "icon": AppImages.quickActivityLevel,
      "onTap": () => quickActionLiveActivityBottomSheet(context),
    },
    {
      "title": "Pickup/Emergency Contacts",
      "icon": AppImages.car,
      "onTap": () => quickActionContactBottomSheet(context),
    },
  ];
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(120.r),
        topRight: Radius.circular(120.r),
      ),
      side: const BorderSide(color: Colors.transparent),
    ),
    context: context,
    backgroundColor: AppColors.white,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              children: [
                customDivider(
                  height: 5,
                  width: 40,
                  color: AppColors.forestGrey,
                ),
                verticalSpacer(20),
                customText(
                  text: "Quick Action",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.blackShade,
                ),
                verticalSpacer(12),
                customDivider(
                  height: 1,
                  width: 400,
                  color: AppColors.lightestGreyShade,
                ),
                verticalSpacer(12),
                SingleChildScrollView(
                  child: Wrap(
                    spacing: 2.w,
                    runSpacing: 2.h,
                    children: [
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        padding: EdgeInsets.zero,
                        childAspectRatio: 183.w / 120.h,
                        children:
                            actions
                                .sublist(0, actions.length - 1)
                                .map(
                                  (item) => GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      item["onTap"]();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 0.w,
                                        vertical: 0.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.quickWhiteBg,
                                        border: Border.all(
                                          color: AppColors.quickBg,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          16.r,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            item["icon"],
                                            width: 48.w,
                                            height: 48.h,
                                            fit: BoxFit.cover,
                                          ),
                                          verticalSpacer(16),
                                          customText(
                                            text: item["title"],
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: AppColors.blackShade,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                      verticalSpacer(12),
                      Container(
                        width: double.infinity,
                        height: 114.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 0.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.quickWhiteBg,
                          border: Border.all(color: AppColors.quickBg),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            actions.last["onTap"]();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                actions.last["icon"],
                                width: 48.w,
                                height: 48.h,
                                fit: BoxFit.cover,
                              ),
                              verticalSpacer(16),
                              customText(
                                text: actions.last["title"], // fixed
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: AppColors.blackShade,
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpacer(12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> quickActionAdminBottomSheet(BuildContext context) {
  final List<Map<String, String>> actions = [
    {"title": "Send Parent Invoice", "image": AppImages.addInvoice},
    {"title": "Notifications", "image": AppImages.notification},
    {"title": "Categories", "image": AppImages.category},
    {"title": "Manage Nursery", "image": AppImages.manageNursery},
    {"title": "Invoice", "image": AppImages.invoice},
    {"title": "Transport", "image": AppImages.car},
  ];

  return showModalBottomSheet<void>(
    isScrollControlled: true,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(120.r),
        topRight: Radius.circular(120.r),
      ),
      side: const BorderSide(color: Colors.transparent),
    ),
    context: context,
    backgroundColor: AppColors.white,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              children: [
                customDivider(
                  height: 5,
                  width: 40,
                  color: AppColors.forestGrey,
                ),
                verticalSpacer(20),
                customText(
                  text: "Quick Action",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.blackShade,
                ),
                verticalSpacer(12),
                customDivider(
                  height: 1,
                  width: 400,
                  color: AppColors.lightestGreyShade,
                ),
                verticalSpacer(12),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  padding: EdgeInsets.zero,
                  childAspectRatio: 183.w / 120.h,
                  physics: const ScrollPhysics(),
                  children:
                      actions.map((action) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            switch (action["title"]) {
                              case "Send Parent Invoice":
                                break;
                              case "Notifications":
                                break;
                              case "Categories":
                                break;
                              case "Manage Nursery":
                                break;
                              case "Invoice":
                                break;
                              case "Transport":
                                break;
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.w,
                              //   vertical: 18.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: AppColors.quickWhiteBg,
                              border: Border.all(color: AppColors.quickBg),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  action["image"]!,
                                  width: 48.w,
                                  height: 48.h,
                                  fit: BoxFit.cover,
                                ),
                                verticalSpacer(16),
                                customText(
                                  textAlign: TextAlign.center,
                                  text: action["title"]!,
                                  textFlow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: AppColors.blackShade,
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
                verticalSpacer(20),
              ],
            ),
          ),
        ),
      );
    },
  );
}

String? selectKid;
Future<void> quickActionFoodBottomSheet(BuildContext context) async {
  TextEditingController newController = TextEditingController();

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacer(12),
              customDivider(height: 5, width: 40, color: AppColors.forestGrey),
              verticalSpacer(12),
              customText(
                text: "Quick Action",
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppColors.blackShade,
              ),
              verticalSpacer(12),
              customDivider(
                height: 1,
                width: double.infinity,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacer(8),
                    customDropdownFieldWithPrefixIcon(
                      context: context,
                      iconPath: AppImages.dropArrow,
                      width: double.infinity,
                      borderRadius: 16,
                      hintFontSize: 13,
                      borderColor: Colors.transparent,
                      fillColor: AppColors.freshBlue.withValues(alpha: 0.06),
                      prefixIconPath: AppImages.smile,
                      items: ["Horaab", "Horain", "Hailen"],
                      value: selectKid?.isNotEmpty == true ? selectKid : null,
                      onChanged: (val) {
                        selectKid = val ?? "";
                      },
                      hintText: '',
                    ),
                    verticalSpacer(20),
                    customText(
                      text: "Meal Type:",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          imageWithText2(
                            title: "Breakfast",
                            image: AppImages.breakFast,
                            context: context,
                          ),
                          imageWithText2(
                            title: "Snack",
                            image: AppImages.snack,
                            context: context,
                          ),
                          imageWithText2(
                            title: "Lunch",
                            image: AppImages.reportLunchMeal,
                            context: context,
                          ),
                        ],
                      ),
                    ),

                    verticalSpacer(30),
                    customDivider(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.lightestGreyShade,
                    ),
                    verticalSpacer(20),

                    customText(
                      text: "Amount Eaten:",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(20),
                    Row(
                      children: [
                        imageWithText(
                          title: "All",
                          image: AppImages.allFood,
                          context: context,
                        ),
                        imageWithText(
                          title: "Some",
                          image: AppImages.someFood,
                          context: context,
                        ),
                        imageWithText(
                          title: "None",
                          image: AppImages.noFood,
                          context: context,
                        ),
                      ],
                    ),

                    verticalSpacer(20),
                    customText(
                      text: "Notes",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(20),

                    customTextField(
                      controller: newController,
                      height: 48,
                      width: double.infinity,
                      isMinLine: 1,
                      hintFontSize: 16,
                      keyboardType: TextInputType.text,
                      hintText: "Optional",
                      borderRadius: 12,
                      obscureText: false,
                      isShow: false,
                      onShow: () {},
                      context: context,
                    ),

                    verticalSpacer(30),
                    customButton(
                      context: context,
                      text: "Save",
                      fontSize: 16,
                      height: 58,
                      width: double.infinity,
                      borderColor: Colors.transparent,
                      bgColor: AppColors.blue,
                      fontColor: Colors.white,
                      borderRadius: 100,
                      isCircular: true,
                      fontWeight: FontWeight.w600,
                      onPressed: () {},
                    ),
                    verticalSpacer(30),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> quickActionMoodBottomSheet(BuildContext context) async {
  TextEditingController newController = TextEditingController();

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacer(12),
              customDivider(height: 5, width: 40, color: AppColors.forestGrey),
              verticalSpacer(12),
              customText(
                text: "Quick Action",
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppColors.blackShade,
              ),
              verticalSpacer(12),
              customDivider(
                height: 1,
                width: double.infinity,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    verticalSpacer(8),
                    customDropdownFieldWithPrefixIcon(
                      context: context,
                      iconPath: AppImages.dropArrow,
                      width: double.infinity,
                      borderRadius: 16,
                      hintFontSize: 13,
                      borderColor: Colors.transparent,
                      fillColor: AppColors.freshBlue.withValues(alpha: 0.06),
                      prefixIconPath: AppImages.smile,
                      items: ["Horaab", "Horain", "Hailen"],
                      value: selectKid?.isNotEmpty == true ? selectKid : null,
                      onChanged: (val) {
                        selectKid = val ?? "";
                      },
                      hintText: '',
                    ),
                    verticalSpacer(20),
                    customText(
                      text: "Mood:",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(20),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          imageWithText(
                            title: "Low",
                            image: AppImages.happy,
                            context: context,
                          ),
                          horizontalSpacer(4),
                          imageWithText(
                            title: "Sleepy",
                            image: AppImages.sleepy,
                            context: context,
                          ),
                          horizontalSpacer(4),
                          imageWithText(
                            title: "Sad",
                            image: AppImages.sad,
                            context: context,
                          ),
                          horizontalSpacer(4),
                          imageWithText(
                            title: "Angry",
                            image: AppImages.angry,
                            context: context,
                          ),
                          horizontalSpacer(4),
                          imageWithText(
                            title: "Excited",
                            image: AppImages.excited,
                            context: context,
                          ),
                          horizontalSpacer(4),
                          imageWithText(
                            title: "Shy",
                            image: AppImages.shy,
                            context: context,
                          ),
                          horizontalSpacer(4),
                          imageWithText(
                            title: "Calm",
                            image: AppImages.calm,
                            context: context,
                          ),
                          horizontalSpacer(4),
                          imageWithText(
                            title: "Unwell",
                            image: AppImages.unwell,
                            context: context,
                          ),
                          horizontalSpacer(4),
                          imageWithText(
                            title: "worried",
                            image: AppImages.worried,
                            context: context,
                          ),
                        ],
                      ),
                    ),

                    verticalSpacer(30),
                    customDivider(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.lightestGreyShade,
                    ),
                    verticalSpacer(20),

                    customText(
                      text: "Notes",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(20),

                    customTextField(
                      controller: newController,
                      height: 48,
                      width: double.infinity,
                      isMinLine: 1,
                      hintFontSize: 16,
                      keyboardType: TextInputType.text,
                      hintText: "Optional",
                      borderRadius: 12,
                      obscureText: false,
                      isShow: false,
                      onShow: () {},
                      context: context,
                    ),

                    verticalSpacer(30),
                    customButton(
                      context: context,
                      text: "Save",
                      fontSize: 16,
                      height: 58,
                      width: double.infinity,
                      borderColor: Colors.transparent,
                      bgColor: AppColors.blue,
                      fontColor: Colors.white,
                      borderRadius: 100,
                      isCircular: true,
                      fontWeight: FontWeight.w600,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> quickActionToiletBottomSheet(BuildContext context) async {
  TextEditingController newController = TextEditingController();
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacer(12),
              customDivider(height: 5, width: 40, color: AppColors.forestGrey),
              verticalSpacer(12),
              customText(
                text: "Quick Action",
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppColors.blackShade,
              ),
              verticalSpacer(12),
              customDivider(
                height: 1,
                width: double.infinity,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    verticalSpacer(8),
                    customDropdownFieldWithPrefixIcon(
                      context: context,
                      iconPath: AppImages.dropArrow,
                      width: double.infinity,
                      borderRadius: 16,
                      hintFontSize: 13,
                      borderColor: Colors.transparent,
                      fillColor: AppColors.freshBlue.withValues(alpha: 0.06),
                      prefixIconPath: AppImages.smile,
                      items: ["Horaab", "Horain", "Hailen"],
                      value: selectKid?.isNotEmpty == true ? selectKid : null,
                      onChanged: (val) {
                        selectKid = val ?? "";
                      },
                      hintText: '',
                    ),
                    verticalSpacer(20),
                    customText(
                      text: "Toilet Type:",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(20),

                    Row(
                      children: [
                        imageWithText(
                          title: "Urine",
                          image: AppImages.urine,
                          context: context,
                        ),
                        imageWithText(
                          title: "Stool",
                          image: AppImages.stool,
                          context: context,
                        ),
                      ],
                    ),
                    verticalSpacer(30),
                    customDivider(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.lightestGreyShade,
                    ),
                    verticalSpacer(20),

                    customText(
                      text: "Location:",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(20),

                    Row(
                      children: [
                        imageWithText2(
                          title: "Diaper",
                          image: AppImages.diaper,
                          context: context,
                        ),
                        imageWithText2(
                          title: "Clothes",
                          image: AppImages.clothes,
                          context: context,
                        ),
                        imageWithText2(
                          title: "Toilet",
                          image: AppImages.toilet,
                          context: context,
                        ),
                      ],
                    ),

                    verticalSpacer(20),
                    customText(
                      text: "Notes",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(20),

                    customTextField(
                      controller: newController,
                      height: 48,
                      width: double.infinity,
                      isMinLine: 1,
                      hintFontSize: 16,
                      keyboardType: TextInputType.text,
                      hintText: "Optional",
                      borderRadius: 12,
                      obscureText: false,
                      isShow: false,
                      onShow: () {},
                      context: context,
                    ),
                    verticalSpacer(30),
                    customButton(
                      context: context,
                      text: "Save",
                      fontSize: 16,
                      height: 58,
                      width: double.infinity,
                      borderColor: Colors.transparent,
                      bgColor: AppColors.blue,
                      fontColor: Colors.white,
                      borderRadius: 100,
                      isCircular: true,
                      fontWeight: FontWeight.w600,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> quickActionPickTimeBottomSheet({
  required BuildContext context,
  required Function(TimeOfDay bedtime, TimeOfDay wakeup) onSave,
}) {
  TimeOfDay selectedBedTime = TimeOfDay.now();
  TimeOfDay selectedWakeTime = TimeOfDay.now();
  TextEditingController newController = TextEditingController();
  Future<void> pickTime(
    BuildContext ctx,
    bool isBedTime,
    Function setState,
  ) async {
    final picked = await showTimePicker(
      context: ctx,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isBedTime) {
          selectedBedTime = picked;
        } else {
          selectedWakeTime = picked;
        }
      });
    }
  }

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpacer(12),
                  customDivider(
                    height: 5,
                    width: 40,
                    color: AppColors.forestGrey,
                  ),
                  verticalSpacer(12),
                  customText(
                    text: "Quick Action",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.blackShade,
                  ),
                  verticalSpacer(12),
                  customDivider(
                    height: 1,
                    width: double.infinity,
                    color: AppColors.lightestGreyShade,
                  ),
                  verticalSpacer(12),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 24.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        verticalSpacer(8),
                        customDropdownFieldWithPrefixIcon(
                          context: context,
                          iconPath: AppImages.dropArrow,
                          width: double.infinity,
                          borderRadius: 16,
                          hintFontSize: 13,
                          borderColor: Colors.transparent,
                          fillColor: AppColors.freshBlue.withValues(
                            alpha: 0.06,
                          ),
                          prefixIconPath: AppImages.smile,
                          items: ["Horaab", "Horain", "Hailen"],
                          value:
                              selectKid?.isNotEmpty == true ? selectKid : null,
                          onChanged: (val) {
                            selectKid = val ?? "";
                          },
                          hintText: '',
                        ),
                        verticalSpacer(20),
                        customText(
                          text: "From:",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackShade,
                        ),
                        verticalSpacer(12),

                        GestureDetector(
                          onTap: () => pickTime(context, true, setState),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customText(
                                  text: selectedBedTime.format(context),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackShade,
                                ),
                                Icon(
                                  Icons.access_time_rounded,
                                  color: AppColors.blackShade,
                                ),
                              ],
                            ),
                          ),
                        ),

                        verticalSpacer(20),
                        customText(
                          text: "To:",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackShade,
                        ),
                        verticalSpacer(12),

                        GestureDetector(
                          onTap: () => pickTime(context, false, setState),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customText(
                                  text: selectedWakeTime.format(context),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackShade,
                                ),
                                Icon(
                                  Icons.access_time_rounded,
                                  color: AppColors.blackShade,
                                ),
                              ],
                            ),
                          ),
                        ),

                        verticalSpacer(20),
                        customText(
                          text: "Notes",
                          color: AppColors.blackShade,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        verticalSpacer(20),

                        customTextField(
                          controller: newController,
                          height: 48,
                          width: double.infinity,
                          isMinLine: 1,
                          hintFontSize: 16,
                          keyboardType: TextInputType.text,
                          hintText: "Optional",
                          borderRadius: 12,
                          obscureText: false,
                          isShow: false,
                          onShow: () {},
                          context: context,
                        ),

                        verticalSpacer(30),
                        customButton(
                          context: context,
                          text: "Save",
                          fontSize: 16,
                          height: 58,
                          width: double.infinity,
                          borderColor: Colors.transparent,
                          bgColor: AppColors.blue,
                          fontColor: Colors.white,
                          borderRadius: 100,
                          isCircular: true,
                          fontWeight: FontWeight.w600,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Future<void> quickActionActivityBottomSheet(BuildContext context) {
  TextEditingController newController = TextEditingController();

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacer(12),
              customDivider(height: 5, width: 40, color: AppColors.forestGrey),
              verticalSpacer(12),
              customText(
                text: "Quick Action",
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppColors.blackShade,
              ),
              verticalSpacer(12),
              customDivider(
                height: 1,
                width: double.infinity,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    verticalSpacer(8),
                    customDropdownFieldWithPrefixIcon(
                      context: context,
                      iconPath: AppImages.dropArrow,
                      width: double.infinity,
                      borderRadius: 16,
                      hintFontSize: 13,
                      borderColor: Colors.transparent,
                      fillColor: AppColors.freshBlue.withValues(alpha: 0.06),
                      prefixIconPath: AppImages.smile,
                      items: ["Horaab", "Horain", "Hailen"],
                      value: selectKid?.isNotEmpty == true ? selectKid : null,
                      onChanged: (val) {
                        selectKid = val ?? "";
                      },
                      hintText: '',
                    ),

                    verticalSpacer(20),
                    customText(
                      text: "Activity Level:",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(20),
                    Row(
                      children: [
                        imageWithText(
                          title: "Low",
                          image: AppImages.low,
                          context: context,
                        ),
                        horizontalSpacer(8),
                        imageWithText(
                          title: "Medium",
                          image: AppImages.medium,
                          context: context,
                        ),
                        horizontalSpacer(8),
                        imageWithText(
                          title: "High",
                          image: AppImages.high,
                          context: context,
                        ),
                      ],
                    ),
                    verticalSpacer(30),
                    customDivider(
                      height: 1,
                      width: double.infinity,
                      color: AppColors.lightestGreyShade,
                    ),
                    verticalSpacer(20),

                    customText(
                      text: "Notes",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(20),

                    customTextField(
                      controller: newController,
                      height: 48,
                      width: double.infinity,
                      isMinLine: 1,
                      hintFontSize: 16,
                      keyboardType: TextInputType.text,
                      hintText: "Optional",
                      borderRadius: 12,
                      obscureText: false,
                      isShow: false,
                      onShow: () {},
                      context: context,
                    ),

                    verticalSpacer(30),
                    customButton(
                      context: context,
                      text: "Save",
                      fontSize: 16,
                      height: 58,
                      width: double.infinity,
                      borderColor: Colors.transparent,
                      bgColor: AppColors.blue,
                      fontColor: Colors.white,
                      borderRadius: 100,
                      isCircular: true,
                      fontWeight: FontWeight.w600,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> quickActionLiveActivityBottomSheet(BuildContext context) {
  TextEditingController newController = TextEditingController();

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacer(12),
              customDivider(height: 5, width: 40, color: AppColors.forestGrey),
              verticalSpacer(12),
              customText(
                text: "Quick Action",
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppColors.blackShade,
              ),
              verticalSpacer(12),
              customDivider(
                height: 1,
                width: double.infinity,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    verticalSpacer(8),
                    customDropdownFieldWithPrefixIcon(
                      context: context,
                      iconPath: AppImages.dropArrow,
                      width: double.infinity,
                      borderRadius: 16,
                      hintFontSize: 13,
                      borderColor: Colors.transparent,
                      fillColor: AppColors.freshBlue.withValues(alpha: 0.06),
                      prefixIconPath: "",
                      items: ["Select Class", "Senior", "Junior"],
                      value: selectKid?.isNotEmpty == true ? selectKid : null,
                      onChanged: (val) {
                        selectKid = val ?? "";
                      },
                      hintText: '',
                    ),
                    verticalSpacer(12),
                    Container(
                      height: 230.h,
                      width: 382.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: AppColors.purple),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, color: AppColors.purple),
                          verticalSpacer(12),
                          customText(
                            text: "Add a photo",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColors.purple,
                          ),
                        ],
                      ),
                    ),

                    verticalSpacer(20),

                    customText(
                      text: "Notes",
                      color: AppColors.blackShade,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    verticalSpacer(20),

                    customTextField(
                      controller: newController,
                      height: 48,
                      width: double.infinity,
                      isMinLine: 1,
                      hintFontSize: 16,
                      keyboardType: TextInputType.text,
                      hintText: "Optional",
                      borderRadius: 12,
                      obscureText: false,
                      isShow: false,
                      onShow: () {},
                      context: context,
                    ),
                    verticalSpacer(20),
                  ],
                ),
              ),
              customDivider(
                height: 1,
                width: double.infinity,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: customButton(
                  context: context,
                  text: "Send",
                  fontSize: 16,
                  height: 58,
                  width: double.infinity,
                  borderColor: Colors.transparent,
                  bgColor: AppColors.blue,
                  fontColor: Colors.white,
                  borderRadius: 100,
                  isCircular: true,
                  fontWeight: FontWeight.w600,
                  onPressed: () {},
                ),
              ),
              verticalSpacer(20),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> quickActionContactBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacer(12),
              customDivider(height: 5, width: 40, color: AppColors.forestGrey),
              verticalSpacer(12),
              customText(
                text: "Quick Action",
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppColors.blackShade,
              ),
              verticalSpacer(12),
              customDivider(
                height: 1,
                width: double.infinity,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    verticalSpacer(8),
                    customDropdownField(
                      context: context,
                      iconPath: AppImages.dropArrow,
                      width: double.infinity,
                      borderRadius: 16,
                      hintFontSize: 13,
                      borderColor: Colors.transparent,
                      fillColor: AppColors.freshBlue.withValues(alpha: 0.06),
                      items: ["Select Class", "Senior", "Junior"],
                      value: selectKid?.isNotEmpty == true ? selectKid : null,
                      onChanged: (val) {
                        selectKid = val ?? "";
                      },
                      hintText: '',
                      icon: AppImages.dropArrow,
                    ),
                    verticalSpacer(20),
                  ],
                ),
              ),
              customDivider(
                height: 1,
                width: double.infinity,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(40),
              customButton(
                context: context,
                text: "Go to Child Contacts",
                fontSize: 16,
                height: 58,
                width: 382,
                borderColor: Colors.transparent,
                bgColor: AppColors.blue,
                fontColor: Colors.white,
                borderRadius: 100,
                isCircular: true,
                fontWeight: FontWeight.w600,
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
    },
  );
}
