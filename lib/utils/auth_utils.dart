import 'package:shared_preferences/shared_preferences.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'dart:io' show Platform;
import 'package:uuid/uuid.dart';

class AuthUtils {
  static final String endPoint = '/auth/signin';

  // Keys to store and fetch data from SharedPreferences
  static final String authTokenKey = 'accessToken';
  static final String userIdKey = 'userid';
  static final String nameKey = 'username';
  static final String imeiKey = 'imeinumber';
  static String imeinumber;
  //static final String roleKey = 'role';

  static String getToken(SharedPreferences prefs) {
    return prefs.getString(authTokenKey);
  }

  static insertDetails(SharedPreferences prefs, var response) {
    prefs.setString(authTokenKey, response['accessToken']);
    //var user = response['user'];
    prefs.setString(userIdKey, response['userid']);
    prefs.setString(nameKey, response['username']);
  }

  static String getImei(SharedPreferences prefs) {
    return prefs.getString(imeiKey);
  }

  static putImei(SharedPreferences prefs) async {
    String imei = prefs.getString(imeiKey);
    if (imei == null) {
      print("came here null");
      if (Platform.isIOS) {
        imei = Uuid().v1();
        prefs.setString(imeiKey, imei);
      } else {
        List<String> multiImei = await ImeiPlugin.getImeiMulti();
        imei = multiImei.join(', ');
        prefs.setString(imeiKey, imei);
      }
    }

    imeinumber = '1234567890123456';
  }
}
