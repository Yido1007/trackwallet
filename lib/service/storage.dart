import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageKeys {
  static const String userToken = "user_token";
}

class Storage extends GetxController {
  late final SharedPreferences _preferences;

  //Create Shared Preferences Class
  Future<SharedPreferences> init() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  // It is a function written to save different types of data to the device's local memory using Shared Preferences.
  Future<bool> setValue<T>(String key, T value) async {
    try {
      if (value is String) {
        return await _preferences.setString(key, value);
      } else if (value is int) {
        return await _preferences.setInt(key, value);
      } else if (value is double) {
        return await _preferences.setDouble(key, value);
      } else if (value is bool) {
        return await _preferences.setBool(key, value);
      } else if (value is List<String>) {
        return await _preferences.setStringList(key, value);
      } else {
        throw ArgumentError("UnSupported Value");
      }
    } catch (e) {
      print("An error occurred while adding data");
      return false;
    }
  }

  //It is a function written to read different types of data from local storage using Shared Preferences.
  T? getValue<T>(String key) {
    try {
      if (T == String) {
        return _preferences.getString(key) as T;
      } else if (T == int) {
        return _preferences.getInt(key) as T;
      } else if (T == double) {
        return _preferences.getDouble(key) as T;
      } else if (T == bool) {
        return _preferences.getBool(key) as T;
      } else if (T == List<String>) {
        return _preferences.getStringList(key) as T;
      } else {
        throw ArgumentError("UnSupported Value");
      }
    } catch (e) {
      print("An error occurred while reading data from storage.");
      return null;
    }
  }

  // Used to delete previously stored data via keys
  Future<bool> remove(String key) async {
    try {
      return await _preferences.remove(key);
    } catch (e) {
      print("An error occurred while deleting the given value key $e");
      return false;
    }
  }

  // This function clears all data in SharedPreferences
  Future<bool> clear(String key) async {
    try {
      return await _preferences.clear();
    } catch (e) {
      print("An error occurred while cleaning $e");
      return false;
    }
  }

  // This function checks if a specific key exists in SharedPreferences.
  bool hasKey(String key) {
    return _preferences.containsKey(key);
  }

  // If there is a value stored with the specified key, it returns it; otherwise, it returns the given defaultValue.
  T getValueOrDefault<T>(String key, T defaultValue) {
    return getValue<T>(key) ?? defaultValue;
  }

  // Returns all data stored in SharedPreferences as a Map<String, dynamic>.
  Map<String, dynamic> getAllValues() {
    final keys = _preferences.getKeys();
    final map = <String, dynamic>{};
    for (var key in keys) {
      map[key] = _preferences.get(key);
    }
    return map;
  }
}
