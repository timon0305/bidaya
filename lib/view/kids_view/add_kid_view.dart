import 'package:quizzo/export.dart';
import 'package:quizzo/view/kids_view/widgets/kid_info_card.dart';

class AddKidView extends StatefulWidget {
  final bool isEdit;

  const AddKidView({super.key, this.isEdit = false});

  @override
  State<AddKidView> createState() => _AddKidViewState();
}

class _AddKidViewState extends State<AddKidView>
    with SingleTickerProviderStateMixin {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactPhoneController = TextEditingController();
  TextEditingController emergencyNameController = TextEditingController();
  TextEditingController emergencyPhoneController = TextEditingController();
  TextEditingController allergyController = TextEditingController();
  TextEditingController medicineController = TextEditingController();
  TextEditingController contactAddressController = TextEditingController();
  TextEditingController contactHomeController = TextEditingController();
  TextEditingController emergencyRelationshipController = TextEditingController();
  TextEditingController medicineInfoController = TextEditingController();
  TextEditingController allergyInfoController = TextEditingController();

  TabController? _tabController;
  String? selectedGender;
  List<String> attendanceUserList = ["Info", "Contact", "Medical"];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    if (widget.isEdit) {
      nameController.text = "Ali Khan";
      phoneController.text = "03001234567";
      dobController.text = "2012-05-12";
      contactNameController.text = "Father";
      contactPhoneController.text = "03007654321";
      emergencyNameController.text = "Mother";
      emergencyPhoneController.text = "03005556677";
      allergyController.text = "Peanuts";
      medicineController.text = "Paracetamol";
      allergyInfoController.text = "Paracetamol";
      medicineInfoController.text = "Paracetamol";
      emergencyRelationshipController.text = "Paracetamol";
      contactHomeController.text = "Paracetamol";
      contactAddressController.text = "Paracetamol";
      selectedGender = "";
    }
    if(widget.isEdit==false){
      final kvm=Provider.of<KidContactViewModel>(context, listen: false);
      kvm.parentContacts.clear();
      kvm.parentContacts.add({
        "name": TextEditingController(),
        "phone": TextEditingController(),
        "homePhone": TextEditingController(),
        "address": TextEditingController(),
        "authorized": false,
      });
      kvm.emergencyContacts.clear();
      kvm.emergencyContacts.add( {
        "name": TextEditingController(),
        "phone": TextEditingController(),
        "relationship": TextEditingController(),
        "authorized": false,
      });
      kvm.allergies.clear();
      kvm.allergies.add(  {
        "allergy": TextEditingController(),
    "info": TextEditingController(),
  });
      kvm.medicines.clear();
      kvm.medicines.add(  {
        "medicine": TextEditingController(),
        "info": TextEditingController(),
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    contactNameController.dispose();
    contactPhoneController.dispose();
    emergencyNameController.dispose();
    emergencyPhoneController.dispose();
    allergyController.dispose();
    medicineController.dispose();
    contactAddressController.dispose();
    contactHomeController.dispose();
    emergencyRelationshipController.dispose();
    medicineInfoController.dispose();
    allergyInfoController.dispose();
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
    ));

    return Scaffold(
      appBar: customAppBar(title: widget.isEdit ? "Edit Kid" : "Add Kid"),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTabBar(_tabController!, attendanceUserList),
            verticalSpacer(20),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  kidInfoCard(
                      context: context,
                      nameController: nameController,
                      phoneController: phoneController,
                      selectedGender: selectedGender ?? "",
                      dobController: dobController),
                  kidContactCard(
                       context,
                   /*   nameController: contactNameController,
                      addressController: contactAddressController,
                      homePhoneController: contactHomeController,
                      phoneController: contactPhoneController,
                      emergencyPhoneController: emergencyPhoneController,
                      emergencyNameController: emergencyNameController,
                      emergencyRelationshipController:
                      emergencyRelationshipController*/),
                  kidMedicalCard(
                      context: context,
                      medicineController: medicineController,
                      medicineInfoController: medicineInfoController,
                      allergyController: allergyController,
                      allergyInfoController: allergyInfoController)
                ],
              ),
            ),
            verticalSpacer(20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: customButton(
          context: context,
          text: "Save",
          fontSize: 16,
          height: 58,
          width: 390,
          borderColor: Colors.transparent,
          bgColor: AppColors.blue,
          fontColor: Colors.white,
          borderRadius: 100,
          isCircular: true,
          fontWeight: FontWeight.w600,
          onPressed: () {},
        ),
      ),
    );
  }
}
