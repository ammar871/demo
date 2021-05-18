
import 'package:shared_preferences/shared_preferences.dart';

class ShardPreferencesEditor{


  final String USER_TOKEN = "auth_token";
  final String USER_LANG_KEY = "lang";
  final String USER_ID = "uesr_id";
   final String USER_IS_LOGIN = "uesr_login";

//set data into shared preferences like this
  Future<void> setAuthToken(String authToken) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(this.USER_TOKEN, authToken);
  }

//get value from shared preferences
  Future<String> getAuthToken() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  String authToken;
  authToken = pref.getString(this.USER_TOKEN) ?? null;
  return authToken;
  }

  //set data into shared preferences like this
  Future<void> setlang(String saveLang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.USER_LANG_KEY, saveLang);
  }

//get value from shared preferences
  Future<String> getlang() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String langsaveed;
    langsaveed = pref.getString(this.USER_LANG_KEY) ?? null;
    return langsaveed;
  }


  //set data into shared preferences like this
  Future<void> setUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.USER_ID, userId);
  }

//get value from shared preferences
  Future<String> getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String userId;
    userId = pref.getString(this.USER_ID) ?? null;
    return userId;
  }



   //set data into shared preferences like this
  Future<bool> setIsLogin(bool islogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(this.USER_IS_LOGIN, islogin);
  }

//get value from shared preferences
  Future<bool> getIsLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool logined = false;
    logined = pref.getBool(this.USER_IS_LOGIN) ?? null;
    return logined;
  }
}