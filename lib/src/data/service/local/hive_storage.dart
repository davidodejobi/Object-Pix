// ignore_for_file: unused_element

import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/core.dart';

class HiveService {
  // Save the given value in the user box under the specified key.
  final Box _userBox = Hive.box(AppConstants.user);

  void save(String key, dynamic value) {
    _userBox.put(key, value);
  }

  T? get<T>(String key) => _userBox.get(key) as T?;

  void delete(String key) {
    _userBox.delete(key);
  }

  void clear() => _userBox.clear();

  bool containsKey(String key) {
    return _userBox.containsKey(key);
  }

  int getLength() => _userBox.length;

  List<dynamic> getAllValues() => _userBox.values.toList();
}
