import 'package:hive_flutter/hive_flutter.dart';

class HiveService<T> {
  final String _boxName;
  late Box<T> _box;

  HiveService(this._boxName) {
    _openBox();
  }

  /// Check if the box is opened or not
  Future<void> _openBox() async {
    try {
      if (!Hive.isBoxOpen(_boxName)) {
        _box = await Hive.openBox<T>(_boxName);
      } else {
        _box = Hive.box<T>(_boxName);
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Add a news item to favorites
  Future<void> add(T news) async {
    try {
      await _openBox();
      await _box.add(news);
    } catch (e) {
      rethrow;
    }
  }

  /// Get a single item from the box by its [key].
  Future<T?> getItem(int key) async {
    try {
      await _openBox();
      return _box.get(key);
    } catch (e) {
      rethrow;
    }
  }

  /// Get all favorite news items
  Future<List<T>> get() async {
    try {
      await _openBox();
      return _box.values.toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Delete a news item from favorites by key
  Future<void> delete(int key) async {
    try {
      await _openBox();
      await _box.delete(key);
    } catch (e) {
      rethrow;
    }
  }

  /// Close the box
  Future<void> closeBox() async {
    try {
      await _box.close();
    } catch (e) {
      rethrow;
    }
  }
}
