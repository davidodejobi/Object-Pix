import 'package:flutter_test/flutter_test.dart';
import 'package:object_pix/src/data/model/model.dart';
import 'package:object_pix/src/feature/home/controller/home_controller.dart';

void main() {
  group('HomeController', () {
    test('Initial values are set correctly', () {
      final controller = HomeController();

      expect(controller.categoryList, isNotNull);
      expect(controller.categoryList.modelCategories!.length, equals(7));

      expect(controller.selectedCategory,
          equals(controller.categoryList.modelCategories!.first));

      expect(controller.selectedSubCategory.name, equals(null));

      expect(controller.toggleSideDrawer, equals(false));
    });

    test('Selecting category updates selectedCategory and notifies listeners',
        () {
      final controller = HomeController();

      final dummyCategory = ModelCategory(
        name: 'Test Category',
        image: 'test_image_url',
        subCategories: [],
        description: 'Test description',
        abbreviatedName: 'Test',
      );

      bool listenerCalled = false;
      controller.addListener(() {
        listenerCalled = true;
      });

      controller.selectedCategory = dummyCategory;

      expect(controller.selectedCategory, equals(dummyCategory));

      expect(listenerCalled, isTrue);
    });
  });
}
