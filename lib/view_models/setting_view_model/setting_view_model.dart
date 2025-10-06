
import '../../export.dart';

class SettingViewModel extends ChangeNotifier{
  Map<String, bool> permissions = {
    "attendance": true,
    "gallery": false,
    "kids": false,
    "inventory": false,
  };

  void togglePermission(String key, bool value) {
    permissions[key] = value;
    notifyListeners();
  }
}