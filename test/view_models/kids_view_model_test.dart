import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizzo/view_models/kids_view_model/kids_view_model.dart';

void main() {
  group('KidContactViewModel Tests', () {
    late KidContactViewModel viewModel;

    setUp(() {
      viewModel = KidContactViewModel();
    });

    tearDown(() {
      viewModel.dispose();
    });

    group('Parent Contacts', () {
      test('should initialize with one parent contact', () {
        expect(viewModel.parentContacts.length, 1);
        expect(viewModel.parentContacts[0]['name'].text, 'Aqsa');
        expect(viewModel.parentContacts[0]['phone'].text, '03001234567');
        expect(viewModel.parentContacts[0]['authorized'], false);
      });

      test('should toggle parent authorized status', () {
        expect(viewModel.parentContacts[0]['authorized'], false);

        viewModel.toggleAuthorized(0, true);
        expect(viewModel.parentContacts[0]['authorized'], true);

        viewModel.toggleAuthorized(0, false);
        expect(viewModel.parentContacts[0]['authorized'], false);
      });

      test('should not toggle authorized for invalid index', () {
        viewModel.toggleAuthorized(5, true);
        // Should not crash and maintain original state
        expect(viewModel.parentContacts[0]['authorized'], false);
      });

      test('should remove parent contact when more than one', () {
        // Add a second parent
        viewModel.parentContacts.add({
          'name': TextEditingController(text: 'Parent 2'),
          'phone': TextEditingController(text: '03001234568'),
          'homePhone': TextEditingController(),
          'address': TextEditingController(),
          'authorized': false,
        });

        expect(viewModel.parentContacts.length, 2);

        viewModel.removeParent(1);
        expect(viewModel.parentContacts.length, 1);
      });

      test('should not remove parent when only one exists', () {
        expect(viewModel.parentContacts.length, 1);

        viewModel.removeParent(0);
        expect(viewModel.parentContacts.length, 1);
      });
    });

    group('Emergency Contacts', () {
      test('should initialize with one emergency contact', () {
        expect(viewModel.emergencyContacts.length, 1);
        expect(viewModel.emergencyContacts[0]['name'].text, 'Zilay Noor');
        expect(viewModel.emergencyContacts[0]['phone'].text, '0345678900');
        expect(viewModel.emergencyContacts[0]['authorized'], false);
      });

      test('should toggle emergency contact authorized status', () {
        expect(viewModel.emergencyContacts[0]['authorized'], false);

        viewModel.toggleEmergencyAuthorized(0, true);
        expect(viewModel.emergencyContacts[0]['authorized'], true);

        viewModel.toggleEmergencyAuthorized(0, false);
        expect(viewModel.emergencyContacts[0]['authorized'], false);
      });

      test('should handle null value in toggleEmergencyAuthorized', () {
        viewModel.toggleEmergencyAuthorized(0, null);
        expect(viewModel.emergencyContacts[0]['authorized'], false);
      });

      test('should not toggle emergency authorized for invalid index', () {
        viewModel.toggleEmergencyAuthorized(10, true);
        // Should not crash
        expect(viewModel.emergencyContacts[0]['authorized'], false);
      });

      test('should remove emergency contact when more than one', () {
        viewModel.emergencyContacts.add({
          'name': TextEditingController(text: 'Emergency 2'),
          'phone': TextEditingController(text: '0345678901'),
          'relationship': TextEditingController(text: 'uncle'),
          'authorized': false,
        });

        expect(viewModel.emergencyContacts.length, 2);

        viewModel.removeEmergency(1);
        expect(viewModel.emergencyContacts.length, 1);
      });

      test('should not remove emergency contact when only one exists', () {
        expect(viewModel.emergencyContacts.length, 1);

        viewModel.removeEmergency(0);
        expect(viewModel.emergencyContacts.length, 1);
      });
    });

    group('Medicines', () {
      test('should initialize with one empty medicine entry', () {
        expect(viewModel.medicines.length, 1);
        expect(viewModel.medicines[0]['medicine']!.text, isEmpty);
        expect(viewModel.medicines[0]['info']!.text, isEmpty);
      });

      test('should remove medicine when more than one exists', () {
        viewModel.medicines.add({
          'medicine': TextEditingController(text: 'Medicine 2'),
          'info': TextEditingController(text: 'Info 2'),
        });

        expect(viewModel.medicines.length, 2);

        viewModel.removeMedicine(1);
        expect(viewModel.medicines.length, 1);
      });

      test('should not remove medicine when only one exists', () {
        expect(viewModel.medicines.length, 1);

        viewModel.removeMedicine(0);
        expect(viewModel.medicines.length, 1);
      });
    });

    group('Allergies', () {
      test('should initialize with empty allergies list', () {
        expect(viewModel.allergies.length, 0);
      });

      test('should remove allergy when more than one exists', () {
        viewModel.allergies.addAll([
          {
            'allergy': TextEditingController(text: 'Allergy 1'),
            'info': TextEditingController(text: 'Info 1'),
          },
          {
            'allergy': TextEditingController(text: 'Allergy 2'),
            'info': TextEditingController(text: 'Info 2'),
          },
        ]);

        expect(viewModel.allergies.length, 2);

        viewModel.removeAllergy(1);
        expect(viewModel.allergies.length, 1);
      });

      test('should not remove allergy when only one exists', () {
        viewModel.allergies.add({
          'allergy': TextEditingController(text: 'Allergy 1'),
          'info': TextEditingController(text: 'Info 1'),
        });

        expect(viewModel.allergies.length, 1);

        viewModel.removeAllergy(0);
        expect(viewModel.allergies.length, 1);
      });
    });
  });
}
