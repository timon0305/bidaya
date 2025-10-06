
import 'package:quizzo/export.dart';



Widget dashboardHeader(
    BuildContext context, {
      required String name,
      required String subtitle,
      String? avatar,
      required double avatarSize,
      required VoidCallback? onAvatarTap,
      required bool showOnlineDot,
    }) {
  ImageProvider? image;
  if (avatar != null && avatar.isNotEmpty) {
    image = avatar.startsWith('http')
        ? NetworkImage(avatar)
        : AssetImage(avatar) as ImageProvider;
  }

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: SizedBox(
          height: avatarSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                text: "Hello, $name 👋",
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: AppColors.blackShade,
              ),

              customText(
                text: subtitle,
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColors.sand,
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: onAvatarTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: avatarSize.h,
              width: avatarSize.w,
              padding: EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.forestGrey,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image(
                  height: avatarSize.h-4.h,
                  width: avatarSize.w-4.w,
                  image: image ?? AssetImage(AppImages.avatarPng),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (showOnlineDot)
              Positioned(
                left: -1.w,
                bottom: -1.h,
                child: Container(
                  width: 22.w,
                  height: 22.h,
                  decoration: BoxDecoration(
                    color: AppColors.blueShade,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: customText(
                      text: "12",
                      fontWeight: FontWeight.w500,
                      fontSize: 9,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ],
  );
}

Widget dashboardTopSection(BuildContext context, AuthViewModel auth) {
  if (auth.userRole == "Admin" || auth.userRole == "Staff") {
    return Container(
      width: 390.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border(
          left: BorderSide(color: AppColors.forestGrey, width: 1.w),
          right: BorderSide(color: AppColors.forestGrey, width: 1.w),
          top: BorderSide(color: AppColors.forestGrey, width: 1.w),
          bottom: BorderSide(color: AppColors.forestGrey, width: 4.w),
        ),
      ),
      child: Column(
        children: [
          progressCard(
            context: context,
            title: "Kids Attendance",
            progress: 0.5,
            total: "58/64",
            color: AppColors.blueShade,
            onButtonPressed: (){
              Get.toNamed(AppRoutes.attendance);
            }
          ),
          if (auth.userRole == "Admin") ...[
            verticalSpacer(4),
            Divider(height: 1.w, thickness: 1.w, color: AppColors.lightestGreyShade),
            progressCard(
              context: context,
              title: "Staff Attendance",
              progress: 0.9,
              total: "7/8",
              color: AppColors.blueShade,
                onButtonPressed: (){
                  Get.toNamed(AppRoutes.attendance);
                }
            ),
          ],
        ],
      ),
    );
  } else {
    return Column(
      children: [
        kidCard(
          context: context,
          age: "4 years, 6 months",
          stdName: "Clinton Mcclure",
          attendance: "Present",
          borderClr: AppColors.green.withValues(alpha: 0.8),
          className: "Junior",
        ),
        verticalSpacer(8),
        kidCard(
          context: context,
          age: "4 years, 6 months",
          stdName: "Maggie Sandals",
          attendance: "Absent",
          borderClr: AppColors.red.withValues(alpha: 0.6),
          className: "Senior",
        ),
        verticalSpacer(8),
        walletCard(
          borderClr: AppColors.blue.withValues(alpha: 0.8),
          context: context,
          payment: "4600 EGP",
          dueDate: "16/07/2025",
        ),
      ],
    );
  }
}

Widget bidiyaFeatureCards(
    BuildContext context,
    AuthViewModel auth,
    DashboardViewModel dashboardVM,
    ) {
  if (auth.userRole == "Admin") {
    return Wrap(
      spacing: 2.w,
      runSpacing: 2.h,
      children: [
        ...dashboardVM.adminList
            .sublist(0, dashboardVM.adminList.length - 1)
            .map((item) => SizedBox(
          width: 130.w,
          height: 170.h,
          child: menuCard(
            title: item["title"],
            image: item["image"],
            color: item["color"],
            onTap: () => Get.toNamed(item["route"]),
          ),
        )),
        SizedBox(
          width: 260.w,
          height: 170.h,
          child: menuCardFullWidth(
            title: dashboardVM.adminList.last["title"],
            image: dashboardVM.adminList.last["image"],
            color: dashboardVM.adminList.last["color"],
            onTap: () => Get.toNamed(dashboardVM.adminList.last["route"]),
          ),
        ),
      ],
    );
  }
  else if (auth.userRole == "Staff") {
    return buildGrid(dashboardVM.staffList);
  } else if (auth.userRole == "Parent") {
    return buildGrid(dashboardVM.parentList);
  } else {
    return const SizedBox();
  }
}

Widget buildGrid(List<Map<String, dynamic>> items) {
  return GridView.count(
    crossAxisCount: 3,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    childAspectRatio: 120 / 149,
    children: items
        .map((item) => menuCard(
      title: item["title"],
      image: item["image"],
      color: item["color"],
      onTap: () => Get.toNamed(item["route"]),
    ))
        .toList(),
  );
}

Widget progressCard({
  required BuildContext context,
  required String title,
  required double progress,
  required String total,
  required Color color,
  VoidCallback ?onButtonPressed
}) {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                textAlign: TextAlign.start,
                text: title,
                color: AppColors.blackShade,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.lightestGreyShade,
                color: color,
                minHeight: 12,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Row(
          children: [
            customText(
              text: total,
              color: AppColors.sand,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            horizontalSpacer(8),
            GestureDetector(
              onTap: onButtonPressed,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.sand,
                size: 18,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


Widget menuCard({
  required String title,
  required String image,
  required VoidCallback onTap,
  Color? color,
}) {
  return Card(
    elevation: 7,
    surfaceTintColor: AppColors.forestGrey,
    color: AppColors.white,
    shadowColor: AppColors.purple.withOpacity(0.3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(16.r),
      splashColor: (color ?? Colors.purple).withOpacity(0.2),
      onTap: onTap,
      child: Container(

        height: 149.h,
          padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 6.h),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child:  Image.asset(image,height: 105.h,fit: BoxFit.cover,width: double.infinity),
                  ),
            ),
            verticalSpacer(4),
            customText(
                text: title,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.blackShade)
          ],
        ),
      ),
    ),
  );
}Widget menuCardFullWidth({
  required String title,
  required String image,
  required VoidCallback onTap,
  Color? color,
}) {
  return Card(
    elevation: 7,
    surfaceTintColor: AppColors.forestGrey,
    color: AppColors.white,
    shadowColor: AppColors.purple.withOpacity(0.3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(16.r),
      splashColor: (color ?? Colors.purple).withOpacity(0.2),
      onTap: onTap,
      child: Container(

        height: 149.h,
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 6.h),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(image,height: 105.h,fit: BoxFit.cover,width: double.infinity,)),
            ),
            verticalSpacer(4),
            customText(
                text: title,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.blackShade)
          ],
        ),
      ),
    ),
  );
}


