import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tubes_flutter/model/story_detail.dart';
import 'package:tubes_flutter/model/story_create.dart';
import '../model/tourist_attraction.dart';
import '../model/user_response.dart';
import '../model/story_response.dart';
import 'package:tubes_flutter/model/visit_detail.dart';
import '../model/visit_response.dart';
import '../model/user_register_response.dart';
import '../model/user_profile_response.dart';
import '../model/user_update_response.dart';
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
    Response<String> response = await _dio.post<String>('/register', data: {
      'username': username,
      'name': name,
      'email': email,
      'address': address,
      'role': "user",
      'password': password,
      'conPassword': conPassword
    });

    return userRegisterResponseFromJson(response.data!);
  }

  static Future<UserProfileResponse> profile({required String id}) async {
    Response<String> response = await _dio.get<String>('/user/profile/' + id);
    return userProfileResponseFromJson(response.data!);
  }

  static Future<UserUpdateResponse> updateProfile(
      {required String id,
      required String name,
      required String email,
      required String phoneNumber,
      required String address}) async {
    Response<String> response = await _dio.post<String>('/user/profile/' + id,
        data: {
          "name": name,
          "email": email,
          "phoneNumber": phoneNumber,
          "address": address
        });
    return userUpdateResponseFromJson(response.data!);
  }

  static Future<StoryResponse> getStory() async {
    Response<String> response = await _dio.get<String>('/read/story');
    return storyResponseFromJson(response.data!);
  }

  static Future<StoryDetail> getStoryDetail({required String id}) async {
    Response<String> response = await _dio.get<String>('/edit/story/' + id);
    return storyDetailFromJson(response.data!);
  }

  static Future<StoryCreate> createStory({
    required String idUser,
    required String title,
    required String content,
    File? image,
    required String likeCount,
  }) async {
    var formData = FormData.fromMap({
        'id_user' : idUser,
        'title': title,
        'content': content,
        if (image != null)
        'image': await MultipartFile.fromFile(image.path),
        'like_count': "0",
    });
    Response<String> response = await _dio.post<String>(
      '/create/story',
      data: formData,
    );
    return storyCreateFromJson(response.data!);
  }

  static Future<TouristAttractionResponse> getTourists() async {
    Response<String> response =
        await _dio.get<String>('/tourist/attraction/list');
    return touristAttractionResponseFromJson(response.data ?? "");
  }

  static Future<VisitResponse> getVisit() async {
    Response<String> response = await _dio.get<String>('/read/visit');
    return visitResponseFromJson(response.data!);
  }

  static Future<VisitDetail> getVisitDetail({required String id}) async {
    Response<String> response = await _dio.get<String>('/create/visit/' + id);
    return visitDetailFromJson(response.data!);
  }
}
