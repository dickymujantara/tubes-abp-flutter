import 'dart:io';
import 'package:dio/dio.dart';

class RemoteDataSource{
 static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "",
      responseType: ResponseType.plain,
      contentType: 'multipart/form-data',
      validateStatus: (int? code) {
        return true;
      },
    ),
  );
}