Widget kidCard({
  required Color borderClr,
  required BuildContext context,
  required String stdName,
  required String attendance,
  required String className,
  required String age,
}) {
  return Container(
    width: 390.w,
    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
    margin: EdgeInsets.zero,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      border: Border(
        left: BorderSide(color: borderClr, width: 1.w),
        right: BorderSide(color: borderClr, width: 1.w),
        top: BorderSide(color: borderClr, width: 1.w),
        bottom: BorderSide(color: borderClr, width: 4.w),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 85.h,
          width: 85.w,
          padding: EdgeInsets.zero,
          margin:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 0.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.forestGrey,
                blurRadius: 5.r,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 3.h),
            child: ClipOval(
              child: Image.asset(
                AppImages.avatarPng,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: stdName,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.blackShade,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    customText(
                      text: "Today's Attendance:",
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                      color: AppColors.blackShade,
                    ),
                    customText(
                      text: " $attendance",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: attendance == "Present"
                          ? AppColors.green
                          : AppColors.red,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    customText(
                      text: "Class:",
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                      color: AppColors.blackShade,
                    ),
                    customText(
                      text: " $className",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.placeholder,
                    ),
                  ],
                ),
                Row(
                  children: [
                    customText(
                      text: "Age:",
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                      color: AppColors.blackShade,
                    ),
                    customText(
                      text: " $age",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.placeholder,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.sand,
            size: 16,
          ),
        ),
      ],
    ),
  );
}
Widget walletCard({
  required Color borderClr,
  required BuildContext context,
  required String payment,required String dueDate
}){
  return    Container(
    width: 390.w,
    padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      border: Border(
          left: BorderSide(
              color: borderClr,
              width: 1.w
          ),
          right: BorderSide(
              color: borderClr,
              width: 1.w
          ),
          top: BorderSide(
              color: borderClr,
              width: 1.w
          ),
          bottom: BorderSide(
              color: borderClr,
              width: 4.w
          )
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       SvgPicture.asset(AppImages.wallet),horizontalSpacer(20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                customText(
                    text: "Payment Due:",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.blackShade),
                customText(
                    text: " $payment",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.blueShade),
              ],
            ),
            Row(
              children: [
                customText(
                    text: "Due: ",
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: AppColors.blackShade),
                customText(
                    text: "16/07/2025:",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.blackShade),
              ],
            ),

          ],
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios,color: AppColors.sand,size: 16,),
      ],
    ),
  );
}

