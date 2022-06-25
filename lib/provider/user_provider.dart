import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tubes_flutter/common/constants.dart';
import 'package:tubes_flutter/model/user_profile_response.dart';
import 'package:tubes_flutter/model/user_register_response.dart';
import 'package:tubes_flutter/network/remote_data_source.dart';
import '../model/user_response.dart';

class UserProvider with ChangeNotifier{
  String? _token;
  String? _id;
  String? _username;
  String? _name;
  String? _address;
  String? _email;
  String? _role;
  String? _phoneNumber;

  late final SharedPreferences _preferences;

  String? get token => _token;
  String? get id => _id;
  String? get username => _username;
  String? get name => _name;
  String? get address => _address;
  String? get email => _email;
  String? get role => _role;
  String? get phoneNumber => _phoneNumber;

  Future<void> init() async{
    _preferences = await SharedPreferences.getInstance();
    _token = _preferences.getString(keyToken);
    _id = _preferences.getString(keyId);
    _username = _preferences.getString(keyUsername);
    _name = _preferences.getString(keyName);
    _address = _preferences.getString(keyAddress);
    _email = _preferences.getString(keyEmail);
    _role = _preferences.getString(keyRole);
    _phoneNumber = _preferences.getString(keyPhonenumber);
  }

  Future<UserResponse> login({
    required String username,
    required String password
  }) async{
    UserResponse auth = await RemoteDataSource.login(username: username, password: password);
    UserProfileResponse profile = await RemoteDataSource.profile(id: auth.data.user.id.toString());

    _token = auth.data.accessToken;
    _id = auth.data.user.id.toString();
    _username = auth.data.user.username;
    _name = auth.data.user.name;
    _address = auth.data.user.address;
    _email = auth.data.user.email;
    _role = auth.data.user.role;
    _phoneNumber = profile.data.phoneNumber;

    await _preferences.setString(keyToken,_token!);
    await _preferences.setString(keyUsername,_username!);
    await _preferences.setString(keyName,_name!);
    await _preferences.setString(keyAddress,_address!);
    await _preferences.setString(keyEmail,_email!);
    await _preferences.setString(keyRole,_role!);
    await _preferences.setString(keyId,_id!);
    await _preferences.setString(keyPhonenumber,_phoneNumber!);

    return auth;
  }

  Future<UserRegisterResponse> register({
    required String username,
    required String name,
    required String email,
    required String address,
    required String password,
    required String conPassword,
  }) async {

    UserRegisterResponse register = await RemoteDataSource.register(
      username: username, 
      name: name, 
      email: email, 
      address: address, 
      password: password, 
      conPassword: conPassword
    );

    return register;

  }
  
  Future<void> logout() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
  }

}