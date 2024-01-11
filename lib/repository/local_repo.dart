import 'dart:convert';

import 'package:demo_logic/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static UserRepository get instance => UserRepository._internal();
  UserRepository._internal();

  Future<SharedPreferences> _getSharePreference() async =>
      await SharedPreferences.getInstance();

  static const _usersKey = 'users';
  static const _isLogin = 'isLogin';

  Future<List<User>> getUsers() async {
    final preferences = await SharedPreferences.getInstance();
    final usersJson = preferences.getStringList(_usersKey);
    if (usersJson != null) {
      return usersJson.map((json) => User.fromJson(jsonDecode(json))).toList();
    } else {
      return [];
    }
  }

  Future<void> saveUser(User user) async {
    final preferences = await SharedPreferences.getInstance();
    final users = await getUsers();
    users.add(user);
    final usersJson = users.map((user) => jsonEncode(user)).toList();
    await preferences.setStringList(_usersKey, usersJson);
  }

  Future<User?> loginUser(String email, String password) async {
    final users = await getUsers();
    final User? user = users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: null,
    );
    return user;
  }

  Future<bool> putStatusLogin() async {
    final pref = await _getSharePreference();
    return pref.setString(_isLogin, 'logged');
  }

  Future<String?> getStatusLogin() async {
    final pref = await _getSharePreference();
    return pref.getString(_isLogin);
  }
}
