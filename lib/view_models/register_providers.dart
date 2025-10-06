import 'package:quizzo/export.dart';

class RegisterAllProviders {
  static List<ChangeNotifierProvider<ChangeNotifier>> get allProvidersList => [
    ChangeNotifierProvider(create: (_) => AuthViewModel()),
    ChangeNotifierProvider(create: (_) => DashboardViewModel()),
    ChangeNotifierProvider(create: (_) => SettingViewModel()),
    ChangeNotifierProvider(create: (_) => QuickActionViewModel()),
    ChangeNotifierProvider(create: (_) => KidContactViewModel()),
    ChangeNotifierProvider(create: (_) => SignupViewModel()),
  ];
}
