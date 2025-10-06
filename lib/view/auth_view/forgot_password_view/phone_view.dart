

import 'package:quizzo/export.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(

          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.white,
          extendBodyBehindAppBar: true,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: SingleChildScrollView(
                child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.back();
                              },
                            child: Icon(
                              Icons.arrow_back
                            ),
                          ),
                          verticalSpacer(20),
                          customText(text: "Forgot Password 🔑", fontWeight: FontWeight.w700, fontSize: 32, color: AppColors.blackShade),
                          verticalSpacer(20),
                          customText(text: "Enter your phone number to get an OTP code to reset your password.", fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black),
                          verticalSpacer(20),
                          customText(text: "Phone Number", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
                          verticalSpacer(8),
                          Consumer<AuthViewModel>(
                              builder: (context, auth, child) {
                              return customTextField(
                                controller:auth.phoneNumberController ,
                                height: 48,
                                width: 390,
                                isMinLine: 1,
                                keyboardType: TextInputType.phone,
                                hintText: "Enter your phone number",
                                borderRadius: 12,
                                obscureText: false,
                                isShow: false,
                                onShow: () {},
                                context: context,
                              );
                            }
                          ),
                          verticalSpacer(20),
                         ]

              ),
            ),
          ),
        ),
          bottomNavigationBar: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 18.w,vertical: 20.h),
            child:  Consumer<AuthViewModel>(
                builder: (context, auth, child) {
                return customButton(
                  context: context,
                  text: "Continue",
                  fontSize: 16,
                  height: 58,
                  width: 300,
                  borderColor: Colors.transparent,
                  bgColor: AppColors.blue,
                  fontColor: Colors.white,
                  borderRadius: 100,
                  isCircular: true,
                  isLoading: auth.isVerifyPhoneLoader,
                  fontWeight: FontWeight.w600,
                  onPressed: () {

                    try {
                      AuthValidationService.validatePhone(auth.phoneNumberController.text);
                      auth.handleForgotPassword(phoneNumber: auth.phoneNumberController.text.trim());
                    }
                    on ValidationException catch (e) {
                    snackBar(title: "Error", subTitle:  e.message.toString(), bgColor: AppColors.redShade);
                    }

                   },
                );
              }
            ),
          ),
        ),
    );
  }
}