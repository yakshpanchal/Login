import 'package:dio/dio.dart';
class API {

  Future<dynamic?> getUserByMobile(String mobile ,  String device_id) async {
    try {
      final response = await Dio().post('https://staging.evitalrx.in:3000/v3/login/verify_number',data: {
        'mobile':mobile,
        'device_id' : device_id
      });
      return response.data;
    } catch (e) {
      return 0;
    }
  }
}