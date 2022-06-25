import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/create_visit_response.dart';
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

  Future<void> setVisit({required String idVisit}) async {
    _idVisit = idVisit;
  }

  Future<VisitResponse> getVisit() async {
    return await RemoteDataSource.getVisit();
  }

  Future<VisitDetail> getVisitDetail() async {
    return await RemoteDataSource.getVisitDetail(id: _idVisit!);
  }

  Future<CreateVisitResponse> createVisit({
    required idUser,
    required visitDate
  }) async{
    return await RemoteDataSource.createVisit(idUser: idUser, idAttraction: _idVisit!, visitDate: visitDate);
  }

}
