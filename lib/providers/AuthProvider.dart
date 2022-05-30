import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:saharago_b2b/helper/app_urls.dart';
import 'package:saharago_b2b/helper/shared_preferences.dart';
import 'package:saharago_b2b/models/SignInModel.dart';
import 'package:saharago_b2b/models/SignUpModel.dart';
import 'package:saharago_b2b/models/UserModel.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
    notifyListeners();
  }

  Status get registeredInStatus => _registeredInStatus;

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
    notifyListeners();
  }

  Future<FutureOr> register(SignUpBody signUpBody) async {
    // final Map<String, dynamic> apiBodyData = {
    //   'email': email,
    //   'password': password
    // };
    Uri url = Uri.parse(AppUrl.register);

    return await post(url,
            body: json.encode(signUpBody.toJson()),
            headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  // notify(){
  //   notifyListeners();
  // }

  static Future<FutureOr> onValue(Response response) async {
    var result;

    final Map<String, dynamic> responseData = json.decode(response.body);

    print(responseData);

    if (response.statusCode == 200) {
      var userData = responseData['data'];

      // now we will create a user model
      UserModel authUser = UserModel.fromJson(responseData);

      // now we will create shared preferences and save data
      UserPreferences().saveUser(authUser);

      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': 'Successfully registered',
        'data': responseData
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> login(SignInBody signInBody) async {
    var result;

    Map<String, String>? headers = {
      'Content-Type': 'application/json',
    };
    var _loggedInStatus = Status.Authenticating;
    notifyListeners();
    Uri url = Uri.parse(AppUrl.login);

    Response response = await post(
      url,
      body: json.encode(signInBody.toJson()),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      responseData.forEach((key, value) {
        debugPrint('$key: $value');
      });

      var userData = responseData['Content'];

      UserModel authUser = UserModel.fromJson(userData);

      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }

    return result;
  }

  static onError(error) {
    print('the error is ${error.detail}');
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
