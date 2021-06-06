import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences sharedPreferences;

  static init()async{
    sharedPreferences= await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({String key,dynamic data}){
    if(data is int){
      return sharedPreferences.setInt(key, data);
    }else if(data is String){
      return sharedPreferences.setString(key, data);
    }else if(data is bool){
      return sharedPreferences.setBool(key, data);
    }else{
      return sharedPreferences.setDouble(key, data);
    }
  }

  static dynamic getData({String key}){
    return sharedPreferences.get(key);
  }
}