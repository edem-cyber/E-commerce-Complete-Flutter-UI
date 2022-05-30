import 'package:saharago_b2b/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // prefs.setInt('userId', user.userId);
    prefs.setString('name', user.name);
    prefs.setString('id', user.id);
    prefs.setString('email', user.email);
    prefs.setString('phone_number', user.phone_number);
    // prefs.setString('type',user.type);
    prefs.setString('token', user.token);

    return prefs.commit();
  }

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? id = prefs.getInt("id") as String?;
    String? name = prefs.getString("name");
    String? email = prefs.getString("email");
    String? phone_number = prefs.getString("phone_number");
    // String? type = prefs.getString("type");
    String? token = prefs.getString("token");
    // String? renewalToken = prefs.getString("renewalToken");

    return UserModel(
        name: name!,
        email: email!,
        phone_number: phone_number!,
        // type: type,
        token: token!,
        // renewalToken: renewalToken,
        // id: id,
        // createdAt: createdAt,
        // updatedAt: updatedAt,
        id: id!);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('id');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('phone_number');
    prefs.remove('type');
    prefs.remove('token');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token!;
  }
}
