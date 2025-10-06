import 'package:quizzo/export.dart';

class PaymentSettingView extends StatelessWidget {
  const PaymentSettingView({super.key});
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
      appBar: customAppBar(title: "Payment Options"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 350.w,
                child: customText(
                  text:
                      "How you would like to be paid. These will be the payment options shown to the parents when they pay for their kids fees.",
                  fontSize: 14,
                  color: AppColors.blackShade,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpacer(12),
              GestureDetector(
                onTap: () {
                  addPaymentAccountDetails(context, "Vodafone Cash");
                },
                child: Image.asset(
                  AppImages.vodafone,
                  width: 382.w,
                  height: 120.h,
                ),
              ),
              verticalSpacer(12),
              GestureDetector(
                onTap: () {
                  addPaymentAccountDetails(context, "Orange Cash");
                },
                child: Image.asset(
                  AppImages.orange,
                  width: 382.w,
                  height: 120.h,
                ),
              ),
              verticalSpacer(12),
              GestureDetector(
                onTap: () {
                  addPaymentAccountDetails(context, "Insta");
                },
                child: Image.asset(
                  AppImages.instaPay,
                  width: 382.w,
                  height: 120.h,
                ),
              ),
              verticalSpacer(12),
              GestureDetector(
                onTap: () {
                  addPaymentAccountDetails(context, "Etisalat Cash");
                },
                child: Image.asset(
                  AppImages.etisalat,
                  width: 382.w,
                  height: 120.h,
                ),
              ),
              verticalSpacer(8),
            ],
          ),
        ),
      ),
    );
  }
}
