import 'package:quizzo/export.dart';

import '../../models/logged_user_model.dart';

class AuthViewModel extends ChangeNotifier {
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

  String accountType = "";
  final Set<String> selectedCategories = {};
  final PageController controller = PageController();
  int currentStep = 0;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController nurseryNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();

  String otpControllers = "";
  bool showPassword = true;
  bool showConfirmPassword = true;
  String? selectedGender;
  String? selectedCity;
  String? selectedCountry;
  bool isinfoContinueLoader = false;

  void nextStep() {
    if (accountType == "Nursery Owner") {
      if (currentStep < 5) _animateToStep(currentStep + 1);
    } else {
      if (currentStep < 4) _animateToStep(currentStep + 1);
    }
  }

  void backStep() {
    if (currentStep > 0) _animateToStep(currentStep - 1, forward: false);
  }

  void _animateToStep(int step, {bool forward = true}) {
    currentStep = step;
    if (forward) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    notifyListeners();
  }

  void updateAccountType(String type) {
    accountType = type;
    nextStep();
  }

  void changeGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  void onToggleChip(String category, bool isSelected) {
    if (isSelected) {
      selectedCategories.add(category);
    } else {
      selectedCategories.remove(category);
    }
    notifyListeners();
  }

  File? nurseryLogo;

