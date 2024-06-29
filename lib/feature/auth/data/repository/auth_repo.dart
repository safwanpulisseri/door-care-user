import 'dart:developer';

import '../service/auth_service.dart';
import '../model/user_model.dart';

class AuthRepo {
  final AuthService _AuthService;
  AuthRepo(this._AuthService);

  Future<UserModel> emailSignIn({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _AuthService.signIn(
        email: email,
        password: password,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response.data['data'] as Map<String, dynamic>;
        final UserModel userModel = UserModel.fromMap(responseData);
        return userModel;
      } else {
        log('Login failed${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }

  Future<UserModel> userRegistration({
    required String name,
    required String mobile,
    required String email,
    required String password,
  }) async {
    try {
      var response = await _AuthService.signUp(
        name: name,
        mobile: mobile,
        email: email,
        password: password,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response.data['user'] as Map<String, dynamic>;
        final UserModel userModel = UserModel.fromMap(responseData);
        return userModel;
      } else {
        log('Login failed${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }
}
