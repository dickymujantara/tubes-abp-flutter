import 'package:dio/dio.dart';
import '../model/tourist_attraction.dart';
import '../model/user_response.dart';
import '../model/story_response.dart';
import '../model/user_register_response.dart';
import '../model/user_profile_response.dart';
import '../common/constants.dart';

class RemoteDataSource {
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

  static Future<UserResponse> login(
      {required String username, required String password}) async {
    Response<String> response = await _dio.post<String>('/login',
        data: {'username': username, 'password': password});
    print(response.data);
    return userResponseFromJson(response.data!);
  }
  
  static Future<UserRegisterResponse> register({
    required String username,
    required String name,
    required String email,
    required String address,
    required String password,
    required String conPassword,
  }) async {
    Response<String> response = await _dio.post<String>('/register',
    data:{
      'username' : username,
      'name' : name,
      'email' : email,
      'address' : address,
      'role' : "user",
      'password' : password,
      'conPassword' : conPassword
    });

    return userRegisterResponseFromJson(response.data!);
  }

  static Future<UserProfileResponse> profile({
    required String id
  }) async {
    Response<String> response = await _dio.get<String>('/user/profile/' + id);
    return userProfileResponseFromJson(response.data!);
  }

  static Future<Stories> getHistory() async {
    Response<String> response = await _dio.get<String>('/read/story');
    return storiesFromJson(response.data ?? "");
  }

  // static Future<Attractions> getTourists() async {
  //   Response<String> response =
  //       await _dio.get<String>('tourist/attraction/list');
  //   return attractionsFromJson(response.data ?? "");
  // }
}
