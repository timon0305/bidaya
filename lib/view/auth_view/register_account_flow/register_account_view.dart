import 'package:quizzo/export.dart';

class RegisterFlowView extends StatefulWidget {
  const RegisterFlowView({super.key});

  @override
  State<RegisterFlowView> createState() => _RegisterFlowViewState();
}

class _RegisterFlowViewState extends State<RegisterFlowView> {
  SignupViewModel? svm;

  @override
  void initState() {
    svm = Provider.of<SignupViewModel>(context, listen: false);
    svm?.clear();
    super.initState();
  }

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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Consumer<SignupViewModel>(
          builder: (context, auth, child) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (auth.currentStep == 0) {
                            Get.back();
                          } else {
                            auth.backStep();
                          }
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      horizontalSpacer(12),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 60.w,
                            vertical: 10.h,
                          ),
                          child: LinearProgressIndicator(
                            value:
                                auth.accountType == "Nursery Owner"
                                    ? (auth.currentStep + 1) / 5
                                    : (auth.currentStep + 1) / 4,
                            backgroundColor: AppColors.lightestGreyShade,
                            color: AppColors.purple,
                            minHeight: 12,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child:
                      (auth.accountType == "Nursery Owner")
                          ? PageView(
                            controller: auth.controller,

                            children: [
                              selectAccountCard(),
                              infoCard(
                                context: context,
                                nameController: auth.nameController,
                                phoneController: auth.phoneController,
                                selectedGender: auth.selectedGender ?? "Select",
                                dobController: auth.dobController,
                                onGenderChanged: (value) {
                                  auth.changeGender(value);
                                },
                              ),
                              setPassword(
                                context: context,
                                showPassword: auth.showPassword,
                                showConfirmPassword: auth.showConfirmPassword,
                                confirmPasswordTextController:
                                    auth.confirmPasswordController,
                                passwordTextController: auth.passwordController,
                                phoneController: auth.phoneController,
                                dobController: auth.dobController,
                              ),

                              aboutNursery(
                                context: context,
                                nameController: auth.nurseryNameController,
                                emailController: auth.nurseryEmailController,
                                addressController:
                                    auth.nurseryAddressController,
                                selectedCity: auth.selectedCity ?? "",
                                selectedCountry: auth.selectedCountry ?? "",
                              ),
                              otpView(
                                context,
                                otpControllers: auth.otpControllers,
                              ),
                            ],
                          )
                          : PageView(
                            controller: auth.controller,

                            children: [
                              selectAccountCard(),
                              infoCard(
                                context: context,
                                nameController: auth.nameController,
                                phoneController: auth.phoneController,
                                selectedGender: auth.selectedGender ?? "Select",
                                dobController: auth.dobController,
                                onGenderChanged: (value) {
                                  auth.changeGender(value);
                                },
                              ),
                              setPassword(
                                context: context,
                                showPassword: auth.showPassword,
                                showConfirmPassword: auth.showConfirmPassword,
                                confirmPasswordTextController:
                                    auth.confirmPasswordController,
                                passwordTextController: auth.passwordController,
                                phoneController: auth.phoneController,
                                dobController: auth.dobController,
                              ),
                              otpView(
                                context,
                                otpControllers: auth.otpControllers,
                              ),
                            ],
                          ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Consumer<SignupViewModel>(
        builder: (context, vm, child) {
          return vm.currentStep >= 1
              ? Padding(
                padding: EdgeInsets.only(
                  left: 18.w,
                  bottom: 30.h,
                  top: 10.h,
                  right: 18.w,
                ),
                child: customButton(
                  context: context,
                  text: "Continue",
                  fontSize: 16,
                  height: 58,
                  width: 382,
                  borderColor: Colors.transparent,
                  bgColor: AppColors.purple,
                  fontColor: Colors.white,
                  borderRadius: 100,
                  isCircular: true,
                  isLoading:
                      vm.currentStep == 1
                          ? vm.isInfoContinueLoader
                          : vm.currentStep == 2
                          ? vm.isCheckPhone
                          : vm.currentStep == 3
                          ? vm.isCreatingUser
                          : false,

                  fontWeight: FontWeight.w600,
                  onPressed: () {
                    // dynamic last index
                    final lastStepIndex =
                        vm.accountType == "Nursery Owner" ? 4 : 3;

                    if (vm.currentStep == 1) {
                      vm.proceedBasicInfo(context);
                    } else if (vm.currentStep == 2) {
                      vm.setPassword(context);
                    } else if (vm.currentStep == 3) {
                      if (AppConstant.otp == vm.otpControllers) {
                        vm.createAccount(context: context);
                      } else {
                        snackBar(
                          title: "Error",
                          subTitle: "Invalid OTP",
                          bgColor: AppColors.redShade,
                        );
                      }
                    } else if (vm.currentStep == 4) {
                      if (AppConstant.otp == vm.otpControllers) {
                        vm.createAccount(context: context);
                      } else {
                        snackBar(
                          title: "Error",
                          subTitle: "Invalid OTP",
                          bgColor: AppColors.redShade,
                        );
                      }
                    }
                  },
                ),
              )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
