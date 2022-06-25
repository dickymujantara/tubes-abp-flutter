import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tubes_flutter/network/remote_data_source.dart';
import 'package:tubes_flutter/model/tourist_attraction.dart';

class TouristProvider with ChangeNotifier{

  Future<TouristAttractionResponse> getTourist() async {
    return await RemoteDataSource.getTourists();
  }

}