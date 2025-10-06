
import 'package:quizzo/export.dart';
class SettingNurseryInfoView extends StatefulWidget {
  const SettingNurseryInfoView({super.key});

  @override
  State<SettingNurseryInfoView> createState() => _SettingNurseryInfoViewState();
}

class _SettingNurseryInfoViewState extends State<SettingNurseryInfoView> {
  TextEditingController nameController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController fcebookController=TextEditingController();
  TextEditingController instaController=TextEditingController();
  TextEditingController whatsappController=TextEditingController();
  TextEditingController dobController=TextEditingController();
  String?selectedGender;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    addressController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {



    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: customAppBar(
        title: 'Nursery Info',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Center(
          child: Stack(
          children: [
            CircleAvatar(
            backgroundColor: AppColors.blue,
            radius: 82.r,
            child: CircleAvatar(
              radius: 80.r,
              backgroundImage: AssetImage(AppImages.avatarPng),
            ),
          ),


          Positioned(
            bottom: 0.h,
            right: 0.w,
            child: GestureDetector(
              onTap: () {

              },
              child: SvgPicture.asset(
                AppImages.editPen,
                height: 40.h,
                width: 40.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ],
        ),
      ),
        verticalSpacer(8),

              customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),
              verticalSpacer(20),
              customText(text: "Nursery Name *", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
              verticalSpacer(8),
              customTextField(
                controller: nameController,
                height: 48,
                width: 390,
                isMinLine: 1,
                keyboardType: TextInputType.text,
                hintText: "Enter your nursery name",
                borderRadius: 12,
                obscureText: false,
                isShow: false,
                onShow: () {},
                context: context,
              ),
              verticalSpacer(20),
              customText(text: "Nursery Phone Number", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
              verticalSpacer(8),
              customTextField(
                controller: phoneController,
                height: 48,
                width: 390,
                isMinLine: 1,
                keyboardType: TextInputType.phone,
                hintText: "Enter your nursery phone number",
                borderRadius: 12,
                obscureText: false,
                isShow: false,
                onShow: () {

                },
                context: context,
              ),
              verticalSpacer(20),
              customText(text: "Nursery Email", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
              verticalSpacer(8),
          customTextField(
            controller: emailController,
            height: 48,
            width: 390,
            isMinLine: 1,
            keyboardType: TextInputType.text,
            hintText: "Enter your nursery email",
            borderRadius: 12,
            obscureText: false,
            isShow: false,
            onShow: () {

            },
            context: context,
          ),
              verticalSpacer(20),
              customText(text: "Address *", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
              verticalSpacer(8),
              customTextField(
                controller: addressController,
                height: 48,
                width: 390,
                isMinLine: 1,
                keyboardType: TextInputType.text,
                hintText: "Enter your nursery address",
                borderRadius: 12,
                obscureText: false,
                isShow: false,
                onShow: () {

                },
                context: context,
              ),
             verticalSpacer(20),
              customText(text: "Facebook", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
              verticalSpacer(8),
              customTextField(
                controller: fcebookController,
                height: 48,
                width: 390,
                isMinLine: 1,
                keyboardType: TextInputType.text,
                hintText: "https://www.facebook.com/your-nursery",
                borderRadius: 12,
                obscureText: false,
                isShow: false,
                onShow: () {

                },
                context: context,
              ),verticalSpacer(20),
              customText(text: "Instagram", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
              verticalSpacer(8),
              customTextField(
                controller: instaController,
                height: 48,
                width: 390,
                isMinLine: 1,
                keyboardType: TextInputType.text,
                hintText: "https://www.instagram.com/nursery",
                borderRadius: 12,
                obscureText: false,
                isShow: false,
                onShow: () {

                },
                context: context,
              ),
              verticalSpacer(20),
              customText(text: "WhatsApp Number", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
              verticalSpacer(8),
              customTextField(
                controller: whatsappController,
                height: 48,
                width: 390,
                isMinLine: 1,
                keyboardType: TextInputType.phone,
                hintText: "01xxxxxxxxx",
                borderRadius: 12,
                obscureText: false,
                isShow: false,
                onShow: () {

                },
                context: context,
              ),
              verticalSpacer(20),
              customText(text: "Nursery Features", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
              verticalSpacer(8),

              Consumer<AuthViewModel>(
                  builder: (context, auth, child) {
                    return Container(
                      width: 390.w,
                      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.r),
                          color: AppColors.white,
                          border: Border.all(color: AppColors.forestGrey)
                      ),
                      child: Wrap(
                        spacing: 4.w,
                        runSpacing: 0.w,
                        children: addChoiceChips(context, auth.nurseryFeatures),
                      ),
                    );
                  }
              ),




            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 12.h),
        child: customButton(
          context: context,
          text: "Save Settings",
          fontSize: 16,
          height: 58,
          width: 300,
          borderColor: Colors.transparent,
          bgColor: AppColors.purple,
          fontColor: Colors.white,
          borderRadius: 100,
          isCircular: true,
          fontWeight: FontWeight.w600,
          onPressed: () {

          },
        ),
      ),
    );
  }
}
