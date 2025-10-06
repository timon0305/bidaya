import 'package:flutter_test/flutter_test.dart';
import 'package:quizzo/view_models/setting_view_model/setting_view_model.dart';

void main() {
  group('SettingViewModel Tests', () {
    late SettingViewModel viewModel;

    setUp(() {
      viewModel = SettingViewModel();
    });

    tearDown(() {
      viewModel.dispose();
    });

    test('should initialize with default permissions', () {
      expect(viewModel.permissions['attendance'], true);
      expect(viewModel.permissions['gallery'], false);
      expect(viewModel.permissions['kids'], false);
      expect(viewModel.permissions['inventory'], false);
    });

    test('should toggle permission for attendance', () {
      expect(viewModel.permissions['attendance'], true);
      viewModel.togglePermission('attendance', false);
      expect(viewModel.permissions['attendance'], false);
      viewModel.togglePermission('attendance', true);
      expect(viewModel.permissions['attendance'], true);
    });

    test('should toggle permission for gallery', () {
      expect(viewModel.permissions['gallery'], false);
      viewModel.togglePermission('gallery', true);
      expect(viewModel.permissions['gallery'], true);
    });

    test('should toggle permission for kids', () {
      expect(viewModel.permissions['kids'], false);
      viewModel.togglePermission('kids', true);
      expect(viewModel.permissions['kids'], true);
    });

    test('should toggle permission for inventory', () {
      expect(viewModel.permissions['inventory'], false);
      viewModel.togglePermission('inventory', true);
      expect(viewModel.permissions['inventory'], true);
    });

    test('should handle multiple permission changes', () {
      viewModel.togglePermission('attendance', false);
      viewModel.togglePermission('gallery', true);
      viewModel.togglePermission('kids', true);

      expect(viewModel.permissions['attendance'], false);
      expect(viewModel.permissions['gallery'], true);
      expect(viewModel.permissions['kids'], true);
      expect(viewModel.permissions['inventory'], false);
    });
  });
}
