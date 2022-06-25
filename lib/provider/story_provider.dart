import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/story_response.dart';
import 'package:tubes_flutter/model/story_detail.dart';
import 'package:tubes_flutter/model/story_create.dart';

import '../network/remote_data_source.dart';

class StoryProvider extends ChangeNotifier {
  Future<StoryResponse> getStory() async {
    return await RemoteDataSource.getStory();
  }

  Future<StoryDetail> getStoryDetail() async {
    return await RemoteDataSource.getStoryDetail(id: toString());
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