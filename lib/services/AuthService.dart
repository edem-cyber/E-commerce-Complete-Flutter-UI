import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:saharago_b2b/helper/app_urls.dart';
import 'package:saharago_b2b/helper/shared_preferences.dart';
import 'package:saharago_b2b/models/SignInModel.dart';
import 'package:saharago_b2b/models/SignUpModel.dart';
import 'package:saharago_b2b/models/UserModel.dart';
import 'package:saharago_b2b/providers/AuthProvider.dart';

class AuthService extends ChangeNotifier {
  // String baseUrl = 'https://shamo-backend.buildwithangga.id/api';
  // String baseUrl = "https://saharago.app/api";
  static var client = http.Client();

  Future<void> register(
      //declare all parameters here
      SignUpBody signUpBody) async {
    //start putting together request to post here
    // var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(
      signUpBody.toJson(),
    );
    Status status = Status.Registering;

    //start putting together response here
    return await http
        .post(
          Uri.parse(AppUrl.register),
          headers: headers,
          body: body,
        )
        .then(onValue)
        .catchError(onError);
    // return response;

    // debugPrint(response.body);

    // if (response.statusCode == 200) {
    //   var data = jsonDecode(response.body)['data'];
    //   UserModel userModel = UserModel.fromJson(data['user']);
    //   userModel.token = data['token_type'] + " " + data['access_token'];

    //   return userModel;
    // } else {
    //   throw Exception('Sign Up Error');
    // }
  }

  Future<UserModel> login(SignInBody signInBody) async {
    // var url = '$baseUrl/login';
    Uri url = Uri.parse(AppUrl.login);
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(
      signInBody.toJson(),
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    debugPrint(response.body + "/n" + response.statusCode.toString());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel userModel = UserModel.fromJson(data['user']);
      userModel.token = data['token'];

      return userModel;
    } else {
      throw Exception('Login Error');
    }
  }

  Future<UserModel> logout() async {
    // var url = '$baseUrl/logout';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        // 'token': userModel.token,
      },
    );

    var response = await http.post(
      Uri.parse(AppUrl.logout),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel userModel = UserModel.fromJson(data['user']);
      userModel.token = data['token_type'] + " " + data['access_token'];

      return userModel;
    } else {
      throw Exception('Login Error');
    }
  }

  static Future<FutureOr> onValue(response) async {
    var result;

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    debugPrint(responseData.toString());

    if (response.statusCode == 200) {
      var userData = responseData['data'];

      UserModel authUser = UserModel.fromJson(userData);

      UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': 'Sign Up Success',
        'data': authUser,
      };
    } else {
      result = {
        'status': false,
        'message': 'Sign Up Error',
        'data': responseData,
      };
    }

    return result;

    // void logout() {}
  }

  static onError(error) {
    print('the error is ${error.detail.toString()}');
    return {
      'status': false,
      'message': 'Sign Up Error',
      'data': error.toString(),
    };
  }
}
