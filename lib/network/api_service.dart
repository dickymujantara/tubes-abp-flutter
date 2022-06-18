import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tubes_flutter/model/tourist_attraction.dart';

class ApiService {
  Future<List<Attraction>?> getTourists() async {
    // try {
    var client = http.Client();

    var url = Uri.parse(
        'http://7018-180-244-129-247.ngrok.io/api/tourist/attraction/list');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return attractionFromJson(json);
    }
    // } catch (e) {
    //   log(e.toString());
    // }
  }
}
