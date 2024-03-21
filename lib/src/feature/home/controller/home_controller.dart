import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/model_hardcode_data.dart';
import '../../../data/model/model.dart';

final homeProvider =
    ChangeNotifierProvider<HomeController>((ref) => HomeController());

class HomeController with ChangeNotifier {
  ModelCategoryList _categoryList = modelCategoryList;
  ModelCategoryList get categoryList => _categoryList;
  set categoryList(ModelCategoryList value) {
    _categoryList = value;
    notifyListeners();
  }

  ModelCategory _selectedCategory = modelCategoryList.modelCategories!.first;
  ModelCategory get selectedCategory => _selectedCategory;
  set selectedCategory(ModelCategory value) {
    _selectedCategory = value;
    notifyListeners();
  }

  ModelSubCategory _selectedSubCategory = ModelSubCategory();
  ModelSubCategory get selectedSubCategory => _selectedSubCategory;

  bool _toggleSideDrawer = false;
  bool get toggleSideDrawer => _toggleSideDrawer;
  set toggleSideDrawer(bool value) {
    _toggleSideDrawer = value;
    notifyListeners();
  }

  void selectCategory(ModelSubCategory category) {
    _selectedSubCategory = category;
    notifyListeners();
  }
}
