import 'package:quizzo/export.dart';

import '../../inventory_view/widgets/custom_invoice_shape.dart';

Widget parentInvoiceCardSlip({
  required BuildContext context,
  required String name,
  required String status,
  required Color statusColor,
  required String dueDate,
  required String amount,
  required Color amountColor,
  Color? borderColor,
}) {
  return CustomPaint(
    painter: InvoiceSlipPainter(
      borderColor: AppColors.lightestGreyShade,
      backgroundColor: Colors.white,
      hasShadow: false,
      isHeader: false,
    ),
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding:  EdgeInsets.symmetric(horizontal: 6.w,vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          horizontalSpacer(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                customText(text: name, fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.blackShade,),

                customText(text: "Status: $status", fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.whiteGrey,),
                customText(text: "Due Date: $dueDate", fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.whiteGrey,),
              ],
            ),
          ),
          customText(text: amount, fontWeight: FontWeight.w700, fontSize: 18, color: amountColor,),
          PopupMenuButton<int>(
            color: AppColors.white,
            offset: Offset(100.w, 35.h),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            onSelected: (int value) {
              if (value == 1) {
               parentSlipDetails(context);

              } else if (value == 2) {

              } else if (value == 4) {

              }
            },
            itemBuilder: (context) =>
            [
              popupItem0(
                1,
                "View Details",
                popupIcon: "",
                isDivider: true,
                icon: Icons.remove_red_eye_outlined,
                isIcon: true,
              ),
              popupItem0(
                2,
                "Edit",
                popupIcon: AppImages.edit,
                isDivider: true,
              ),
              popupItem0(
                4,
                "Delete",
                popupIcon: AppImages.delete,
                isDivider: false,
                isIcon: true,
              ),
            ],
            child: Icon(
              Icons.more_vert,
              color: AppColors.purple,
              size: 18,
            ),
          ),
        ],
      ),
    ),
  );
}
Widget billingTabInvoiceCardSlip({
  required String name,
  required String status,
  required Color statusColor,
  required String dueDate,
  required String amount,
  required Color amountColor,
  Color? borderColor,
}) {
  return CustomPaint(
    painter: InvoiceSlipPainter(
      borderColor: AppColors.lightestGreyShade,
      backgroundColor: Colors.white,
      hasShadow: false,
      isHeader: false,
    ),
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding:  EdgeInsets.symmetric(horizontal: 6.w,vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          horizontalSpacer(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                customText(text: name, fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.blackShade,),

                customText(text: "Status: $status", fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.whiteGrey,),
                customText(text: "Due Date: $dueDate", fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.whiteGrey,),
              ],
            ),
          ),
          customText(text: amount, fontWeight: FontWeight.w700, fontSize: 18, color: amountColor,),
        ],
      ),
    ),
  );
}

Widget salariesSlip({
  required BuildContext context,
  required String name,
  required String status,
  required Color statusColor,
  required String dueDate,
  required String amount,
  required Color amountColor,
  Color? borderColor,
}) {
  return CustomPaint(
    painter: InvoiceSlipPainter(
      borderColor: AppColors.lightestGreyShade,
      backgroundColor: Colors.white,
      hasShadow: false,
      isHeader: false,
    ),
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          horizontalSpacer(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: name,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.blackShade,
                ),
                customText(
                  text: "Payment Date: $dueDate",
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: AppColors.whiteGrey,
                ),
              ],
            ),
          ),
          customText(
            text: amount,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: AppColors.redShade,
          ),
          PopupMenuButton<int>(
            color: AppColors.white,
            offset: Offset(100.w, 35.h),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            onSelected: (int value) {
              if (value == 1) {
                salarySlipDetails(context);

              } else if (value == 2) {

              } else if (value == 4) {

              }
            },
            itemBuilder: (context) =>
            [
              popupItem0(
                1,
                "View Details",
                popupIcon: "",
                isDivider: true,
                icon: Icons.remove_red_eye_outlined,
                isIcon: true,
              ),
              popupItem0(
                2,
                "Edit",
                popupIcon: AppImages.edit,
                isDivider: true,
              ),
              popupItem0(
                4,
                "Delete",
                popupIcon: AppImages.delete,
                isDivider: false,
                isIcon: true,
              ),
            ],
            child: Icon(
              Icons.more_vert,
              color: AppColors.purple,
              size: 18,
            ),
          ),
        ],
      ),
    ),
  );
}


Widget statusCard({
  required String icon,
  required String title,
  required String amount,
  required Color color,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: AppColors.purple, width: 1.5),
    ),
    child: Row(
      children: [
        SvgPicture.asset(icon),
        horizontalSpacer(12),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            customText(
              text: title,
              fontSize: 12,
              color: AppColors.sand,
              fontWeight: FontWeight.w700,
            ),
            customText(
              text:amount,
              fontSize: 18,
              color: AppColors.purple,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ],
    ),
  );
}