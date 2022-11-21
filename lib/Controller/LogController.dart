import 'package:shared_preferences/shared_preferences.dart';

class Logout {
  static logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
    prefs.remove("password");
  }
}
