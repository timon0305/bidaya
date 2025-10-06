import 'package:quizzo/export.dart';

class SignupViewModel extends ChangeNotifier {
  final PageController controller = PageController();
  int currentStep = 0;

  String accountType = "";
  String otpControllers = "";
  String? selectedGender;
  final Set<String> selectedCategories = {};

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();

  final nurseryNameController = TextEditingController();
  final nurseryEmailController = TextEditingController();
  final nurseryAddressController = TextEditingController();
  final nurseryPhoneController = TextEditingController();
  final List<String> nurseryFeatures = [
    "Meals",
    "Swimming Pools",
    "Buses",
    "Extra Working Hours",
    "Hosting",
    "Behavior Modification",
    "Montessori",
    "Quran",
    "Pass School Test",
    "Music",
    "Computers",
    "Doctor Visits",
    "Art",
  ];
  String? selectedCity, selectedCountry;

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String otp = "";
  File? nurseryLogo;
  bool isLoading = false;
  bool isNurseryLoading = false;
  bool isCheckPhone = false;
  bool isVerifyOtp = false;
  bool showPassword = true;
  bool isInfoContinueLoader = false;

  bool showConfirmPassword = true;
  bool isCreatingUser = false;

  Future<void> proceedBasicInfo(BuildContext context) async {
    try {
      isInfoContinueLoader = true;
      notifyListeners();

      AuthValidationService.validateName(nameController.text);
      AuthValidationService.validatePhone(phoneController.text);
      AuthValidationService.validateDob(dobController.text);
      AuthValidationService.validateGender(selectedGender);

      await Future.delayed(const Duration(seconds: 1));
      nextStep();
    } catch (e) {
      snackBar(title: "Error", subTitle: e.toString(), bgColor: Colors.red);
    } finally {
      isInfoContinueLoader = false;
      notifyListeners();
    }
  }

  Future<void> proceedNurseryInfo(BuildContext context) async {
    try {
      isNurseryLoading = true;
      notifyListeners();

      AuthValidationService.validateName(nurseryNameController.text);
      AuthValidationService.validateAddress(nurseryAddressController.text);
      AuthValidationService.validateCity(selectedGender);
      AuthValidationService.validateCountry(selectedGender);
      AuthValidationService.validatePhone(nurseryPhoneController.text);
      AuthValidationService.isValidEmail(nurseryEmailController.text);

      await Future.delayed(const Duration(seconds: 1));
      nextStep();
    } catch (e) {
      snackBar(title: "Error", subTitle: e.toString(), bgColor: Colors.red);
    } finally {
      isNurseryLoading = false;
      notifyListeners();
    }
  }

  Future<void> setPassword(BuildContext context) async {
    try {
      AuthValidationService.validatePassword(passwordController.text);
      AuthValidationService.validatePassword(confirmPasswordController.text);
      AuthValidationService.validatePasswordMatch(
        passwordController.text,
        confirmPasswordController.text,
      );

      await checkDuplicatePhone(phoneController.text);
      nextStep();
    } catch (e) {
      snackBar(title: "Error", subTitle: e.toString(), bgColor: Colors.red);
    }
  }

  Future<bool> checkDuplicatePhone(String phone) async {
    try {
      isCheckPhone = true;
      notifyListeners();
      final res = await SupaBaseService.generalEdgeFunction(
        functionName: "check-duplicate-phone",
        body: {"phone": phone, "currentUserId": "signup"},
      );
      if (res?.status == 200) {
        final isDuplicate = res!.data['duplicate'] ?? false;
        await sendOtp("2${phoneController.text}", AppConstant.otp);
        if (isDuplicate) {
          snackBar(
            title: "Error",
            subTitle: "Phone number already exists",
            bgColor: AppColors.redShade,
          );
          return true;
        }
        nextStep();
      }
      return true;
    } catch (e) {
      snackBar(
        title: "Error",
        subTitle: e.toString(),
        bgColor: AppColors.redShade,
      );
      isCheckPhone = false;
      notifyListeners();
      return true;
    } finally {
      isCheckPhone = false;
      notifyListeners();
    }
  }

  void updateAccountType(String type) {
    accountType = type;
    nextStep();
  }

  void changeGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  void updateOtp(String otp) {
    otpControllers = otp;
    notifyListeners();
  }

  void selectNurseryFeature(String category, bool isSelected) {
    isSelected
        ? selectedCategories.add(category)
        : selectedCategories.remove(category);
    notifyListeners();
  }

