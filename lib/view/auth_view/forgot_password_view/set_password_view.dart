import 'package:quizzo/export.dart';

class SetPasswordView extends StatelessWidget {
  const SetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.white,
        systemNavigationBarColor: AppColors.white,
      ),
    );
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
              child: Consumer<AuthViewModel>(
                builder: (context, auth, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      verticalSpacer(20),
                      customText(
                        text: "Create new password 🔐",
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: AppColors.blackShade,
                      ),
                      verticalSpacer(20),
                      customText(
                        text:
                            "Keep it safe so you won’t have to reset it again 🔄🙈",
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      verticalSpacer(20),
                      customText(
                        text: "Create a new password",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      verticalSpacer(4),
                      customTextFieldNoMultiLine(
                        controller: auth.newPasswordTextController,
                        height: 48,
                        width: 390,
                        isMinLine: 1,
                        keyboardType: TextInputType.text,
                        hintText: "",
                        borderRadius: 12,
                        obscureText: auth.showNewPassword,
                        isShow: true,
                        onShow: () {
                          auth.showHideNewPasswordVisibility();
                        },
                        context: context,
                      ),
                      verticalSpacer(20),
                      customText(
                        text: "Confirm a new password",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      verticalSpacer(4),
                      customTextFieldNoMultiLine(
                        controller: auth.newConfirmPasswordTextController,
                        height: 48,
                        width: 390,
                        isMinLine: 1,
                        keyboardType: TextInputType.text,
                        hintText: "",
                        borderRadius: 12,
                        obscureText: auth.showNewConfirmPassword,
                        isShow: true,
                        onShow: () {
                          auth.showHideNewConfirmPasswordVisibility();
                        },
                        context: context,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        bottomNavigationBar: Consumer<AuthViewModel>(
          builder: (context, auth, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
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
                  try {
                    AuthValidationService.validatePassword(
                      auth.newPasswordTextController.text,
                    );
                    AuthValidationService.validatePassword(
                      auth.newConfirmPasswordTextController.text,
                    );
                    AuthValidationService.validatePasswordMatch(
                      auth.newPasswordTextController.text,
                      auth.newConfirmPasswordTextController.text,
                    );
                    auth.handleSetPassword(
                      password: auth.newConfirmPasswordTextController.text,
                    );
                  } on ValidationException catch (e) {
                    snackBar(
                      title: "Error",
                      subTitle: e.message.toString(),
                      bgColor: AppColors.redShade,
                    );
                  }
                  customMessagePopup(
                    context,
                    icon: AppImages.done,
                    title: "Welcome Back!",
                    subTitle:
                        "You have successfully reset and created a new password.",
                    buttonTitle: "Go to Home",
                    onButtonPressed: () {
                      Get.toNamed(AppRoutes.host);
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
