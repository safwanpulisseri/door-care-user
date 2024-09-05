import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class PayServiceRemote {
  final String _link = "http://10.0.2.2:3000/api/user/"; // For android

  final dio = Dio();

  Future<Response<dynamic>> createPayment({
    required num amount,
    required String bookingId,
    required String workerId,
  }) async {
    log("on dio");
    try {
      var response = await dio.post("${_link}payment", data: {
        'amount': amount,
        'bookingId': bookingId,
        'workerId': workerId,
      });
      log("success");
      return response;
    } catch (e) {
      log('Error during createPayment $e');
      throw Exception();
    }
  }
}
