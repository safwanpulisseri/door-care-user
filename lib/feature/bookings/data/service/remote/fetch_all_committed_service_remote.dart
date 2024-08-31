import 'dart:developer';
import 'package:dio/dio.dart';

class FetchAllCommitedServiceRemote {
  // final String _link =
  //     "http://192.168.234.96:3000/api/worker/"; //For real device

  final String _link = "http://10.0.2.2:3000/api/user/"; // For Android

  final Dio dio = Dio();
  Future<Response<dynamic>> fetchCommitedServiceDetails({
    required String token,
    required String userId,
  }) async {
    log("on FetchAllCommitedServiceRemote in dio");
    try {
      var response = await dio.get(
        "${_link}getBookings",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'userId': userId,
          'status': 'commit',
          'workerId': null,
          'service': null,
        },
      );
      log("success");
      log("Response data: ${response.data}");
      return response;
    } catch (e) {
      if (e is DioException) {
        log("Error response data: ${e.response?.data}");
        log("Error response headers: ${e.response?.headers}");
        log("Error response status code: ${e.response?.statusCode}");
      }
      log("Error FetchAllCommitedServiceRemote: $e");
      throw Exception("Failed to FetchAllCommitedServiceRemote");
    }
  }
}
