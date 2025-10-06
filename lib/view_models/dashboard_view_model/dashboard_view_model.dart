import 'package:quizzo/export.dart';

class DashboardViewModel extends ChangeNotifier {
  final List<Map<String, dynamic>> adminList = [
    {"title": "Kids", "image": AppImages.kid, "route": AppRoutes.kids},
    {"title": "Staff", "image": AppImages.staff, "route": AppRoutes.staff},
    {
      "title": "Attendance",
      "image": AppImages.attendance,
      "route": AppRoutes.attendance,
    },
    {
      "title": "Classes",
      "image": AppImages.classes,
      "route": AppRoutes.classes,
    },
    {"title": "Reports", "image": AppImages.reports, "route": AppRoutes.report},
    {
      "title": "Gallery",
      "image": AppImages.gallery,
      "route": AppRoutes.gallery,
    },
    {
      "title": "Calender",
      "image": AppImages.calender,
      "route": AppRoutes.calender,
    },
    {"title": "Plans", "image": AppImages.plans, "route": AppRoutes.plan},
    {
      "title": "Inventory",
      "image": AppImages.inventory,
      "route": AppRoutes.inventory,
    },
    {
      "title": "Live Activity",
      "image": AppImages.live,
      "route": AppRoutes.live,
    },
    {
      "title": "Finance",
      "image": AppImages.finance,
      "route": AppRoutes.finance,
    },
  ];
  final List<Map<String, dynamic>> staffList = [
    {"title": "Kids", "image": AppImages.kid, "route": AppRoutes.kids},
    {
      "title": "Attendance",
      "image": AppImages.attendance,
      "route": AppRoutes.attendance,
    },
    {"title": "Reports", "image": AppImages.reports, "route": AppRoutes.report},
    {
      "title": "Gallery",
      "image": AppImages.gallery,
      "route": AppRoutes.gallery,
    },
    {
      "title": "Calender",
      "image": AppImages.calender,
      "route": AppRoutes.calender,
    },
    {"title": "Plans", "image": AppImages.plans, "route": AppRoutes.plan},
    {
      "title": "Inventory",
      "image": AppImages.inventory,
      "route": AppRoutes.inventory,
    },
    {"title": "Nursery", "image": AppImages.nursery},
    {
      "title": "Live Activity",
      "image": AppImages.live,
      "route": AppRoutes.live,
    },
  ];
  final List<Map<String, dynamic>> parentList = [
    {"title": "Reports", "image": AppImages.reports, "route": AppRoutes.report},
    {
      "title": "Billing",
      "image": AppImages.billing,
      "route": AppRoutes.billing,
    },
    {
      "title": "Gallery",
      "image": AppImages.gallery,
      "route": AppRoutes.gallery,
    },
    {
      "title": "Live Activity",
      "image": AppImages.live,
      "route": AppRoutes.live,
    },
    {
      "title": "Calender",
      "image": AppImages.calender,
      "route": AppRoutes.calender,
    },
    {"title": "Plans", "image": AppImages.plans, "route": AppRoutes.plan},
    {"title": "Nursery", "image": AppImages.nursery, "route": ""},
  ];
  bool isAddInNursery = false;
}
