import 'package:wayds_challenge/app/core/localstorage/domain/local_storage.dart';

class LocalStorageMock implements LocalStorage {
  final Map<String, String> _storage = {};

  @override
  Future<void> saveData(String key, String value) async {
    _storage[key] = value;
  }

  @override
  Future<String?> getData(String key) async {
    return _storage[key];
  }

  @override
  Future<void> deleteData(String key) async {
    _storage.remove(key);
  }
}
