

import 'package:quizzo/export.dart';
import 'package:quizzo/view/plan_view/widgets/expanded_tile.dart';

import 'add_new_plan.dart';
class PlanView extends StatefulWidget {
  const PlanView({super.key});

  @override
  State<PlanView> createState() => _PlanViewState();
}

class _PlanViewState extends State<PlanView>  {
  String? selectedGender;
  final List<CorrectedItem> correctedSheet = [
    CorrectedItem(question: 'WEEK 1 - 🔢 Math Basics', answer: 'Flutter widgets are the basic building blocks of the UI.'),
    CorrectedItem(question: 'WEEK 2 - 🎨 Arts & Crafts', answer: 'A StatefulWidget is a widget that has mutable state.'),
    CorrectedItem(question: 'WEEK  3 - 📖 Literacy Skills', answer: 'Stateless widgets are immutable, while stateful widgets can rebuild with changes.'),
    CorrectedItem(question: 'WEEK  4 - 🤸 Physical Play', answer: 'Provider is a state management library in Flutter.'),
    CorrectedItem(question: 'WEEK 5 - 🎵 Music & Rhythm', answer: 'Provider is a state management library in Flutter.'),
  ];

  List<String> attendanceUserList= ["Kids", "Staff"];

  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));
    return Scaffold(
      appBar: customAppBar(title: "Plans"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalSpacer(12),
            customAddButton(title: "Add New Plan",
                onTap: () {
              Get.to(()=>AddNewPlan());
                },
                color: AppColors.purple),
            verticalSpacer(12),
            customDropdownField(
              borderColor: Colors.transparent,
              context: context,
              hintText: "",
              width: 390,
              borderRadius: 16,
              hintFontSize: 16,
              iconPath: AppImages.dropArrow,
              icon: AppImages.dropArrow,
              items: ["Senior Classes", "Junior Class","All Classes"],
              value:  selectedGender,
              onChanged: (val) {

                selectedGender = val??"";

              },
            ),
            verticalSpacer(12),
          ReorderableListView.builder(
            shrinkWrap: true,
            itemCount: correctedSheet.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) newIndex--;
                final item = correctedSheet.removeAt(oldIndex);
                correctedSheet.insert(newIndex, item);
              });
            },
            itemBuilder: (context, index) {
              final item = correctedSheet[index];
              return CustomExpansionTile(
                label:item.question ,
                  key: ValueKey(correctedSheet[index]),
                index: (index + 1).toString(),
                children: [
                  customDivider(height: 1, width: 380, color: AppColors.lightestGreyShade),
                  Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: customText(text: item.answer, fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.blackShade)
                  ),
                ],
              );
            },
          ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 100.h,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpacer(10),
              customDivider(height: 1.5, width: 432, color: AppColors.lightestGreyShade),
              verticalSpacer(10),
              customButton(
                context: context,
                text: "Save Plan",
                fontSize: 16,
                height: 58,
                width: 390,
                borderColor: Colors.transparent,
                bgColor: AppColors.blue,
                fontColor: Colors.white,
                borderRadius: 100,
                isCircular: true,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  Get.toNamed(AppRoutes.setPassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  class CorrectedItem {
  final String question;
  final String answer;

  CorrectedItem({required this.question, required this.answer});
  }
