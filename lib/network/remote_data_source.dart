import 'package:dio/dio.dart';
import '../model/user_response.dart';
import '../model/story_response.dart';

class RemoteDataSource{
 static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://touristenziel.herokuapp.com/api",
      responseType: ResponseType.plain,
      contentType: 'application/json',
      validateStatus: (int? code) {
        return true;
      },
    ),
  );

  static Future<UserLoginResponse> login({
    required String username,
    required String password
  }) async {
    Response<String> response = await _dio.post<String>(
      '/login',
      data: {
        username : username,
        password : password
      }
    );
    print(response);
    print("login");
    print(username);
    print(password);
    return userFromJson(response.data ?? "");
  }

  static Future<Stories> getHistory() async {

    Response<String> response = await _dio.get<String>('/read/story');
    return storiesFromJson(response.data ?? "");
  }

}