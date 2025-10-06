
import 'package:quizzo/export.dart';
class SelectPaymentView extends StatefulWidget {
  const SelectPaymentView({super.key});

  @override
  State<SelectPaymentView> createState() => _SelectPaymentViewState();
}

class _SelectPaymentViewState extends State<SelectPaymentView> {
  String? selectedId;
  final options = <PaymentOption>[
    PaymentOption(
      id: 'whatsapp',
      title: 'WhatsApp',
      icon: AppImages.whatsapp,
    ),
    PaymentOption(
      id: 'card',
      title: 'Pay With Card',
      icon: AppImages.pay,
    ),
    PaymentOption(
      id: 'gplay',
      title: 'Google Play',
      icon: AppImages.playStore,
      
    ),
    PaymentOption(
      id: 'apple',
      title: 'Apple Store',
      icon: AppImages.appStore,
    
    ),
    PaymentOption(
      id: 'huawei',
      title: 'Huawei Store',
      icon: AppImages.huawei,
   
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: AppColors.purple,
      systemNavigationBarColor: AppColors.purple,
    ));
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.purple, Color(0xFF6C63FF)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),

                  ],
                ),
              ),
              verticalSpacer(12),
              customText(
                  text: "SELECT PAYMENT", fontWeight: FontWeight.w700, fontSize: 32, color: AppColors.white),
              verticalSpacer(16),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 18.w),
                  decoration:  BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    itemCount: options.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = options[index];
                      final selected = item.id == selectedId;
                      return paymentTile(
                        option: item,
                        selected: selected,
                        onTap: () => setState(() => selectedId = item.id),
                        theme: theme,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
        child: customButton(
          context: context,
          text: "CONFIRM PAYMENT",
          fontSize: 16,
          height: 58,
          width: 300,
          borderColor: Colors.transparent,
          bgColor: AppColors.forestGrey,
          overlayColor: AppColors.white,
          fontColor: AppColors.purple,
          borderRadius: 100,
          isCircular: true,
          fontWeight: FontWeight.w600,
          onPressed: () {
            Get.toNamed(AppRoutes.otp);
          },
        ),
      ),
    );
  }
}
Widget paymentTile({
required PaymentOption option,
required bool selected,
required VoidCallback onTap,
required ThemeData theme}){
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: selected ?  AppColors.purple.withValues(alpha: 0.05) : Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: selected ? AppColors.freshBlue : AppColors.lightestGreyShade,
          width: selected ? 2 : 1,
        ),

      ),
      child: Row(
        children: [
          Image.asset(option.icon,height: 56.h,width: 56.w,fit: BoxFit.cover,),
          const SizedBox(width: 12),
          Expanded(
            child: customText(text: option.title, fontWeight: FontWeight.w700, fontSize: 18, color: AppColors.blackShade),
          ),
          radioDot(checked: selected),
        ],
      ),
    ),
  );
}
Widget paymentTile2({
required PaymentOption option,
required bool selected,
required VoidCallback onTap,
}){
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 18.h),
      margin:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),

      decoration: BoxDecoration(
        color: selected ?  AppColors.purple.withValues(alpha: 0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: selected ? AppColors.freshBlue : AppColors.lightestGreyShade,
          width: selected ? 2 : 1,
        ),

      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: customText(text: option.title, fontWeight: FontWeight.w700, fontSize: 18, color: AppColors.blackShade),
          ),
          radioDot(checked: selected),
        ],
      ),
    ),
  );
}

Widget radioDot({required bool checked}){
  return AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    width: 24,
    height: 24,
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: AppColors.purple,
        width: 2,
      ),
    ),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: checked ? const Color(0xFF6C63FF) : Colors.transparent,
      ),
    ),
  );
}

class PaymentOption {
  final String id;
  final String title;
  final String icon;
  const PaymentOption({
    required this.id,
    required this.title,
    required this.icon,
 
  });
}
