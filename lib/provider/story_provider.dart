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

  late final SharedPreferences _preferences;

  String? get idStory => _idStory;

  Future<void> init() async{
    _preferences = await SharedPreferences.getInstance();
    _idStory = _preferences.getString(keyIdStory);
  }

  Future<void> setStory({ required String idStory }) async{
    await _preferences.setString(keyIdStory, idStory);
  }

  Future<StoryResponse> getStory() async {
    return await RemoteDataSource.getStory();
  }

  Future<StoryDetail> getStoryDetail() async {
    return await RemoteDataSource.getStoryDetail(id: _idStory!);
  }

  Future<StoryCreate> createStory({
    required String iduser,
    required String title,
    required String content,
    File? image,
    required String likecount,
    
  }) async {
    StoryCreate storyCreate = await RemoteDataSource.createStory(
      iduser: iduser,
      title: title,
      content: content,
      image: image,
      likecount: likecount,
    );
    return storyCreate;
  }
}