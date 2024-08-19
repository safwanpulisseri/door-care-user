import 'dart:developer';
import 'package:dio/dio.dart';

class CancelABookedPendingService {
  final String _link = "http://10.0.2.2:3000/api/user/"; // For Android

  final Dio dio = Dio();
  Future<Response<dynamic>> cancelBookedPendingService({
    required String token,
    required String bookingId,
  }) async {
    log("on cancelBookedPendingService in dio");
    try {
      var response = await dio.patch(
        "${_link}cancelBooking",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'workerId': null,
          'status': 'cancel',
          '_id': bookingId,
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
      log("Error cancelBookedPendingService: $e");
      throw Exception("Failed to cancelBookedPendingService");
    }
  }
}
