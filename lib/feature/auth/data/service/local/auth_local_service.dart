import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/user_model.dart';

final class AuthLocalService {
  static const String _userKey = 'user_data';

  // Save user data
  Future<void> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, user.toJson());
    getUser();
  }

  // Remove user data
  Future<void> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  // Check if user is logged in
  Future<bool> isUserLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userKey);
  }

  // Get stored user data
  Future<UserModel?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userJson = prefs.getString(_userKey);
    if (userJson != null) {
      log(userJson);
      return UserModel.fromJson(userJson);
    }
    return null;
  }
}
