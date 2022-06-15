import 'package:dio/dio.dart';
import '../model/user_response.dart';
import '../model/story_response.dart';
import '../common/constants.dart';

class RemoteDataSource{
 static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      contentType: 'application/json',
      validateStatus: (int? code) {
        return true;
      },
    ),
  );

  static Future<UserResponse> login({
    required String username,
    required String password
  }) async {
    Response<String> response = await _dio.post<String>(
      '/login',
      data: {
        'username' : username,
        'password' : password
      }
    );
    print(response);
    return userFromJson(response.data ?? "");
  }

  static Future<Stories> getHistory() async {

    Response<String> response = await _dio.get<String>('/read/story');
    return storiesFromJson(response.data ?? "");
  }

}