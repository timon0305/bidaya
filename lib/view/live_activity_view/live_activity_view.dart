
import 'package:quizzo/export.dart';





class LiveActivitiesView extends StatelessWidget {
  const LiveActivitiesView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController dateController=TextEditingController(text: "01/08/2025");
    String? selectedClass;
    final items = [
      StepperItem(
        time: "8:00 AM",
        title: "🥞 Breakfast Time – Kids enjoyed pancakes with maple syrup 🍯🥛",
        description: "They also had a glass of milk for energy.",
        imageUrl: "https://picsum.photos/200/150?random=1",
        color: AppColors.blue,
        isNew: true,
      ),
      StepperItem(
        time: "9:30 AM",
        title: "🎨 Art Class – Finger painting fun 🎨🖌️",
        description: "Children expressed creativity using bright colors.",
        imageUrl: "https://picsum.photos/200/150?random=2",
        color: AppColors.amber,
        isNew: true,
      ),
      StepperItem(
        time: "10:15 AM",
        title: "📚 Storytelling Hour – The Very Hungry Caterpillar 🐛🍎",
        description: "Kids loved listening and interacting with the story.",
        imageUrl: "https://picsum.photos/200/150?random=3",
        color: AppColors.hotPink,
        isNew: true,
      ),
      StepperItem(
        time: "11:30 AM",
        title: "⚽ Outdoor Play – Fun in the playground 🌳🏃‍♂️",
        description: "Slides, swings, and running games kept kids active.",
        imageUrl: "https://picsum.photos/200/150?random=4",
        color: AppColors.pink,
        isNew: false,
      ),
      StepperItem(
        time: "1:00 PM",
        title: "🍲 Lunch Time – Pasta with vegetables 🍝🥦",
        description: "Nutritious meal with salad and fruit.",
        imageUrl: "https://picsum.photos/200/150?random=5",
        color: AppColors.darkTeal,
        isNew: false,
      ),
      StepperItem(
        time: "2:30 PM",
        title: "🛌 Nap Time – Resting peacefully 😴🧸",
        description: "Soft music helped the kids relax.",
        imageUrl: "https://picsum.photos/200/150?random=6",
        color: AppColors.purple,
        isNew: false,
      ),
    ];

    final auth = context.watch<AuthViewModel>();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));
    return Scaffold(

      appBar: customAppBar(title: "Live Activities"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              auth.userRole=="Admin"||auth.userRole=="Staff"?  Padding(
                padding:  EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customTextFieldSuffixIcon(
                      controller:dateController,
                      readOnly: false,
                      height: 55,
                      width: 186,
                      icon: AppImages.calenderSvg,
                      isMinLine: 1,
                      keyboardType: TextInputType.phone,
                      borderClr: Colors.transparent,
                      hintText: "",
                      fillColor: AppColors.bg,
                      hintFontSize: 16,
                      borderRadius: 12,
                      obscureText: false,
                      onShow: () {
                        selectDateBottomSheet(context,dateController);

                      },
                      context: context,
                    ),
                    verticalSpacer(12),
                    customDropdownField(
                      borderColor: Colors.transparent,
                      context: context,
                      hintText: "",
                      width: 186,
                      height: 55,
                      borderRadius: 12,
                      hintFontSize: 14,
                      iconPath: AppImages.dropArrow,
                      icon: AppImages.dropArrow,
                      items: ["Senior Classes", "Junior Class", "All Classes"],
                      value: selectedClass,
                      onChanged: (val) {
                        selectedClass = val ?? "";
                      },
                    ),
                  ],
                ),
              ):SizedBox.shrink(),
              verticalSpacer(18),
              customDivider(height: 1, width: 390, color: AppColors.lightestGreyShade),
              verticalSpacer(18),
              VerticalDottedStepper(
                items: items,
                lineColor: AppColors.blue,
                lineWidth: 4,


              ),
            ],
          ),
        ),
      ),
    );
  }
}
