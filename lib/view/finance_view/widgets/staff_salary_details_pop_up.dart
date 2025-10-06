import 'package:dotted_line/dotted_line.dart';

import 'dart:ui';

import 'package:quizzo/export.dart';

import '../../setting_view/setting_payment_view.dart';

Future<String?> salarySlipDetails(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.black.withValues(alpha: 0.5)),
            ),
          ),
          AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: "Salary Details",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.blackShade,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.clear,
                    color: AppColors.blackShade,
                    size: 18,
                  ),
                ),
              ],
            ),
            content: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    customRow(
                      title: "Name",
                      subTitle: "Jackson Maine",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    customRow(
                      title: "Payment Date",
                      subTitle: "Deductions",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    customRow(
                      title: "Status",
                      subTitle: "Paid",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: SizedBox(
                        width: 300.w,
                        height: 20.h,
                        child: DottedLine(
                          dashLength: 6,
                          dashGapLength: 4,
                          lineThickness: 1.5,
                          dashColor: AppColors.lightestGreyShade,
                          lineLength: double.infinity,
                        ),
                      ),
                    ),
                    customRow(
                      title: "Salary",
                      subTitle: "300 EGP",
                      subColor: AppColors.green,
                      context: context,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: SizedBox(
                        width: 300.w,
                        height: 20.h,
                        child: DottedLine(
                          dashLength: 6,
                          dashGapLength: 4,
                          lineThickness: 1.5,
                          dashColor: AppColors.lightestGreyShade,
                          lineLength: double.infinity,
                        ),
                      ),
                    ),
                    customRow(
                      title: "Deductions",
                      subTitle: "1,000 EGP",
                      subColor: AppColors.redShade,
                      context: context,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: SizedBox(
                        width: 300.w,
                        height: 20.h,
                        child: DottedLine(
                          dashLength: 6,
                          dashGapLength: 4,
                          lineThickness: 1.5,
                          dashColor: AppColors.lightestGreyShade,
                          lineLength: double.infinity,
                        ),
                      ),
                    ),
                    customRow(
                      title: "Bonus",
                      subTitle: "5,900 EGP",
                      subColor: AppColors.green,
                      context: context,
                    ),
                    SizedBox(
                      width: 400.w,
                      height: 20.h,
                      child: DottedLine(
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 1.5,
                        dashColor: AppColors.lightestGreyShade,
                        lineLength: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w, bottom: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: "Total",
                            color: AppColors.blackShade,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                          customText(
                            text: "6,600 EGP",
                            color: AppColors.blackShade,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future<String?> pendingBillingInvoice(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.black.withValues(alpha: 0.5)),
            ),
          ),
          Positioned(
            top: 20.h,
            right: 20.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.clear, color: AppColors.white, size: 32),
            ),
          ),
          AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: "Invoice Details",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.blackShade,
                ),
              ],
            ),
            content: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customRow(
                      title: "Child",
                      subTitle: "Jackson Maine",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    SizedBox(
                      width: 400.w,
                      height: 20.h,
                      child: DottedLine(
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 1.5,
                        dashColor: AppColors.lightestGreyShade,
                        lineLength: double.infinity,
                      ),
                    ),
                    customRow(
                      title: "Payment Date",
                      subTitle: "14/8/2025",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    customRow(
                      title: "Due Date",
                      subTitle: "19/8/2025",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    customRow(
                      title: "Status",
                      subTitle: "Pending",
                      subColor: AppColors.green,
                      context: context,
                    ),
                    SizedBox(
                      width: 400.w,
                      height: 20.h,
                      child: DottedLine(
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 1.5,
                        dashColor: AppColors.lightestGreyShade,
                        lineLength: double.infinity,
                      ),
                    ),
                    customText(
                      text: "Notes",
                      color: Color(0xFF818181),
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    customText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud",
                      color: AppColors.blackShade,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    verticalSpacer(12),
                    SizedBox(
                      width: 400.w,
                      height: 20.h,
                      child: DottedLine(
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 1.5,
                        dashColor: AppColors.lightestGreyShade,
                        lineLength: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w, bottom: 0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: "Amount",
                            color: AppColors.blackShade,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                          customText(
                            text: "6,600 EGP",
                            color: AppColors.blackShade,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: customButton(
              context: context,
              text: "Pay Now",
              fontSize: 16,
              height: 58,
              width: 276,
              borderColor: Colors.transparent,
              bgColor: AppColors.blue,
              fontColor: Colors.white,
              borderRadius: 100,
              isCircular: true,
              fontWeight: FontWeight.w600,
              onPressed: () {
                Navigator.pop(context);

                payCashInfoCard(context);
              },
            ),
          ),
        ],
      );
    },
  );
}

Future<String?> pendingBillingPaid(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.black.withValues(alpha: 0.5)),
            ),
          ),
          Positioned(
            top: 20.h,
            right: 20.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.clear, color: AppColors.white, size: 32),
            ),
          ),
          AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: "Invoice Details",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.blackShade,
                ),
              ],
            ),
            content: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customRow(
                      title: "Child",
                      subTitle: "Jackson Maine",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    SizedBox(
                      width: 400.w,
                      height: 20.h,
                      child: DottedLine(
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 1.5,
                        dashColor: AppColors.lightestGreyShade,
                        lineLength: double.infinity,
                      ),
                    ),
                    customRow(
                      title: "Payment Date",
                      subTitle: "14/8/2025",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    customRow(
                      title: "Due Date",
                      subTitle: "19/8/2025",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    customRow(
                      title: "Status",
                      subTitle: "Pending",
                      subColor: AppColors.green,
                      context: context,
                    ),
                    customRow(
                      title: "Method",
                      subTitle: "Insta Pay",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    customRow(
                      title: "Paid Date",
                      subTitle: "19/8/2025",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                          text: "Screenshot",
                          color: Color(0xFF818181),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                        Container(
                          width: 42.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.remove_red_eye,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(12),

                    SizedBox(
                      width: 400.w,
                      height: 20.h,
                      child: DottedLine(
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 1.5,
                        dashColor: AppColors.lightestGreyShade,
                        lineLength: double.infinity,
                      ),
                    ),
                    customText(
                      text: "Notes",
                      color: Color(0xFF818181),
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    customText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud",
                      color: AppColors.blackShade,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    verticalSpacer(12),
                    SizedBox(
                      width: 400.w,
                      height: 20.h,
                      child: DottedLine(
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 1.5,
                        dashColor: AppColors.lightestGreyShade,
                        lineLength: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w, bottom: 0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: "Amount",
                            color: AppColors.blackShade,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                          customText(
                            text: "6,600 EGP",
                            color: AppColors.blackShade,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: customButton(
              context: context,
              text: "I've Paid",
              fontSize: 16,
              height: 58,
              width: 276,
              borderColor: Colors.transparent,
              bgColor: AppColors.blue,
              fontColor: Colors.white,
              borderRadius: 100,
              isCircular: true,
              fontWeight: FontWeight.w600,
              onPressed: () {
                Navigator.pop(context);

                payCashInfoCard(context);
              },
            ),
          ),
        ],
      );
    },
  );
}

Future<String?> parentSlipDetails(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.black.withValues(alpha: 0.5)),
            ),
          ),
          AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: "Parent Payment Details",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.blackShade,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.clear,
                    color: AppColors.blackShade,
                    size: 18,
                  ),
                ),
              ],
            ),
            content: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customRow(
                      title: "Child",
                      subTitle: "Clinton Mccluree",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    customRow(
                      title: "Parents",
                      subTitle: "Jackson Maine, Federica Martin",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    SizedBox(
                      width: 300.w,
                      height: 20.h,
                      child: DottedLine(
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 1.5,
                        dashColor: AppColors.lightestGreyShade,
                        lineLength: double.infinity,
                      ),
                    ),
                    customRow(
                      title: "Due Date",
                      subTitle: "19/8/2025",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    customRow(
                      title: "Payment Date",
                      subTitle: "12/8/2025",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    customRow(
                      title: "Status",
                      subTitle: "Paid",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    customRow(
                      title: "Method",
                      subTitle: "Insta",
                      subColor: AppColors.green,
                      context: context,
                    ),
                    customRow(
                      title: "Paid Date",
                      subTitle: "19/8/2025",
                      subColor: AppColors.redShade,
                      context: context,
                    ),
                    customRow(
                      title: "Submitted by Parent",
                      subTitle: "Paid",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    customRow(
                      title: "Receipt Number",
                      subTitle: "89898",
                      subColor: AppColors.green,
                      context: context,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                          text: "Screenshot",
                          color: Color(0xFF818181),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                        Container(
                          width: 42.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.remove_red_eye,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: SizedBox(
                        width: 300.w,
                        height: 20.h,
                        child: DottedLine(
                          dashLength: 6,
                          dashGapLength: 4,
                          lineThickness: 1.5,
                          dashColor: AppColors.lightestGreyShade,
                          lineLength: double.infinity,
                        ),
                      ),
                    ),
                    customRow(
                      title: "Bonus",
                      subTitle: "5,900 EGP",
                      subColor: AppColors.green,
                      context: context,
                    ),
                    SizedBox(
                      width: 390.w,
                      height: 10.h,
                      child: DottedLine(
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 1.5,
                        dashColor: AppColors.lightestGreyShade,
                        lineLength: double.infinity,
                      ),
                    ),
                    customText(
                      text: "Notes",
                      color: Color(0xFF818181),
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    customText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud",
                      color: AppColors.blackShade,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    verticalSpacer(12),
                    SizedBox(
                      width: 390.w,
                      height: 10.h,
                      child: DottedLine(
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 1.5,
                        dashColor: AppColors.lightestGreyShade,
                        lineLength: double.infinity,
                      ),
                    ),
                    verticalSpacer(12),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w, bottom: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: "AMOUNT",
                            color: AppColors.blackShade,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                          customText(
                            text: "-2,600 EGP",
                            color: AppColors.blackShade,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

final paymentMethods = <PaymentOption>[
  PaymentOption(id: 'whatsapp', title: 'Instapay', icon: AppImages.whatsapp),
  PaymentOption(id: 'card', title: 'Vodaphone', icon: AppImages.pay),
  PaymentOption(id: 'apple', title: 'Etisalat Cash', icon: AppImages.appStore),
];

Future<String?> payCashInfoCard(BuildContext context) async {
  String? selectedId;
  return showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Stack(
            children: [
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(color: Colors.black.withValues(alpha: 0.5)),
                ),
              ),
              SizedBox(
                child: AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  insetPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 24,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        text: "Choose Payment Method",
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: AppColors.blackShade,
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.clear,
                          color: AppColors.blackShade,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  content: SizedBox(
                    width: 400.w,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: paymentMethods.length,
                            itemBuilder: (context, index) {
                              final item = paymentMethods[index];
                              final selected = item.id == selectedId;
                              return paymentTile2(
                                option: item,
                                selected: selected,
                                onTap:
                                    () => setState(() {
                                      selectedId = item.id;
                                    }),
                              );
                            },
                          ),
                          SizedBox(
                            width: 390.w,
                            height: 10.h,
                            child: DottedLine(
                              dashLength: 6,
                              dashGapLength: 4,
                              lineThickness: 1.5,
                              dashColor: AppColors.lightestGreyShade,
                              lineLength: double.infinity,
                            ),
                          ),
                          customRow(
                            title: "Instructions",
                            subTitle:
                                " Please send the payment to:\n                      011595215212",
                            subColor: AppColors.blackShade,
                            context: context,
                          ),
                          SizedBox(
                            width: 390.w,
                            height: 10.h,
                            child: DottedLine(
                              dashLength: 6,
                              dashGapLength: 4,
                              lineThickness: 1.5,
                              dashColor: AppColors.lightestGreyShade,
                              lineLength: double.infinity,
                            ),
                          ),
                          Container(
                            height: 128.h,
                            width: 382.w,
                            decoration: BoxDecoration(
                              color: AppColors.purple.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: AppColors.purple),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppImages.imagePlaceholder),
                                verticalSpacer(8),
                                customText(
                                  text: "Upload Screenshot",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: AppColors.purple,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 390.w,
                            height: 10.h,
                            child: DottedLine(
                              dashLength: 6,
                              dashGapLength: 4,
                              lineThickness: 1.5,
                              dashColor: AppColors.lightestGreyShade,
                              lineLength: double.infinity,
                            ),
                          ),
                          verticalSpacer(8),
                          Padding(
                            padding: EdgeInsets.only(right: 4.w, bottom: 0.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customText(
                                  text: "Amount",
                                  color: AppColors.blackShade,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                                customText(
                                  text: "6,600 EGP",
                                  color: AppColors.blackShade,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.h,
                left: 20.w,
                right: 20.w,
                child: customButton(
                  context: context,
                  text: "I've paid",
                  fontSize: 16,
                  height: 58,
                  width: 276,
                  borderColor: Colors.transparent,
                  bgColor: AppColors.blue,
                  fontColor: Colors.white,
                  borderRadius: 100,
                  isCircular: true,
                  fontWeight: FontWeight.w600,
                  onPressed: () {
                    Navigator.pop(context);

                    payCashInfoCard(context);
                  },
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

Future<String?> expenseSlipDetails(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.black.withValues(alpha: 0.5)),
            ),
          ),
          AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: "Expense Details",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.blackShade,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.clear,
                    color: AppColors.blackShade,
                    size: 18,
                  ),
                ),
              ],
            ),
            content: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customRow(
                      title: "Expense Date",
                      subTitle: "14/8/2025",
                      subColor: AppColors.blackShade,
                      context: context,
                    ),
                    SizedBox(
                      width: 390.w,
                      height: 10.h,
                      child: DottedLine(
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 1.5,
                        dashColor: AppColors.lightestGreyShade,
                        lineLength: double.infinity,
                      ),
                    ),
                    customText(
                      text: "Notes",
                      color: Color(0xFF818181),
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    customText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud",
                      color: AppColors.blackShade,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    verticalSpacer(12),
                    SizedBox(
                      width: 390.w,
                      height: 10.h,
                      child: DottedLine(
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 1.5,
                        dashColor: AppColors.lightestGreyShade,
                        lineLength: double.infinity,
                      ),
                    ),
                    verticalSpacer(12),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w, bottom: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: "AMOUNT",
                            color: AppColors.blackShade,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                          customText(
                            text: "-2,600 EGP",
                            color: AppColors.blackShade,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget customRow({
  required String title,
  required String subTitle,
  required Color subColor,
  required BuildContext context,
}) {
  return Padding(
    padding: EdgeInsets.only(right: 4.w, bottom: 18.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(
          text: title,
          color: Color(0xFF818181),
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        customText(
          text: subTitle,
          color: subColor,
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
      ],
    ),
  );
}

Future<String?> addPaymentAccountDetails(
  BuildContext context,
  String title,
) async {
  return showDialog<String>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      TextEditingController newController = TextEditingController();
      return Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.black.withValues(alpha: 0.5)),
            ),
          ),
          AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            title: customText(
              text: title,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColors.blackShade,
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacer(12),
                  customDivider(
                    height: 1,
                    width: 390,
                    color: AppColors.lightestGreyShade,
                  ),
                  verticalSpacer(12),
                  customText(
                    text: "Payments Details *",
                    color: AppColors.blackShade,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  verticalSpacer(12),
                  customTextFieldSuffixIcon(
                    controller: newController,
                    height: 48,
                    width: 390,
                    isMinLine: 1,
                    hintFontSize: 12,
                    borderClr: Colors.transparent,
                    readOnly: false,
                    icon: "",
                    fillColor: AppColors.lightestGreyShade,
                    keyboardType: TextInputType.text,
                    hintText: "  Phone / Account Number",
                    borderRadius: 10,
                    obscureText: false,
                    onShow: () {},
                    context: context,
                  ),
                  verticalSpacer(12),
                  Consumer<AuthViewModel>(
                    builder: (context, auth, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            value: auth.isRememberMe,
                            side: BorderSide(
                              color: AppColors.purple,
                              width: 2.w,
                            ),
                            activeColor: AppColors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onChanged: (value) {
                              auth.isRememberMeValue(value ?? false);
                            },
                          ),
                          customText(
                            text: "Enable",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ],
                      );
                    },
                  ),
                  verticalSpacer(12),
                  customDivider(
                    height: 1,
                    width: 400,
                    color: AppColors.lightestGreyShade,
                  ),
                  verticalSpacer(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customButton(
                        context: context,
                        text: "Cancel",
                        fontSize: 16,
                        height: 58,
                        width: 200,
                        borderColor: Colors.transparent,
                        bgColor: AppColors.lavenderPurple.withValues(
                          alpha: 0.4,
                        ),
                        fontColor: AppColors.purple,
                        overlayColor: AppColors.white.withValues(alpha: 0.5),
                        borderRadius: 100,
                        onPressed: () {
                          Get.back();
                        },
                        isCircular: true,
                        fontWeight: FontWeight.w500,
                      ),
                      customButton(
                        context: context,
                        text: "Save",
                        fontSize: 16,
                        height: 58,
                        width: 120,
                        borderColor: Colors.transparent,
                        bgColor: AppColors.purple,
                        fontColor: AppColors.white,
                        borderRadius: 100,
                        isCircular: false,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
