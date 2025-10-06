import 'package:quizzo/export.dart';
import 'package:quizzo/view/plan_view/widgets/expanded_tile.dart';

class AddNewPlan extends StatefulWidget {
  const AddNewPlan({super.key});

  @override
  State<AddNewPlan> createState() => _AddNewPlanState();
}

class _AddNewPlanState extends State<AddNewPlan> {
  String? selectedClass = "Senior Class";
  List<SectionItem> sections = [
    SectionItem(title: "Math Basic", description: "Lorem ipsum dolor sit amet..."),
    SectionItem(title: "Science Advanced", description: "Physics and Chemistry basics."),
  ];

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            customDropdownField(
              borderColor: Colors.transparent,
              context: context,
              hintText: "",
              width: 390,
              borderRadius: 16,
              hintFontSize: 16,
              iconPath: AppImages.dropArrow,
              icon: AppImages.dropArrow,
              items: ["Senior Class", "Junior Class", "All Classes"],
              value: selectedClass,
              onChanged: (val) => setState(() => selectedClass = val),
            ),
            verticalSpacer(12),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sections.length,
              itemBuilder: (context, index) {
                final section = sections[index];

                return CustomExpansionTile(
                  label: section.title.isNotEmpty
                      ? section.title
                      : "",
                  index: (index + 1).toString(),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        children: [
                          customTextField(
                            context: context,
                            controller:
                            TextEditingController(text: section.title),
                            hintText: "Section Title",
                            width: 390,
                            onChanged: (val) =>
                                setState(() => section.title = val),
                            borderRadius: 0,
                            obscureText: false,
                            isShow: false,
                            onShow: () {},
                          ),
                          verticalSpacer(8),
                          customTextField(
                            context: context,
                            controller: TextEditingController(
                                text: section.description),
                            hintText: "Description",
                            width: 390,
                            onChanged: (val) =>
                                setState(() => section.description = val),
                            borderRadius: 0,
                            obscureText: false,
                            isShow: false,
                            onShow: () {},
                          ),
                          verticalSpacer(8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(Icons.delete,
                                  color: AppColors.red, size: 22),
                              onPressed: () {
                                setState(() => sections.removeAt(index));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),

            /// Add new section button
            customAddButton(
              title: "Add New Section",
              onTap: () {
                setState(() {
                  sections.add(SectionItem(title: "", description: ""));
                });
              },
              color: AppColors.purple,
            ),
          ],
        ),
      ),

      /// Bottom Save Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 100.h,
          child: Column(
            children: [
              verticalSpacer(10),
              customDivider(
                  height: 1.5, width: 432, color: AppColors.lightestGreyShade),
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
                  debugPrint(
                      "Saved Sections: ${sections.map((e) => e.toJson()).toList()}");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Section model
class SectionItem {
  String title;
  String description;

  SectionItem({required this.title, required this.description});

  Map<String, String> toJson() => {
    "title": title,
    "description": description,
  };
}
