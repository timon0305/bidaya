import 'package:quizzo/export.dart';
/*Widget kidContactCard({
  required BuildContext context,
  required TextEditingController nameController,
  required TextEditingController phoneController,
  required TextEditingController homePhoneController,
  required TextEditingController addressController,
  required TextEditingController emergencyPhoneController,
  required TextEditingController emergencyNameController,
  required TextEditingController emergencyRelationshipController,
}){
  return SizedBox(

    child: SingleChildScrollView(
      child: Column(
        children: [
         kidParentContactDetail(context: context, nameController: nameController, phoneController: phoneController, homePhoneController: homePhoneController, addressController: addressController),
         verticalSpacer(12),
          customAddButton(title: "Add Parent", onTap: (){}, color: AppColors.purple),
          verticalSpacer(12),
          customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),
          kidEmergencyContactDetail(
            context: context,
            phoneController: emergencyPhoneController,
            nameController: emergencyNameController,
            relationshipController: emergencyRelationshipController
          ),
          verticalSpacer(12),
          customAddButton(title: "Add Emergency/Pickup Contact", onTap: (){}, color: AppColors.purple),
          customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),
          verticalSpacer(12),
        ],
      ),
    ),
  );
}*/
Widget kidContactCard(BuildContext context) {
  return Consumer<KidContactViewModel>(
    builder: (context, vm, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            ...vm.parentContacts.asMap().entries.map((entry) {
              int index = entry.key;
              var controllers = entry.value;
              return Column(
                children: [
                  kidParentContactDetail(
                    context: context,
                    index: index+1,
                    authorized: (controllers["authorized"] ?? false) as bool,
                    onAuthorizedChanged: (value) => vm.toggleAuthorized(index, value),
                    onTap: (){
                      vm.removeParent(index);
                    },
                    listLength: vm.parentContacts.length,
                    nameController: controllers["name"]!,
                    phoneController: controllers["phone"]!,
                    homePhoneController: controllers["homePhone"]!,
                    addressController: controllers["address"]!,
                  ),
                 /* if (vm.parentContacts.length > 1)
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => vm.removeParent(index),
                      ),
                    ),*/
                  verticalSpacer(12),
                ],
              );
            }),

            customAddButton(
              title: "Add Parent",
              onTap: (){
                vm.addParent(context);
              },
              color: AppColors.purple,
            ),
            verticalSpacer(12),
            customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),

            ...vm.emergencyContacts.asMap().entries.map((entry) {
              int index = entry.key;
              var controllers = entry.value;
              return Column(
                children: [
                  kidEmergencyContactDetail(
                    context: context,
                    authorized: (controllers["authorized"] ?? false) as bool,
                    onAuthorizedChanged: (value) => vm.toggleEmergencyAuthorized(index, value),
                    index: index+1,
                    listLength: vm.emergencyContacts.length,
                    onTap: (){
                      vm.removeEmergency(index);
                    },
                    phoneController: controllers["phone"]!,
                    nameController: controllers["name"]!,
                    relationshipController: controllers["relationship"]!,
                  ),

                  verticalSpacer(12),
                ],
              );
            }),
            if(vm.emergencyContacts.length<=5)
            customAddButton(
              title: "Add Emergency/Pickup Contact",
              onTap:(){
                vm.addEmergency(context);
              },
              color: AppColors.purple,
            ),
            customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),
            verticalSpacer(20),
          ],
        ),
      );
    },
  );
}

