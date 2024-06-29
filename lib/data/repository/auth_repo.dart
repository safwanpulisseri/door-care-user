import 'dart:developer';

import '../data_provider/auth_data.dart';
import '../model/user_model.dart';

class AuthRepo {
  final AuthData _authData;
  AuthRepo(this._authData);

  Future<UserModel> emailSignIn({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _authData.signIn(
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
      var response = await _authData.signUp(
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
