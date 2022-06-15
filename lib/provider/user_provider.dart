import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_flutter/common/constants.dart';
import 'package:tubes_flutter/network/remote_data_source.dart';
import '../model/user_response.dart';

class UserProvider with ChangeNotifier{
  String? _token;
  String? _username;
  String? _name;
  String? _address;
  String? _email;
  String? _role;

  late final SharedPreferences _preferences;

  String? get token => _token;
  String? get username => _username;
  String? get name => _name;
  String? get address => _address;
  String? get email => _email;
  String? get role => _role;

  Future<void> init() async{
    _preferences = await SharedPreferences.getInstance();
    _token = _preferences.getString(keyToken);
    _username = _preferences.getString(keyUsername);
    _name = _preferences.getString(keyName);
    _address = _preferences.getString(keyAddress);
    _email = _preferences.getString(keyEmail);
    _role = _preferences.getString(keyRole);
  }

  Future<UserResponse> login({
    required String username,
    required String password
  }) async{
    UserResponse auth = await RemoteDataSource.login(username: username, password: password);
    print("===Provider===");
    print(auth);
    print("===-------===");
    _token = auth.data?.token;
    _username = auth.data?.user?.username;
    _name = auth.data?.user?.name;
    _address = auth.data?.user?.address;
    _email = auth.data?.user?.email;
    _role = auth.data?.user?.role;

    if (_token != null) {
      await _preferences.setString(keyToken,_token!);
      await _preferences.setString(keyUsername,_username!);
      await _preferences.setString(keyName,_name!);
      await _preferences.setString(keyAddress,_address!);
      await _preferences.setString(keyEmail,_email!);
      await _preferences.setString(keyRole,_role!);
    }

    return auth;
  }

}