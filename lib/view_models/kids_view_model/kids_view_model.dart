import 'package:quizzo/export.dart';

class KidContactViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> parentContacts = [
    {
      "name": TextEditingController(text: "Aqsa"),
      "phone": TextEditingController(text: "03001234567"),
      "homePhone": TextEditingController(text: "0511234567"),
      "address": TextEditingController(text: "Islamabad, Pakistan"),
      "authorized": false,
    },
  ];
  void toggleAuthorized(int index, bool value) {
    if (index >= 0 && index < parentContacts.length) {
      parentContacts[index]["authorized"] = value;
      notifyListeners();
    }
  }

  List<Map<String, dynamic>> emergencyContacts = [
    {
      "name": TextEditingController(text: "Zilay Noor"),
      "phone": TextEditingController(text: "0345678900"),
      "relationship": TextEditingController(text: "niece"),
      "authorized": false,
    },
  ];

  void addParent(BuildContext context) {
    if (parentContacts.length >= 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You can only add 2 parents."),
          backgroundColor: AppColors.redShade,
        ),
      );
      return;
    }

    var last = parentContacts.last;

    if (last["name"]!.text.isNotEmpty && last["phone"]!.text.isNotEmpty) {
      parentContacts.add({
        "name": TextEditingController(),
        "phone": TextEditingController(),
        "homePhone": TextEditingController(),
        "address": TextEditingController(),
        "authorized": false,
      });
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill current parent before adding new one."),
          backgroundColor: AppColors.redShade,
        ),
      );
    }
  }

  void removeParent(int index) {
    if (parentContacts.length > 1) {
      parentContacts.removeAt(index);
      notifyListeners();
    }
  }

  void addEmergency(BuildContext context) {
    if (emergencyContacts.length >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You can only add up to 5 emergency contacts."),
          backgroundColor: AppColors.redShade,
        ),
      );
      return;
    }

    var last = emergencyContacts.last;

    if (last["name"]!.text.isEmpty || last["phone"]!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill current emergency contact before adding a new one.",
          ),
          backgroundColor: AppColors.redShade,
        ),
      );
      return;
    }
    emergencyContacts.add({
      "name": TextEditingController(),
      "phone": TextEditingController(),
      "relationship": TextEditingController(),
      "authorized": false,
    });

    notifyListeners();
  }

  void removeEmergency(int index) {
    if (emergencyContacts.length > 1) {
      emergencyContacts.removeAt(index);
      notifyListeners();
    }
  }

  void toggleEmergencyAuthorized(int index, bool? value) {
    if (index >= 0 && index < emergencyContacts.length) {
      emergencyContacts[index]["authorized"] = value ?? false;
      notifyListeners();
    }
  }

  List<Map<String, TextEditingController>> medicines = [
    {"medicine": TextEditingController(), "info": TextEditingController()},
  ];

  void addMedicine(BuildContext context) {
    var last = medicines.last;

    if (last["medicine"]!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill current medicine before adding a new one.",
          ),
          backgroundColor: AppColors.redShade,
        ),
      );
      return;
    }

    medicines.add({
      "medicine": TextEditingController(),
      "info": TextEditingController(),
    });

    notifyListeners();
  }

  void removeMedicine(int index) {
    if (medicines.length > 1) {
      medicines.removeAt(index);
      notifyListeners();
    }
  }

  List<Map<String, TextEditingController>> allergies = [];

  void addAllergy(BuildContext context) {
    if (allergies.isNotEmpty) {
      var last = allergies.last;

      if (last["allergy"]!.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Please fill current allergy before adding a new one.",
            ),
            backgroundColor: AppColors.redShade,
          ),
        );
        return;
      }
    }

    allergies.add({
      "allergy": TextEditingController(),
      "info": TextEditingController(),
    });

    notifyListeners();
  }

  void removeAllergy(int index) {
    if (allergies.length > 1) {
      allergies.removeAt(index);
      notifyListeners();
    }
  }
}