Widget kidParentContactDetail( {
  required BuildContext context,
  required int listLength,
  required int index,
  required bool authorized,
  required Function(bool) onAuthorizedChanged,
  required VoidCallback onTap,
  required TextEditingController nameController,
  required TextEditingController phoneController,
  required TextEditingController homePhoneController,
  required TextEditingController addressController,}){
  return  Container(
    padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 20.h),
    width: 382.w,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: AppColors.purple),
    ),
    child:Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment:listLength > 1? MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
        children: [
          SizedBox(),
          customText(text: "  Parent $index", fontWeight: FontWeight.w700, fontSize: 24, color:AppColors.purple),
          if( listLength > 1) GestureDetector(
            onTap: onTap,
            child: Container(
                height:32.h,
                width: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.redShade,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(child: SvgPicture.asset(AppImages.delete,height: 24.h,width: 24.w,fit: BoxFit.cover,))),
          ),
        ],
      ),
      verticalSpacer(12),
      verticalSpacer(20),
      customText(text: "Name *", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
      verticalSpacer(8),
      customTextField(
        controller: nameController,
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
      customText(text: "Phone Number *", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
      verticalSpacer(8),
      customTextField(
        controller: phoneController,
        height: 48,
        width: 390,
        isMinLine: 1,
        keyboardType: TextInputType.phone,
        hintText: "",
        borderRadius: 12,
        obscureText: false,
        isShow: false,
        onShow: () {

        },
        context: context,
      ),
      verticalSpacer(20),
      customText(text: "Home Number *", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
      verticalSpacer(8),
      customTextField(
        controller: homePhoneController,
        height: 48,
        width: 390,
        isMinLine: 1,
        keyboardType: TextInputType.phone,
        hintText: "",
        borderRadius: 12,
        obscureText: false,
        isShow: false,
        onShow: () {

        },
        context: context,
      ),
      verticalSpacer(20),
      customText(text: "Home Address *", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
      verticalSpacer(8),
      customTextField(
        controller: addressController,
        height: 48,
        width: 390,
        isMinLine: 1,
        keyboardType: TextInputType.text,
        hintText: "",
        borderRadius: 12,
        obscureText: false,
        isShow: false,
        onShow: () {

        },
        context: context,
      ),
      verticalSpacer(12),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            value: authorized,
            side: BorderSide(color: AppColors.purple, width: 2.w),
            activeColor: AppColors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: (value) {
              if (value != null) {
                onAuthorizedChanged(value);
              }
            },
          ),
          customText(text: "Authorized for pickup", fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),

        ],
      ),
    ],
  ),
);
}
Widget kidEmergencyContactDetail( {
  required int listLength,
  required int index,
  required VoidCallback onTap,
  required bool authorized,
  required Function(bool) onAuthorizedChanged,
  required BuildContext context,
  required TextEditingController nameController,
  required TextEditingController phoneController,
  required TextEditingController relationshipController}){
  bool isRememberMe=true;
  return  Container(
    padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 20.h),
    width: 382.w,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: AppColors.purple),
    ),
    child:Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      verticalSpacer(20),

      Row(
        mainAxisAlignment:listLength > 1? MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
        children: [
          SizedBox(),
          customText(text: "Emergency/Pickup $index", fontWeight: FontWeight.w700, fontSize: 24, color:AppColors.purple),
        if(listLength>1)
          GestureDetector(
            onTap: onTap,
            child: Container(
                height:32.h,
                width: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.redShade,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(child: SvgPicture.asset(AppImages.delete,height: 24.h,width: 24.w,fit: BoxFit.cover,))),
          ),
        ],
      ),
      verticalSpacer(12),
      customText(text: "Name *", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
      verticalSpacer(8),
      customTextField(
        controller: nameController,
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
      customText(text: "Phone Number *", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
      verticalSpacer(8),
      customTextField(
        controller: phoneController,
        height: 48,
        width: 390,
        isMinLine: 1,
        keyboardType: TextInputType.phone,
        hintText: "",
        borderRadius: 12,
        obscureText: false,
        isShow: false,
        onShow: () {

        },
        context: context,
      ),
      verticalSpacer(20),
      customText(text: "Relationship ", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
      verticalSpacer(8),
      customTextField(
        controller: relationshipController,
        height: 48,
        width: 390,
        isMinLine: 1,
        keyboardType: TextInputType.text,
        hintText: "",
        borderRadius: 12,
        obscureText: false,
        isShow: false,
        onShow: () {

        },
        context: context,
      ),
      verticalSpacer(12),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            value: authorized,
            side: BorderSide(color: AppColors.purple, width: 2.w),
            activeColor: AppColors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: (value) {
              if (value != null) {
                onAuthorizedChanged(value);
              }
            },
          ),

          customText(text: "Authorized for pickup", fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
          verticalSpacer(20)

        ],
      ),
        ],

  ),
);
}