import 'package:quizzo/export.dart';

Widget kidMedicalCard({
  required BuildContext context,
  required TextEditingController medicineController,
  required TextEditingController medicineInfoController,
  required TextEditingController allergyController,
  required TextEditingController allergyInfoController,
}) {
  return SizedBox(
    child: Consumer<KidContactViewModel>(
      builder: (context, vm, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ...vm.medicines.asMap().entries.map((entry) {
                int index = entry.key;
                var controllers = entry.value;
                return Column(
                  children: [
                    kidAddMedicineCardDetail(
                      context: context,
                      index: index + 1,
                      onTap: () {
                        vm.removeMedicine(index);
                      },
                      listLength: vm.medicines.length,
                      medicineController: controllers["medicine"]!,
                      medicineInfoController: controllers["info"]!,
                    ),
                    verticalSpacer(12),
                  ],
                );
              }),

              verticalSpacer(12),
              customAddButton2(
                title: "💊 Add Medicine",
                onTap: () {
                  vm.addMedicine(context);
                },
                color: AppColors.purple,
              ),
              verticalSpacer(12),
              customDivider(
                height: 1,
                width: 390,
                color: AppColors.lightestGreyShade,
              ),
              ...vm.allergies.asMap().entries.map((entry) {
                int index = entry.key;
                var controllers = entry.value;

                return Column(
                  children: [
                    kidAllergyDetail(
                      context: context,
                      index: index + 1,
                      listLength: vm.allergies.length,
                      onTap: () {
                        vm.removeAllergy(index);
                      },
                      allergyController: controllers["allergy"]!,
                      infoController: controllers["info"]!,
                    ),
                    verticalSpacer(12),
                  ],
                );
              }),
              verticalSpacer(12),
              customAddButton2(
                title: "⚠️ Add Allergy",
                onTap: () {
                  vm.addAllergy(context);
                },
                color: AppColors.purple,
              ),
              customDivider(
                height: 1,
                width: 390,
                color: AppColors.lightestGreyShade,
              ),
              verticalSpacer(12),
            ],
          ),
        );
      },
    ),
  );
}

Widget kidAddMedicineCardDetail({
  required BuildContext context,
  required int listLength,
  required int index,
  required VoidCallback onTap,
  required TextEditingController medicineController,
  required TextEditingController medicineInfoController,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
    width: 382.w,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: AppColors.purple),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              listLength > 1
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
          children: [
            const SizedBox(),
            customText(
              text: "Medicine $index",
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColors.purple,
            ),
            if (listLength > 1)
              GestureDetector(
                onTap: onTap,
                child: Container(
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
                    ),
                  ),
                ),
              ),
          ],
        ),
        verticalSpacer(12),
        customText(
          text: "Medicine Name",
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black,
        ),
        verticalSpacer(8),
        customTextField(
          controller: medicineController,
          height: 48,
          width: 390,
          isMinLine: 1,
          keyboardType: TextInputType.text,
          hintText: "",
          borderRadius: 12,
          obscureText: false,
          isShow: false,
          onShow: () {},
          context: context,
        ),
        verticalSpacer(20),
        customText(
          text: "Additional Information",
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black,
        ),
        verticalSpacer(8),
        customTextField(
          controller: medicineInfoController,
          height: 48,
          width: 390,
          isMinLine: 1,
          keyboardType: TextInputType.text,
          hintText: "Severity, symptoms, etc.",
          borderRadius: 12,
          obscureText: false,
          isShow: false,
          onShow: () {},
          context: context,
        ),
      ],
    ),
  );
}

Widget kidAllergyDetail({
  required BuildContext context,
  required int listLength,
  required int index,
  required VoidCallback onTap,
  required TextEditingController allergyController,
  required TextEditingController infoController,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
    width: 382.w,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: AppColors.purple),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              listLength > 1
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
          children: [
            SizedBox(),
            customText(
              text: "Allergy $index",
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColors.purple,
            ),
            if (listLength > 1)
              GestureDetector(
                onTap: onTap,
                child: Container(
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
                    ),
                  ),
                ),
              ),
          ],
        ),
        verticalSpacer(20),
        customText(
          text: "Allergy Name",
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black,
        ),
        verticalSpacer(8),
        customTextField(
          controller: allergyController,
          height: 48,
          width: 390,
          isMinLine: 1,
          keyboardType: TextInputType.text,
          hintText: "",
          borderRadius: 12,
          obscureText: false,
          isShow: false,
          onShow: () {},
          context: context,
        ),
        verticalSpacer(20),
        customText(
          text: "Additional Information",
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black,
        ),
        verticalSpacer(8),
        customTextField(
          controller: infoController,
          height: 48,
          width: 390,
          isMinLine: 1,
          keyboardType: TextInputType.text,
          hintText: "Severity, symptoms, etc.",
          borderRadius: 12,
          obscureText: false,
          isShow: false,
          onShow: () {},
          context: context,
        ),
      ],
    ),
  );
}
