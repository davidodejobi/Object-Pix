// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'model_sub_category.dart';

class ModelCategoryList {
  final List<ModelCategory>? modelCategories;

  ModelCategoryList({
    this.modelCategories,
  });
}

class ModelCategory {
  final String? name;
  final String? image;
  final List<ModelSubCategory>? subCategories;
  final String? description;
  final String? abbreviatedName;
  final bool isSelected;

  ModelCategory({
    this.name,
    this.image,
    this.subCategories,
    this.description,
    this.abbreviatedName,
  }) : isSelected = false;

  @override
  bool operator ==(covariant ModelCategory other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.image == image &&
        listEquals(other.subCategories, subCategories) &&
        other.description == description &&
        other.abbreviatedName == abbreviatedName &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        subCategories.hashCode ^
        description.hashCode ^
        abbreviatedName.hashCode ^
        isSelected.hashCode;
  }
}
