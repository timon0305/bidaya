import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizzo/models/menu_model.dart';

void main() {
  group('MenuItem', () {
    test('should create MenuItem with all properties', () {
      final menuItem = MenuItem(
        title: 'Dashboard',
        icon: 'assets/icons/dashboard.png',
        color: Colors.blue,
      );

      expect(menuItem.title, 'Dashboard');
      expect(menuItem.icon, 'assets/icons/dashboard.png');
      expect(menuItem.color, Colors.blue);
    });

    test('should create MenuItem with different colors', () {
      final item1 = MenuItem(
        title: 'Reports',
        icon: 'icon1.png',
        color: Colors.red,
      );
      final item2 = MenuItem(
        title: 'Settings',
        icon: 'icon2.png',
        color: Colors.green,
      );

      expect(item1.color, Colors.red);
      expect(item2.color, Colors.green);
    });

    test('should handle empty title', () {
      final menuItem = MenuItem(
        title: '',
        icon: 'icon.png',
        color: Colors.blue,
      );

      expect(menuItem.title, isEmpty);
    });

    test('should handle special characters in title', () {
      final menuItem = MenuItem(
        title: 'Reports & Analytics',
        icon: 'icon.png',
        color: Colors.blue,
      );

      expect(menuItem.title, 'Reports & Analytics');
    });

    test('should handle unicode characters in title', () {
      final menuItem = MenuItem(
        title: '대시보드',
        icon: 'icon.png',
        color: Colors.blue,
      );

      expect(menuItem.title, '대시보드');
    });

    test('should handle long icon paths', () {
      final menuItem = MenuItem(
        title: 'Test',
        icon: 'assets/icons/very/deep/path/to/icon.png',
        color: Colors.blue,
      );

      expect(menuItem.icon, 'assets/icons/very/deep/path/to/icon.png');
    });

    test('should maintain color equality', () {
      final item1 = MenuItem(
        title: 'Test',
        icon: 'icon.png',
        color: Colors.blue,
      );
      final item2 = MenuItem(
        title: 'Test',
        icon: 'icon.png',
        color: Colors.blue,
      );

      expect(item1.color, item2.color);
    });
  });
}
