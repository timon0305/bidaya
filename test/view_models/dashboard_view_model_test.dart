import 'package:flutter_test/flutter_test.dart';
import 'package:quizzo/view_models/dashboard_view_model/dashboard_view_model.dart';

void main() {
  group('DashboardViewModel Tests', () {
    late DashboardViewModel viewModel;

    setUp(() {
      viewModel = DashboardViewModel();
    });

    test('should have correct admin list', () {
      expect(viewModel.adminList.length, 11);
      expect(viewModel.adminList[0]['title'], 'Kids');
      expect(viewModel.adminList[1]['title'], 'Staff');
      expect(viewModel.adminList[2]['title'], 'Attendance');
    });

    test('should have correct staff list', () {
      expect(viewModel.staffList.length, 9);
      expect(viewModel.staffList[0]['title'], 'Kids');
      expect(viewModel.staffList[1]['title'], 'Attendance');
    });

    test('should have correct parent list', () {
      expect(viewModel.parentList.length, 7);
      expect(viewModel.parentList[0]['title'], 'Reports');
      expect(viewModel.parentList[1]['title'], 'Billing');
    });

    test('should initialize isAddInNursery as false', () {
      expect(viewModel.isAddInNursery, false);
    });

    test('should be able to update isAddInNursery', () {
      expect(viewModel.isAddInNursery, false);
      viewModel.isAddInNursery = true;
      expect(viewModel.isAddInNursery, true);
    });
  });
}
