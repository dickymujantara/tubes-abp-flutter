import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_flutter/common/constants.dart';
import 'package:tubes_flutter/model/story_response.dart';
import 'package:tubes_flutter/model/story_detail.dart';
import 'package:tubes_flutter/model/story_create.dart';
import '../network/remote_data_source.dart';
import 'dart:developer';

class StoryProvider with ChangeNotifier {
  String? _idStory;

  late final SharedPreferences _preferences;

  String? get idStory => _idStory;

  Future<void> init() async{
    _preferences = await SharedPreferences.getInstance();
    _idStory = _preferences.getString(keyIdStory);
  }

  Future<void> setStory({ required String idStory}) async{
    _idStory = idStory;
  }

  Future<StoryResponse> getStory() async {
    return await RemoteDataSource.getStory();
  }

  Future<StoryDetail> getStoryDetail() async {
    return await RemoteDataSource.getStoryDetail(id: _idStory!);
  }

  Future<StoryCreate> createStory({
    required String idUser,
    required String title,
    required String content,
    File? image,
    required String likeCount,
    
  }) async {
    StoryCreate storyCreate = await RemoteDataSource.createStory(
      idUser: idUser,
      title: title,
      content: content,
      image: image,
      likeCount: "0",
    );
    log('data : $storyCreate');
    return storyCreate;
  }

  Future<StoryCreate> updateStory({
    required String idUser,
    required String title,
    required String content,
    File? image,
    required String likeCount,
    
  }) async {
    StoryCreate storyCreate = await RemoteDataSource.updateStory(
      idUser: idUser,
      idStory: _idStory!,
      title: title,
      content: content,
      image: image,
      likeCount: likeCount,
    );
    log('data : $storyCreate');
    return storyCreate;
  }
}