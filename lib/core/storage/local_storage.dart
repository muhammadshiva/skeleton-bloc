import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

abstract class LocalStorage {
  Future<String?> getString(String key);
  Future<bool> setString(String key, String value);
  Future<int?> getInt(String key);
  Future<bool> setInt(String key, int value);
  Future<bool?> getBool(String key);
  Future<bool> setBool(String key, bool value);
  Future<bool> remove(String key);
  Future<bool> clear();

  // User specific methods
  Future<String?> getUserToken();
  Future<bool> setUserToken(String token);
  Future<bool> clearUserToken();
  Future<bool> isFirstTime();
  Future<bool> setFirstTime(bool isFirst);
}

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _sharedPreferences;

  LocalStorageImpl(this._sharedPreferences);

  @override
  Future<String?> getString(String key) async {
    return _sharedPreferences.getString(key);
  }

  @override
  Future<bool> setString(String key, String value) async {
    return await _sharedPreferences.setString(key, value);
  }

  @override
  Future<int?> getInt(String key) async {
    return _sharedPreferences.getInt(key);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return await _sharedPreferences.setInt(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    return _sharedPreferences.getBool(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  @override
  Future<bool> remove(String key) async {
    return await _sharedPreferences.remove(key);
  }

  @override
  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

  @override
  Future<String?> getUserToken() async {
    return getString(AppConstants.userTokenKey);
  }

  @override
  Future<bool> setUserToken(String token) async {
    return setString(AppConstants.userTokenKey, token);
  }

  @override
  Future<bool> clearUserToken() async {
    return remove(AppConstants.userTokenKey);
  }

  @override
  Future<bool> isFirstTime() async {
    final result = await getBool(AppConstants.isFirstTimeKey);
    return result ?? true;
  }

  @override
  Future<bool> setFirstTime(bool isFirst) async {
    return setBool(AppConstants.isFirstTimeKey, isFirst);
  }
}
