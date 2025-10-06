import 'package:quizzo/export.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(90),
              Image.asset(AppImages.logo, fit: BoxFit.fill, height: 115.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Consumer<AuthViewModel>(
                  builder: (context, auth, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(20),
                        customText(
                          text: "Hello there 👋",
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          color: AppColors.blackShade,
                        ),
                        verticalSpacer(20),
                        customText(
                          text: "Phone Number",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        verticalSpacer(8),
                        customTextField(
                          controller: auth.loginPhoneTextController,
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
                        ),
                        verticalSpacer(20),
                        customText(
                          text: "Password",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        verticalSpacer(8),
                        customTextFieldNoMultiLine(
                          controller: auth.loginPasswordTextController,
                          height: 48,
                          width: 390,
                          isMinLine: 1,
                          keyboardType: TextInputType.text,
                          hintText: "Enter your password",
                          borderRadius: 12,
                          obscureText: auth.showLoginPassword,
                          isShow: true,
                          onShow: () {
                            auth.showHideLoginPasswordVisibility();
                          },
                          context: context,
                        ),
                        verticalSpacer(24),
                        Row(
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
                              text: "Remember me",
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        verticalSpacer(20),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.password);
                            },
                            child: customText(
                              text: "Forgot Password?",
                              textAlign: TextAlign.center,

                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.purple,
                            ),
                          ),
                        ),
                        verticalSpacer(8),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.register);
                            },
                            child: customText(
                              text: "Create New Account",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.purple,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer<AuthViewModel>(
        builder: (context, auth, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            child: customButton(
              context: context,
              text: "Sign in",
              fontSize: 16,
              height: 58,
              width: 300,
              borderColor: Colors.transparent,
              bgColor: AppColors.blue,
              fontColor: Colors.white,
              borderRadius: 100,
              isCircular: true,
              fontWeight: FontWeight.w600,
              isLoading: auth.isLoginLoading,
              onPressed: () {
                try {
                  auth.handleSignIn(
                    auth.loginPhoneTextController.text.trim(),
                    auth.loginPasswordTextController.text.trim(),
                  );
                } on ValidationException catch (e) {
                  snackBar(
                    title: "Error",
                    subTitle: e.message.toString(),
                    bgColor: AppColors.redShade,
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
