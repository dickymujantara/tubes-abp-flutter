import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_flutter/common/constants.dart';
import 'package:tubes_flutter/model/story_response.dart';
import 'package:tubes_flutter/model/story_detail.dart';
import 'package:tubes_flutter/model/story_create.dart';
import '../network/remote_data_source.dart';

class StoryProvider with ChangeNotifier {
  String? _idStory;
  String? _idUser;

  late final SharedPreferences _preferences;

  String? get idStory => _idStory;
  String? get idUser => _idUser;

  Future<void> init() async{
    _preferences = await SharedPreferences.getInstance();
    _idStory = _preferences.getString(keyIdStory);
    _idUser = _preferences.getString(keyId);
  }

  Future<void> setStory({ required String idStory, required String idUser}) async{
    await _preferences.setString(keyIdStory, idStory);
    await _preferences.setString(keyId, idUser);
  }

  Future<StoryResponse> getStory() async {
    return await RemoteDataSource.getStory();
  }

  Future<StoryDetail> getStoryDetail() async {
    return await RemoteDataSource.getStoryDetail(id: _idStory!);
  }

  Future<StoryCreate> createStory({
    required String title,
    required String content,
    File? image,
    required String likeCount,
    
  }) async {
    StoryCreate storyCreate = await RemoteDataSource.createStory(
      idUser: _idUser!,
      title: title,
      content: content,
      image: image,
      likeCount: "0",
    );
    return storyCreate;
  }
}