import 'model_sub_category.dart';

class ModelCategoryList {
  final List<ModelCategory> modelCategories;

  ModelCategoryList({
    required this.modelCategories,
  });
}

class ModelCategory {
  final String name;
  final String image;
  final List<ModelSubCategory> subCategories;
  final String description;
  final String abbreviatedName;

  ModelCategory({
    required this.name,
    required this.image,
    required this.subCategories,
    required this.description,
    required this.abbreviatedName,
  });
}
