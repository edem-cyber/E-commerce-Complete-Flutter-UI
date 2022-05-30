import 'package:flutter/cupertino.dart';
import 'package:saharago_b2b/models/UserModel.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user =
      UserModel(email: '', name: '', phone_number: '', id: '', token: '');

  UserModel get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
