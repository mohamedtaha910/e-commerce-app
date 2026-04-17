import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://dummyjson.com/';
  final Dio dio;
  ApiService(this.dio);

  Future<dynamic> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