  Future<void> pickNurseryLogo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      nurseryLogo = File(image.path);
      notifyListeners();
    }
  }

  void showHidePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void showHideConfirmPasswordVisibility() {
    showConfirmPassword = !showConfirmPassword;
    notifyListeners();
  }

  Future<void> basicInfoButtonProceed() async {
    try {
      isinfoContinueLoader = true;
      notifyListeners();
      AuthValidationService.validateName(nameController.text);
      AuthValidationService.validatePhone(phoneController.text);
      AuthValidationService.validateDob(dobController.text);
      AuthValidationService.validateGender(selectedGender);
      await Future.delayed(const Duration(seconds: 2));
      nextStep();
    } on ValidationException catch (e) {
      snackBar(
        title: "Error",
        subTitle: e.message.toString(),
        bgColor: AppColors.redShade,
      );
    } catch (e) {
      isinfoContinueLoader = false;
      notifyListeners();
    } finally {
      isinfoContinueLoader = false;
      notifyListeners();
    }
  }

  Future<void> setPassword() async {
    try {
      AuthValidationService.validatePassword(passwordTextController.text);
      AuthValidationService.validatePassword(
        confirmPasswordTextController.text,
      );
      AuthValidationService.validatePasswordMatch(
        passwordTextController.text,
        confirmPasswordTextController.text,
      );
      checkDuplicatePhone(phoneController.text);
    } on ValidationException catch (e) {
      snackBar(
        title: "Error",
        subTitle: e.message.toString(),
        bgColor: AppColors.redShade,
      );
    }
  }

  Future<void> createAccount(BuildContext context) async {
    try {
      AuthValidationService.isValidOtp(otpControllers);
      handleSignup(
        context: context,
        name: nameController.text,
        phone: phoneController.text.trim(),
        password: confirmPasswordTextController.text,
        role: accountType,
        gender: selectedGender ?? "",
        dob: dobController.text,
        otp: otpControllers,
      );
    } on ValidationException catch (e) {
      snackBar(
        title: "Error",
        subTitle: e.message.toString(),
        bgColor: AppColors.redShade,
      );
    }
  }

  bool isCheckPhone = false;

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
        if (isDuplicate) {
          snackBar(
            title: "Error",
            subTitle: "Phone number already exists",
            bgColor: AppColors.redShade,
          );
          return true;
        } else {
          snackBar(
            title: "Success",
            subTitle: "Now verify your phone number",
            bgColor: AppColors.green,
          );
          nextStep();
          return false;
        }
      }
      return true;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return true;
    } finally {
      isCheckPhone = false;
      notifyListeners();
    }
  }

  Future<bool> sendOtp(String phone, String otp) async {
    try {
      final res = await SupaBaseService.generalEdgeFunction(
        functionName: "send-sms",
        body: {"phone": "2$phone", "otp": otp, "purpose": "signup"},
      );
      if (res?.status == 200) {
        final data = res!.data;
        final success = data['success'] ?? false;
        if (!success) {
          snackBar(
            title: "OTP Error",
            subTitle: data['message'] ?? "Unknown error",
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
              subTitle: decoded['error']?['msg'] ?? "SMS sending failed",
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
      Get.snackbar("Error", e.toString());
      return false;
    }
  }

  bool isCreatingUser = false;

  Future<bool> createUser(
    BuildContext context,
    Map<String, dynamic> userData,
  ) async {
    try {
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
        return true;
      }
      snackBar(
        title: "Error",
        subTitle: res?.data?['error'] ?? "Signup failed",
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
    } finally {
      isCreatingUser = false;
      notifyListeners();
    }
  }

  Future<void> handleSignup({
    required BuildContext context,
    required String name,
    required String phone,
    required String password,
    required String role,
    required String gender,
    required String dob,
    required String otp,
  }) async {
    final otpSent = await sendOtp(phone, otp);
    if (!otpSent) return;
    if (accountType == "Parent") {
      final userData = {
        "name": name,
        "phone": phone,
        "password": password,
        "role":
            role == "Teacher"
                ? "teacher"
                : role == "Parent"
                ? "parent"
                : role,
        "gender": gender,
        "dateOfBirth": dob,
      };

      if (context.mounted) {
        final created = await createUser(context, userData);
        if (created) Get.offAllNamed(AppRoutes.host);
      }
    } else if (accountType == "Teacher") {
    } else {
      createNurseryAdmin(
        adminData: {},
        nurseryData: {},
        logoFile: File(""),
        subscriptionInfo: {},
      );
    }
  }

  Future<bool> createNurseryAdmin({
    required Map<String, dynamic> nurseryData,
    required Map<String, dynamic> adminData,
    required Map<String, dynamic> subscriptionInfo,
    required File logoFile,
  }) async {
    final success = await SupaBaseService.multipartEdgeFunction(
      functionName: "create-nursery-admin",
      fields: {
        "nurseryData": nurseryData,
        "adminData": adminData,
        "subscriptionInfo": subscriptionInfo,
      },
      filePath: logoFile.path,
      fileFieldName: "logoFile",
      mimeType: "png",
    );

    return success;
  }

  // ================= LOGIN =================
  bool showLoginPassword = true;
  String userRole = "Admin";
  bool isRememberMe = true;
  final TextEditingController loginPhoneTextController =
      TextEditingController();
  final TextEditingController loginPasswordTextController =
      TextEditingController();

  void showHideLoginPasswordVisibility() {
    showLoginPassword = !showLoginPassword;
    notifyListeners();
  }

  void isRememberMeValue(bool value) {
    isRememberMe = value;
    notifyListeners();
  }

  LoggedUserModel loggedUser = LoggedUserModel();
  bool isLoginLoading = false;

  Future<void> handleSignIn(String phone, String password) async {
    try {
      isLoginLoading = true;
      notifyListeners();
      final response = await SupaBaseService.generalEdgeFunction(
        functionName: "phone-login",
        body: {"phone": phone, "password": password},
      );
      final data = response!.data;
      if (response.status == 200) {
        loggedUser = LoggedUserModel.fromJson(response.data);
        final userMeta = loggedUser.user?.userMetadata;
        final session = loggedUser.session;
        AppConstant.role = userMeta?.name ?? "";
        AppConstant.name = userMeta?.fullName ?? "";
        AppConstant.token = session?.accessToken ?? "";
        snackBar(
          title: "${AppConstant.name} Logged In",
          subTitle: "Role : ${AppConstant.role}",
          bgColor: AppColors.green,
        );
        Get.offAllNamed(AppRoutes.host);
      } else {
        snackBar(
          title: "Error",
          subTitle: data['message'] ?? "Sign in failed",
          bgColor: AppColors.redShade,
        );
      }
    } catch (e) {
      snackBar(
        title: "Error",
        subTitle: "Login Error: $e",
        bgColor: AppColors.redShade,
      );
      debugPrint("Login Error: $e");
    } finally {
      isLoginLoading = false;
      notifyListeners();
    }
  }

  void updateUserRole(String role) {
    userRole = role;
    Get.toNamed(AppRoutes.host);
    notifyListeners();
  }

  // ================= FORGOT PASSWORD =================
  String sendOtpControllers = "";
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController newPasswordTextController =
      TextEditingController();
  final TextEditingController newConfirmPasswordTextController =
      TextEditingController();

  bool showNewPassword = true;
  bool showNewConfirmPassword = true;

  void showHideNewPasswordVisibility() {
    showNewPassword = !showNewPassword;
    notifyListeners();
  }

  void showHideNewConfirmPasswordVisibility() {
    showNewConfirmPassword = !showNewConfirmPassword;
    notifyListeners();
  }

  String email = "";
  bool isVerifyPhoneLoader = false;

  Future<void> handleForgotPassword({required String phoneNumber}) async {
    try {
      isVerifyPhoneLoader = true;
      notifyListeners();
      final response = await SupaBaseService.generalEdgeFunction(
        functionName: "get-user-email",
        query: {"phone": phoneNumber},
      );
      if (response == null) {
        snackBar(
          title: "Error",
          subTitle: "No response from server",
          bgColor: AppColors.redShade,
        );
        return;
      }
      final data = response.data ?? {};
      email = response.data["email"];
      if (response.status == 200) {
        snackBar(
          title: "Success",
          subTitle: data['message'] ?? "OTP sent successfully",
          bgColor: AppColors.green,
        );
        Get.to(() => OtpView(phoneNumber: phoneNumber));
      } else {
        snackBar(
          title: "Error",
          subTitle: data['message'] ?? "Failed to send reset email",
          bgColor: AppColors.redShade,
        );
      }
    } catch (e) {
      snackBar(
        title: "Error",
        subTitle: "Forgot Password Error: $e",
        bgColor: AppColors.redShade,
      );
    } finally {
      isVerifyPhoneLoader = false;
      notifyListeners();
    }
  }

  Future<bool> sendOtpForgotPassword(String phone, String otp) async {
    try {
      final res = await SupaBaseService.generalEdgeFunction(
        functionName: "send-sms",
        body: {"phone": phone, "otp": "248022", "purpose": "password_reset"},
      );
      if (res?.status == 200) {
        final data = res!.data;
        final success = data['success'] ?? false;
        if (!success) {
          snackBar(
            title: "OTP Error",
            subTitle: data['message'] ?? "Unknown error",
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
              subTitle: decoded['error']?['msg'] ?? "SMS sending failed",
              bgColor: AppColors.redShade,
            );
            return false;
          }
        }
        Get.to(AppRoutes.setPassword);
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

  Future<void> handleSetPassword({required String password}) async {
    try {
      final response = await SupaBaseService.generalEdgeFunction(
        functionName: "update-user-password",
        body: {"email": email, "password": password},
      );
      if (response == null) {
        snackBar(
          title: "Error",
          subTitle: "No response from server",
          bgColor: AppColors.redShade,
        );
        return;
      }
      final data = response.data ?? {};
      if (response.status == 200) {
        snackBar(
          title: "Success",
          subTitle: data['message'] ?? "Password updated successfully",
          bgColor: AppColors.green,
        );
        Get.offAllNamed(AppRoutes.login);
      } else {
        snackBar(
          title: "Error",
          subTitle: data['message'] ?? "Failed to update password",
          bgColor: AppColors.redShade,
        );
      }
    } catch (e) {
      snackBar(
        title: "Error",
        subTitle: "Set Password Error: $e",
        bgColor: AppColors.redShade,
      );
      debugPrint("Set Password Error: $e");
    }
  }

  @override
  void dispose() {
    controller.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
    dobController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    loginPhoneTextController.dispose();
    loginPasswordTextController.dispose();
    phoneNumberController.dispose();
    newPasswordTextController.dispose();
    newConfirmPasswordTextController.dispose();
    super.dispose();
  }
}
