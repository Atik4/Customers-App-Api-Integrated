import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'auth_utils.dart';

class NetworkUtils {
  static final String host = productionHost;
  //static final String host = developmentHost;
  //static final String productionHost = 'https://futurainstech-mobile.herokuapp.com';
  static final String productionHost = 'http://103.14.123.116:8080/mobileapi';
  static final String developmentHost = 'http://192.168.1.178:8080';

  static dynamic authenticateUser(
      String email, String otp, String password) async {
    var uri = host + AuthUtils.endPoint;

    var body = jsonEncode({
      'username': email,
      'otp': otp,
      'password': password,
      'imeinumber': AuthUtils.imeinumber
    });

    try {
      final response = await http.post(uri,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 200 || response.statusCode == 401) {
        final responseJson = json.decode(response.body);

        return responseJson;
      } else {
        final responseJson = {'status': 'ERROR', 'body': 'server error'};

        return responseJson;
      }
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic postWithBody(var bodyData, var authtoken, var endPoint) async {
    var uri = host + endPoint;

    var body = jsonEncode(bodyData);

    try {
      final response = await http.post(uri,
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': 'Bearer $authtoken'
          },
          body: body);

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        responseJson['valid'] = true;
        return responseJson;
      } else {
        final responseJson = {
          'valid': false,
          'networkError': false,
          'message': json.decode(response.body)['body']
        };

        return responseJson;
      }
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        final responseJson = {'valid': false, 'networkError': true};
        return responseJson;
      } else {
        return null;
      }
    }
  }

  static logoutUser(BuildContext context, SharedPreferences prefs) {
    prefs.setString(AuthUtils.authTokenKey, null);
    prefs.setInt(AuthUtils.userIdKey, null);
    prefs.setString(AuthUtils.nameKey, null);
    Navigator.of(context).pushReplacementNamed('/');
  }

  static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(message ?? 'You are offline'),
    ));
  }

  static fetch(var authToken, var endPoint) async {
    var uri = host + endPoint;

    try {
      final response = await http.get(
        uri,
        headers: {
          //"Content-Type": "application/json",
          //'Accept': 'application/json',
          'Authorization': 'Bearer $authToken'
        },
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        responseJson['valid'] = true;
        return responseJson;
      } else {
        final responseJson = {'valid': false, 'networkError': false};
        print(response);
        return responseJson;
      }
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        final responseJson = {'valid': false, 'networkError': true};
        return responseJson;
      } else {
        return null;
      }
    }
  }

  static fetch1(var authToken, var endPoint) async {
    var uri = host + endPoint;

    try {
      final response = await http.get(
        uri,
        headers: {
          //"Content-Type": "application/json",
          'Accept': 'application/json',
          'Fit-screen': 'ALL',
          'Authorization': 'Bearer $authToken'
        },
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        // responseJson['valid'] = true;
        return responseJson;
      } else {
        final responseJson = {'valid': false, 'networkError': false};
        print(response);
        return responseJson;
      }
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        final responseJson = {'valid': false, 'networkError': true};
        return responseJson;
      } else {
        return null;
      }
    }
  }

  static validateTokenWithServer(String authtoken) async {
    Map<String, String> queryParams = {
      'imeinumber': AuthUtils.imeinumber,
    };
    String queryString = Uri(queryParameters: queryParams).query;

    var uri = host + '/user/getUserDetails' + '?' + queryString;

    try {
      final response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $authtoken'
        },
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        responseJson['body']['accessToken'] = authtoken;
        responseJson['valid'] = true;
        return responseJson;
      } else {
        final responseJson = {'valid': false, 'networkError': false};

        return responseJson;
      }
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        final responseJson = {'valid': false, 'networkError': true};
        return responseJson;
      } else {
        return null;
      }
    }
  }

  static void logoutUser1(SharedPreferences prefs) {
    prefs.setString(AuthUtils.authTokenKey, null);
    prefs.setInt(AuthUtils.userIdKey, null);
    prefs.setString(AuthUtils.nameKey, null);
  }

  static generateOTP(String phone, String password) async {
    Map<String, String> queryParams = {
      'username': phone,
      'imeinumber': AuthUtils.imeinumber,
      'password': password
    };
    String queryString = Uri(queryParameters: queryParams).query;

    var uri = host + '/auth/generateOTP' + '?' + queryString;

    try {
      final response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        responseJson['valid'] = true;
        return responseJson;
      } else if (response.statusCode == 401 || response.statusCode == 400) {
        var responseJson = json.decode(response.body);
        responseJson['valid'] = false;
        return responseJson;
      } else {
        final responseJson = {'valid': false, 'body': 'internal server error'};

        return responseJson;
      }
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        final responseJson = {
          'valid': false,
          'body': 'network error.please try later'
        };
        return responseJson;
      } else {
        return null;
      }
    }
  }
}
