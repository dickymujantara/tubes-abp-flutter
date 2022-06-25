import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/visit_response.dart';
import 'package:tubes_flutter/model/visit_detail.dart';

import '../network/remote_data_source.dart';

class VisitProvider extends ChangeNotifier {
  Future<VisitResponse> getVisit() async {
    return await RemoteDataSource.getVisit();
  }

  Future<VisitDetail> getVisitDetail() async {
    return await RemoteDataSource.getVisitDetail(id: toString());
  }
}
