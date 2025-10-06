import 'package:quizzo/export.dart';

Widget sleepTimePopup({
  required BuildContext context,
  required Function(TimeOfDay bedtime, TimeOfDay wakeup) onSave,
}) {
  TimeOfDay selectedBedTime = TimeOfDay.now();
  TimeOfDay selectedWakeTime = TimeOfDay.now();
  TextEditingController newController = TextEditingController();
  Future<void> pickTime(BuildContext ctx, bool isBedTime) async {
    final picked = await showTimePicker(
      context: ctx,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      if (isBedTime) {
        selectedBedTime = picked;
      } else {
        selectedWakeTime = picked;
      }
    }
  }

  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            customText(
              text: "New Report (Sleep)",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            verticalSpacer(20),
            customDivider(
              height: 1,
              width: 390,
              color: AppColors.lightestGreyShade,
            ),
            const SizedBox(height: 16),
            customText(
              text: "From:",
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.blackShade,
            ),
            verticalSpacer(12),
            GestureDetector(
              onTap: () async {
                await pickTime(context, true);
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
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

            const SizedBox(height: 12),
            customText(
              text: "To:",
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.blackShade,
            ),
            verticalSpacer(12),
            GestureDetector(
              onTap: () async {
                await pickTime(context, false);
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
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
            verticalSpacer(12),
            customText(
              text: "Notes",
              color: AppColors.blackShade,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            verticalSpacer(8),
            customTextField(
              controller: newController,
              height: 48,
              width: 390,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customButton(
                  context: context,
                  text: "Cancel",
                  fontSize: 16,
                  height: 58,
                  width: 214,
                  borderColor: Colors.transparent,
                  bgColor: AppColors.lavenderPurple.withValues(alpha: 0.4),
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
            /* // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                  onPressed: () => Navigator.pop(context),
                  child: customText(text: "Cancel", color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                  onPressed: () {
                    Navigator.pop(context);
                    onSave(selectedBedTime, selectedWakeTime);
                  },
                  child: customText(text: "Save", color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ],
            ),*/
          ],
        ),
      );
    },
  );
}
