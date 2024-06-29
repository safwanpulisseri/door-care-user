import 'dart:developer';

import 'package:door_care/feature/auth/data/service/local/auth_local_service.dart';

import '../service/remote/auth_remote_service.dart';
import '../model/user_model.dart';

class AuthRepo {
  final AuthRemoteService _authService;
  final AuthLocalService _authLocalService;

  AuthRepo(this._authService, this._authLocalService);

  Future<UserModel> emailSignIn({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _authService.signIn(
        email: email,
        password: password,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            response.data['data'] as Map<String, dynamic>;
        final UserModel userModel = UserModel.fromMap(responseData);
        _authLocalService.saveUser(userModel);
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
      var response = await _authService.signUp(
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
