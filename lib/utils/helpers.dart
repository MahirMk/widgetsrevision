import 'package:shared_preferences/shared_preferences.dart';

class Helper {

  static String spIsUserLogin = "isLoggedIn";
  static String spFriend = "friend";

  static SharedPreferences? preferences;

  /// Saving Data To Shared Preference

  //*save when user is log in*/
  static Future<bool?> saveUserLogin(bool data) async {
    preferences = await SharedPreferences.getInstance();
    return preferences!.setBool(spIsUserLogin, data);
  }

  /*save friend response*/
  static Future<bool?> saveFriend(int? frd) async {
    preferences = await SharedPreferences.getInstance();
    return preferences!.setInt(spFriend, frd!);
  }

  /// fetching(get) data from shared preference

  /*get user is log in or not*/
  static Future<bool?>  getUserLogin() async {
    preferences = await SharedPreferences.getInstance();
    return preferences!.getBool(spIsUserLogin)?? false;
  }
  /*get friend value */
  static Future<int?> getFriend() async {
    preferences = await SharedPreferences.getInstance();
    return preferences!.getInt(spFriend);
  }
}