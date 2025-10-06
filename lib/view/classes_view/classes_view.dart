
import 'package:quizzo/export.dart';
class ClassesView extends StatefulWidget {
  const ClassesView({super.key});

  @override
  State<ClassesView> createState() => _ClassesViewState();
}

class _ClassesViewState extends State<ClassesView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));
    return Scaffold(
      appBar: customAppBar(title: "Manage Classes"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpacer(10),
              Center(
                child: customAddButton(title: "Add New Class",
                    onTap: () {},
                    color: AppColors.purple),
              ),
              verticalSpacer(20),
              Center(child: customDivider(height: 1.5, width: 390, color: AppColors.lightestGreyShade)),
              verticalSpacer(20),
              Row(
                children: [
                  customText(
                      text: " Classes",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.blackShade),
          
                  horizontalSpacer(4),
                  customText(
                      text: "(4)",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.freshBlue),
                ],
              ),
          
              verticalSpacer(10),
              classesCard("Baby", "Number of kids: 9"),
              classesCard("Junior", "Number of kids: 13"),
              classesCard("Senior", "Number of kids: 5"),
              classesCard("PreSchool", "Number of kids: 12"),
              verticalSpacer(20),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
