import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class API {

  Future<int?> getUserByMobile(String mobile , String password) async {
    try {
      final response = await Dio().post('https://staging.evitalrx.in:3000/v3/login',data: {
        'mobile':mobile,
        'password' : password
      });
      return response.statusCode;
    } catch (e) {
      return 0;
    }
  }
}
// // here _dio is private
// Dio _dio = Dio();
//
// API() {
//   _dio.options.baseUrl = ;
//   // the interceptor is intercept each request
//   _dio.interceptors
//       .add(PrettyDioLogger()); // we add PrettyDioLogger as intercept
// }
// // now _dio is private so how can we use in outside
// // for that we create a getter get sendRequest
// Dio get sendResponse => Dio();