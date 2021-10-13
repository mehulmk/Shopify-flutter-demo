import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final SharedPreferences? _prefs;

  SharedPreferencesHelper(this._prefs);

  // get bool
  bool getBool(String key, {bool defValue = false}) {
    if (_prefs == null) return defValue;
    return _prefs!.getBool(key) ?? defValue;
  }

  // put bool
  Future<bool> putBool(String key, bool value) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.setBool(key, value);
  }

  // get int
  int getInt(String key, {int defValue = -1}) {
    if (_prefs == null) return defValue;
    return _prefs!.getInt(key) ?? defValue;
  }

  // put int.
  Future<bool> putInt(String key, int value) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.setInt(key, value);
  }

  // get double
  double? getDouble(String key) {
    if (_prefs == null) return null;
    return _prefs!.getDouble(key);
  }

  // put double
  Future<bool> putDouble(String key, double value) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.setDouble(key, value);
  }

  // get string
  String getString(String key, {String defValue = ''}) {
    if (_prefs == null) return defValue;
    return _prefs!.getString(key) ?? defValue;
  }

  // put string
  Future<bool> putString(String key, String value) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.setString(key, value);
  }

  // get string list
  List<String> getStringList(String key, {List<String> defValue = const []}) {
    if (_prefs == null) return defValue;
    return _prefs!.getStringList(key) ?? defValue;
  }

  // put string list
  Future<bool> putStringList(String key, List<String> value) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.setStringList(key, value);
  }

  // get object
  Map<String, dynamic>? getObj(String key) {
    if (_prefs == null) return null;
    String? _data = _prefs!.getString(key);
    return (_data == null || _data.isEmpty)
        ? null
        : json.decode(_data) as Map<String, dynamic>;
  }

  // put object
  Future<bool> putObj(String key, Map<String, dynamic>? value) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.setString(key, value == null ? "" : json.encode(value));
  }

  // get object with mapper fun
  T? getObject<T>(String key, T Function(Map<String, dynamic> v) f,
      {T? defValue}) {
    Map<String, dynamic>? map = getObj(key);
    return map == null ? defValue : f(map);
  }

  // put object with mapper fun
  Future<bool> putObject(String key, String Function()? toString) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.setString(key, toString == null ? "" : toString());
  }

  // get object list
  List<Map>? getObjList(String key) {
    if (_prefs == null) return null;
    List<String>? dataLis = _prefs!.getStringList(key);
    return dataLis?.map((value) {
      Map _dataMap = json.decode(value);
      return _dataMap;
    }).toList();
  }

  // get obj list with mapper fun
  List<T> getObjectList<T>(String key, T Function(Map v) f,
      {List<T> defValue = const []}) {
    List<Map>? dataList = getObjList(key);
    List<T>? list = dataList?.map((value) {
      return f(value);
    }).toList();
    return list ?? defValue;
  }

  // put object list
  Future<bool> putObjectList(String key, List<Object> list) {
    if (_prefs == null) return Future.value(false);

    List<String>? _dataList = list.map((value) {
      return json.encode(value);
    }).toList();
    return _prefs!.setStringList(key, _dataList);
  }

  // get dynamic
  dynamic getDynamic(String key, {dynamic defValue}) {
    if (_prefs == null) return defValue;
    return _prefs!.get(key) ?? defValue;
  }

  // have key
  bool haveKey(String key) {
    if (_prefs == null) return false;
    return _prefs!.getKeys().contains(key);
  }

  // get keys
  Set<String>? getKeys() {
    if (_prefs == null) return null;
    return _prefs!.getKeys();
  }

  // remove
  Future<bool> remove(String key) {
    if (_prefs == null) return Future.value(false);
    return _prefs!.remove(key);
  }

  // clear
  Future<bool> clear() {
    if (_prefs == null) return Future.value(false);
    return _prefs!.clear();
  }
}
