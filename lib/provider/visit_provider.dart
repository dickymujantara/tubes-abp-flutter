import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/visit_response.dart';
import 'package:tubes_flutter/model/visit_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_flutter/common/constants.dart';

import '../network/remote_data_source.dart';

class VisitProvider with ChangeNotifier {
  String? _idVisit;

  late final SharedPreferences _preferences;
  String? get idVisit => _idVisit;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    _idVisit = _preferences.getString(keyIdVisit);
  }

  Future<void> setStory({required String idVisit}) async {
    await _preferences.setString(keyIdVisit, idVisit);
  }

  Future<VisitResponse> getVisit() async {
    return await RemoteDataSource.getVisit();
  }

  Future<VisitDetail> getVisitDetail() async {
    return await RemoteDataSource.getVisitDetail(id: _idVisit!);
  }
}