  Future<void> pickNurseryLogo() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      nurseryLogo = File(image.path);
      notifyListeners();
    }
  }

  void nextStep() {
    if (accountType == "Nursery Owner" && currentStep < 5) {
      _animateToStep(currentStep + 1);
    } else if (currentStep < 4) {
      _animateToStep(currentStep + 1);
    }
  }

  void backStep() {
    if (currentStep > 0) _animateToStep(currentStep - 1, forward: false);
  }

  void _animateToStep(int step, {bool forward = true}) {
    currentStep = step;
    controller.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void showHidePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void showHideConfirmPasswordVisibility() {
    showConfirmPassword = !showConfirmPassword;
    notifyListeners();
  }

  Future<void> createAccount({required BuildContext context}) async {
    try {
      if (accountType == "Parent") {
        final userData = {
          "name": nameController.text,
          "phone": phoneController.text,
          "password": passwordController.text,
          "role": "parent",
          "gender": selectedGender,
          "dateOfBirth": dobController.text,
        };

        isCreatingUser = true;
        notifyListeners();

        final res = await SupaBaseService.generalEdgeFunction(
          functionName: "create-user",
          body: userData,
        );

        if (res?.status == 200) {
          snackBar(
            title: "Success",
            subTitle: "Account created successfully",
            bgColor: AppColors.green,
          );

          if (context.mounted) {
            customMessagePopup(
              context,
              icon: AppImages.successProfile,
              title: "Successful!",
              subTitle: "Please wait a moment, we are preparing for you...",
              buttonTitle: "Go to Home",
              onButtonPressed: () {
                Get.toNamed(AppRoutes.login);
              },
            );
          }
        } else {
          snackBar(
            title: "Error",
            subTitle: res?.data?['error'] ?? "Signup failed",
            bgColor: AppColors.redShade,
          );
        }
      } else if (accountType == "Teacher") {
        /*    {"email":"teacher_01031536540@temp.bidayanursery.com",
    "password":"Aqsa@12345",
    "userData":{"name":"Aqsa Nazir","gender":"female","phone":"01031536540","birthdate":"2008-03-05"},"phone":"01031536540"}
  */
        final userData = {
          "email":
              "teacher_${phoneController.text.trim().toLowerCase()}@temp.bidayanursery.com",
          "password": passwordController.text,
          "userData": {
            "name": nameController.text,
            "gender": selectedGender,
            "phone": phoneController.text,
            "birthdate": dobController.text,
          },
          "phone": phoneController.text,
        };

        isCreatingUser = true;
        notifyListeners();
        final res = await SupaBaseService.generalEdgeFunction(
          functionName: "create-user",
          body: userData,
        );

        if (res?.status == 200) {
          snackBar(
            title: "Success",
            subTitle: "Teacher account created successfully",
            bgColor: AppColors.green,
          );
          if (context.mounted) Get.toNamed(AppRoutes.login);
        } else {
          snackBar(
            title: "Error",
            subTitle: res?.data?['error'] ?? "Signup failed",
            bgColor: AppColors.redShade,
          );
        }
      } else {
        /* final created = await createNurseryAdmin(
          adminData: {
            "name": name,
            "email": "admin_${phone}@temp.bidayanursery.com",
            "phone": phone,
            "password": password,
            "gender": gender,
          },
          nurseryData: {
            "name": "Codxis",
            "email": "naqsa122@gmail.com",
            "phone": "01031536541",
            "address": "abc city street 2 house 28",
            "latitude": null,
            "longitude": null,
            "features": ["Meals", "Behavior Modification", "Extra Working Hours"],
            "socialLinks": {
              "facebook": "https://facebook.com",
              "instagram": "https://instagram.com",
              "whatsapp": "01031536541",
            },
          },
          subscriptionInfo: {
            "planId": "1a0f947e-0663-4b0e-9d93-2d9dfcd2bc97",
          },
          logoFile: File("assets/images/shy.png"),
        );*/
      }
    } catch (e) {
      snackBar(
        title: "Error",
        subTitle: e.toString(),
        bgColor: AppColors.redShade,
      );
    } finally {
      isCreatingUser = false;
      notifyListeners();
    }
  }

  Future<bool> sendOtp(String phone, String otp) async {
    try {
      final res = await SupaBaseService.generalEdgeFunction(
        functionName: "send-sms",
        body: {"phone": phone, "otp": otp, "purpose": "signup"},
      );
      if (res?.status == 200) {
        final data = res!.data;
        final success = data['success'] ?? false;
        if (!success) {
          snackBar(
            title: "OTP Error",
            subTitle: data['message'] + phone ?? "Unknown error",
            bgColor: AppColors.redShade,
          );
          return false;
        }
        final providerResponse = data['response'];
        if (providerResponse is String) {
          final decoded = jsonDecode(providerResponse);
          if (decoded['type'] == 'error') {
            snackBar(
              title: "OTP Error",
              subTitle:
                  decoded['error']?['msg'] + phone ?? "SMS sending failed",
              bgColor: AppColors.redShade,
            );
            return false;
          }
        }
        return true;
      }
      snackBar(
        title: "Error",
        subTitle: res?.data?['error'] ?? "Failed to send OTP",
        bgColor: AppColors.redShade,
      );
      return false;
    } catch (e) {
      snackBar(
        title: "Error",
        subTitle: e.toString(),
        bgColor: AppColors.redShade,
      );
      return false;
    }
  }

  void clear() {
    nameController.clear();
    phoneController.clear();
    dobController.clear();

    nurseryNameController.clear();
    nurseryEmailController.clear();
    nurseryAddressController.clear();
    nurseryPhoneController.clear();

    passwordController.clear();
    confirmPasswordController.clear();

    accountType = "";
    selectedGender = null;
    selectedCity = null;
    selectedCountry = null;
    selectedCategories.clear();
    nurseryLogo = null;

    currentStep = 0;
    otp = "";

    isLoading = false;
    isNurseryLoading = false;
    isCheckPhone = false;

    //   controller.jumpToPage(0);

    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    nameController.dispose();
    nurseryNameController.dispose();
    nurseryNameController.dispose();
    nurseryAddressController.dispose();
    phoneController.dispose();
    dobController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
