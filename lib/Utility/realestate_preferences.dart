
import 'package:shared_preferences/shared_preferences.dart';

class RealEstatePreferences{

  static setUser(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("USER", user);
  }

  static Future<String> getUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('USER');
  }

  static setUserId(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("USER_ID", userId);
  }

  static Future<int> getUserId() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('USER_ID');
  }

  static Future<bool> clearAllPreferences() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
  
  static setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("TOKEN", token);
  }

  static Future<String> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('TOKEN');
  }

  static setUserName(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("USERNAME", token);
  }

  static Future<String> getUserName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('USERNAME');
  }
}