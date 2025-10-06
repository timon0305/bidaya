import 'package:quizzo/export.dart';

class QuickActionViewModel extends ChangeNotifier{

  String? _selectedTitle;

  String? get selectedTitle => _selectedTitle;
  String? _selectedTitle2;

  String? get selectedTitle2 => _selectedTitle2;

  void select(String title) {
    _selectedTitle = title;
    notifyListeners();
  } void select2(String title) {
    _selectedTitle2 = title;
    notifyListeners();
  }
}