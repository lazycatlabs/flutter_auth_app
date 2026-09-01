import 'package:flutter_auth_app/core/api/dio_client.dart';

class DioClientDummyJson extends DioClient {
  DioClientDummyJson({super.isUnitTest})
    : super(baseUrl: 'https://dummyjson.com');
}
