import 'package:shared_preferences/shared_preferences.dart';

class UserRepo {
  //we don't use try catch here to provide error faced by the repo calls to be send to the bloc.



  setIsLogin(bool val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool('IS_LOGGED_IN', val);
  }
  Future<bool?> getLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('IS_LOGGED_IN') ?? false;
  }
}
