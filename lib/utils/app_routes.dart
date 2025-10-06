import 'package:quizzo/export.dart';

import '../view/ai_chat_bot_view/ai_chat_view.dart';
import '../view/message_view/user_list_view.dart';
import '../view/plan_view/plan_view.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const password = '/password';
  static const otp = '/otp';
  static const setPassword = '/setPassword';
  static const register = '/register';
  static const host = '/host';
  static const live = '/live';
  static const ai = '/ai';
  static const userChat = '/userChat';
  static const gallery = '/gallery';
  static const inventory = '/inventory';
  static const classes = '/classes';
  static const attendance = '/attendance';
  static const attendanceByStaff = '/attendanceByStaff';
  static const report = '/report';
  static const plan = '/plan';
  static const kids = '/kids';
  static const addKids = '/addKids';
  static const viewKid = '/viewKid';
  static const notification = '/notification';
  static const finance = '/finance';
  static const setting = '/setting';
  static const settingInfo = '/settingInfo';
  static const settingNursery = '/settingNursery';
  static const sendNotification = '/sendNotification';
  static const teacherPermission = '/teacherPermission';
  static const manageSubs = '/manageSubs';
  static const appSetting = '/appSetting';
  static const contact = '/contact';
  static const calender = '/calender';
  static const staff = '/staff';
  static const billing = '/billing';

  static final routes = [
    GetPage(name: splash, page: () => SplashView()),
    GetPage(name: login, page: () => SignInView()),
    GetPage(name: password, page: () => PasswordView()),
    // GetPage(name: otp, page: () => OtpView()),
    GetPage(name: setPassword, page: () => SetPasswordView()),
    GetPage(name: register, page: () => RegisterFlowView()),
    GetPage(name: host, page: () => HostView()),
    GetPage(name: live, page: () => LiveActivitiesView()),
    GetPage(name: ai, page: () => AiChatScreen()),
    GetPage(name: userChat, page: () => ChatUserListView()),
    GetPage(name: gallery, page: () => GalleryView()),
    GetPage(name: inventory, page: () => InventoryView()),
    GetPage(name: classes, page: () => ClassesView()),
    GetPage(name: attendance, page: () => AttendanceView()),
    GetPage(name: plan, page: () => PlanView()),
    GetPage(name: report, page: () => ReportingView()),
    GetPage(name: kids, page: () => KidsView()),
    GetPage(name: addKids, page: () => AddKidView(isEdit: false)),
    GetPage(name: staff, page: () => StaffView()),
    GetPage(name: viewKid, page: () => KidViewDetail()),
    GetPage(name: notification, page: () => NotificationView()),
    GetPage(name: finance, page: () => FinanceSlipView()),
    GetPage(name: setting, page: () => SettingScreenView()),
    GetPage(name: settingInfo, page: () => SettingInfoView()),
    GetPage(name: settingNursery, page: () => SettingNurseryInfoView()),
    GetPage(name: sendNotification, page: () => SettingSendNotification()),
    GetPage(name: teacherPermission, page: () => SettingPermissionView()),
    GetPage(name: manageSubs, page: () => SettingManageSubscription()),
    GetPage(name: appSetting, page: () => AppSettingView()),
    GetPage(name: contact, page: () => SettingContactUsView()),
    GetPage(name: calender, page: () => CalenderView()),
    GetPage(name: billing, page: () => BillingView()),
  ];
}
