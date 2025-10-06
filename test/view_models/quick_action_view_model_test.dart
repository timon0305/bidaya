import 'package:flutter_test/flutter_test.dart';
import 'package:quizzo/view_models/dashboard_view_model/quick_action_view_model.dart';

void main() {
  group('QuickActionViewModel Tests', () {
    late QuickActionViewModel viewModel;

    setUp(() {
      viewModel = QuickActionViewModel();
    });

    tearDown(() {
      viewModel.dispose();
    });

    group('Selected Title', () {
      test('should initialize with null selectedTitle', () {
        expect(viewModel.selectedTitle, isNull);
      });

      test('should update selectedTitle when select is called', () {
        expect(viewModel.selectedTitle, isNull);

        viewModel.select('Reports');
        expect(viewModel.selectedTitle, 'Reports');

        viewModel.select('Gallery');
        expect(viewModel.selectedTitle, 'Gallery');
      });

      test('should handle empty string selection', () {
        viewModel.select('');
        expect(viewModel.selectedTitle, '');
      });

      test('should update selectedTitle multiple times', () {
        viewModel.select('Reports');
        expect(viewModel.selectedTitle, 'Reports');

        viewModel.select('Attendance');
        expect(viewModel.selectedTitle, 'Attendance');

        viewModel.select('Kids');
        expect(viewModel.selectedTitle, 'Kids');
      });
    });

    group('Selected Title 2', () {
      test('should initialize with null selectedTitle2', () {
        expect(viewModel.selectedTitle2, isNull);
      });

      test('should update selectedTitle2 when select2 is called', () {
        expect(viewModel.selectedTitle2, isNull);

        viewModel.select2('Classes');
        expect(viewModel.selectedTitle2, 'Classes');

        viewModel.select2('Finance');
        expect(viewModel.selectedTitle2, 'Finance');
      });

      test('should handle empty string selection for title2', () {
        viewModel.select2('');
        expect(viewModel.selectedTitle2, '');
      });

      test('should update selectedTitle2 multiple times', () {
        viewModel.select2('Plans');
        expect(viewModel.selectedTitle2, 'Plans');

        viewModel.select2('Inventory');
        expect(viewModel.selectedTitle2, 'Inventory');

        viewModel.select2('Live Activity');
        expect(viewModel.selectedTitle2, 'Live Activity');
      });
    });

    group('Independent Selections', () {
      test('should maintain independent values for both titles', () {
        viewModel.select('Reports');
        viewModel.select2('Gallery');

        expect(viewModel.selectedTitle, 'Reports');
        expect(viewModel.selectedTitle2, 'Gallery');
      });

      test('should not affect selectedTitle2 when updating selectedTitle', () {
        viewModel.select('Reports');
        viewModel.select2('Gallery');

        expect(viewModel.selectedTitle, 'Reports');
        expect(viewModel.selectedTitle2, 'Gallery');

        viewModel.select('Attendance');

        expect(viewModel.selectedTitle, 'Attendance');
        expect(viewModel.selectedTitle2, 'Gallery'); // Should remain unchanged
      });

      test('should not affect selectedTitle when updating selectedTitle2', () {
        viewModel.select('Reports');
        viewModel.select2('Gallery');

        expect(viewModel.selectedTitle, 'Reports');
        expect(viewModel.selectedTitle2, 'Gallery');

        viewModel.select2('Classes');

        expect(viewModel.selectedTitle, 'Reports'); // Should remain unchanged
        expect(viewModel.selectedTitle2, 'Classes');
      });
    });

    group('Edge Cases', () {
      test('should handle special characters in selection', () {
        viewModel.select('Report@123');
        expect(viewModel.selectedTitle, 'Report@123');

        viewModel.select2('Gallery#456');
        expect(viewModel.selectedTitle2, 'Gallery#456');
      });

      test('should handle long strings', () {
        final longString = 'A' * 1000;
        viewModel.select(longString);
        expect(viewModel.selectedTitle, longString);
      });

      test('should handle unicode characters', () {
        viewModel.select('تقارير'); // Arabic
        expect(viewModel.selectedTitle, 'تقارير');

        viewModel.select2('报告'); // Chinese
        expect(viewModel.selectedTitle2, '报告');
      });
    });
  });
}
