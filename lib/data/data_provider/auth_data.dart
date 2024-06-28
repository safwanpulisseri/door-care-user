import 'dart:developer';
import 'package:dio/dio.dart';

class AuthData {
  final String _link = "http://10.0.2.2:3000/api/user/"; // For android
  //final String _link = "http://127.0.0.1:3000/api/user/login"; // For iOS simulator
  final dio = Dio();
  Future<Response<dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    log("on dio");
    try {
      var response = await dio.post("${_link}login", data: {
        'email': email,
        'password': password,
      });

      return response;
    } catch (e) {
      log('Error during login $e');
      throw Exception();
    }
  }

  Future<Response<dynamic>> signUp({
    required String name,
    required String mobile,
    required String email,
    required String password,
  }) async {
    log("signup in dio");
    try {
      var response = await dio.post("${_link}signup", data: {
        'name': name,
        'mobile': mobile,
        'email': email,
        'password': password,
      });
      return response;
    } catch (e) {
      log('Error during sign up$e');
      throw Exception();
    }
  }
}
