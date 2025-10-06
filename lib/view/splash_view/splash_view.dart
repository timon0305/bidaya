import 'package:quizzo/export.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.login);
    });
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
      backgroundColor: AppColors.white,
      appBar: null,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AppImages.splashLogo,
              fit: BoxFit.contain,
              height: 354.h,
              width: 430.w,
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: SpinKitCircle(color: AppColors.purple, size: 55),
            ),
          ),
        ],
      ),
    );
  }
}
