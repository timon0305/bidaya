import 'package:quizzo/export.dart';
class OtpView extends StatelessWidget {
  final String phoneNumber;
  const OtpView({super.key, required this.phoneNumber});





  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));
    return  GestureDetector(
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
                    customText(text: "You’ve got a text! 📲", fontWeight: FontWeight.w700, fontSize: 32, color: AppColors.blackShade),
                    verticalSpacer(20),
                    customText(text: "We have sent the OTP verification code to your phone number. Check your phone and enter the code below.", fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black),
                    verticalSpacer(20),

                    Consumer<AuthViewModel>(
                        builder: (context, auth, child) {
                        return OtpTextField(

                            cursorColor: AppColors.purple,
                            mainAxisAlignment: MainAxisAlignment.center,
                            numberOfFields: 6,
                            fieldWidth: 47.w,
                            fieldHeight: 70.h,
                            contentPadding: EdgeInsets.zero,
                            obscureText: false,
                            fillColor: AppColors.purple.withValues(alpha: 0.02),
                            focusedBorderColor: AppColors.purple.withValues(alpha: 1),
                            showFieldAsBox: true,
                            borderWidth: 1.w,
                            borderRadius: BorderRadius.all(Radius.circular(16.r)),
                            filled: true,
                            textStyle: TextStyle(
                              color: AppColors.blackShade.withValues(alpha: 0.9),
                            ),
                            keyboardType: TextInputType.number,
                            onSubmit: (otp) {
                              auth.sendOtpControllers = otp;
                            });
                      }
                    ),
                    verticalSpacer(8),
                    Center(child: customText(text: "Didn't receive a text?", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black)),
                    verticalSpacer(8),
                    Center(child: customText(text: "You can resend code in 55 s", fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black)),
                    verticalSpacer(20),
                  ]

              ),
            ),
          ),
        ),
        bottomNavigationBar: Consumer<AuthViewModel>(
            builder: (context, auth, child) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 12.h),
              child: customButton(
                context: context,
                text: "Confirm",
                fontSize: 16,
                height: 58,
                width: 300,
                borderColor: Colors.transparent,
                bgColor: AppColors.blue,
                fontColor: Colors.white,
                borderRadius: 100,
                isCircular: true,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  print(phoneNumber);
                  print("phoneNumber");
                  AuthValidationService.isValidOtp(auth.sendOtpControllers);
                  auth.sendOtpForgotPassword(phoneNumber,auth.otpControllers);
                 // Get.toNamed(AppRoutes.setPassword);
                },
              ),
            );
          }
        ),
      ),
    );
  }
}
