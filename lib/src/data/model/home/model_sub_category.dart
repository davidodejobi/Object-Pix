// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelSubCategory {
  final String? name;
  final bool isSelected;

  ModelSubCategory({
    this.name,
  }) : isSelected = false;

  @override
  bool operator ==(covariant ModelSubCategory other) {
    if (identical(this, other)) return true;

    return other.name == name && other.isSelected == isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode;
}
