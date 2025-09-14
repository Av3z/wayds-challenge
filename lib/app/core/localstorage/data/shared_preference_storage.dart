import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayds_challenge/app/core/localstorage/domain/local_storage.dart';

class SharedPreferenceStorage extends LocalStorage {
  final SharedPreferences _prefs;

  SharedPreferenceStorage(this._prefs);

  @override
  Future<void> saveData(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  Future<String?> getData(String key) async {
    return _prefs.getString(key);
  }

  @override
  Future<void> deleteData(String key) async {
    await _prefs.remove(key);
  }
}
