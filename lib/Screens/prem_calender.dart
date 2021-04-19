import 'package:flutter/material.dart';
import 'package:insuranceproject2/utils/auth_utils.dart';
import 'package:insuranceproject2/utils/network_utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/premium_calender_dashboard.dart';
import '../Components/drawer.dart';
import '../API_Handler/get_user_details.dart';
import '../Models/user.dart';
import 'loading_screen.dart';

class PremCalender extends StatefulWidget {
  static final String routeName = 'premcal';
  @override
  _PremCalenderState createState() => _PremCalenderState();
}

class _PremCalenderState extends State<PremCalender> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  SharedPreferences _sharedPreferences;
  var _name, _id;
  bool _isLoading = true;
  String totPremium = '0';
  String year;
  List premCal = new List(12);
  @override
  void initState() {
    super.initState();
    _fetchSessionAndNavigate();
  }

  _fetchSessionAndNavigate() async {
    _sharedPreferences = await _prefs;
    String authToken = AuthUtils.getToken(_sharedPreferences);
    _id = _sharedPreferences.getString(AuthUtils.userIdKey);
    _name = _sharedPreferences.getString(AuthUtils.nameKey);

    if (authToken == null) {
      _logout();
    }

    _fetchHome(authToken);
  }

  _fetchHome(String authToken) async {
    _showLoading();
    var responseJson =
        await NetworkUtils.fetch(authToken, '/user/getPremiumCal');

    var testResponseJson =
        await NetworkUtils.fetch1(authToken, '/crud/FPOLMASTER/get');

    if (responseJson['valid']) {
      print(responseJson);
      setState(() {
        for (int i = 0; i < 12; i++) {
          premCal[i] = {'premium': '0'};
        }

        year = responseJson['body']['year'];
        responseJson['body']['premCalendar'].forEach((k, v) {
          premCal[int.parse(k.substring(4, 6)) - 1]['premium'] = v;
        });
        totPremium = responseJson['body']['totPremium'];
        _isLoading = false;
      });
    } else if (responseJson['networkError']) {
      NetworkUtils.showSnackBar(
          _scaffoldKey, "network error..please try again later");
    } else {
      NetworkUtils.showSnackBar(_scaffoldKey, "server response error");
    }
  }

  _logout() {
    NetworkUtils.logoutUser(_scaffoldKey.currentContext, _sharedPreferences);
  }

  _showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  _hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(
          mobile: _id, name: _name, sharedPreferences: _sharedPreferences),
      appBar: AppBar(
        title: Text('Premium Calender'),
      ),
      body: _isLoading
          ? LoadingScreen()
          : ListView(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.lightBlueAccent,
                  child: Column(
                    children: [
                      //Text('Premium Calender'),
                      //Text('of'),
                      Text(
                        "$_name",
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                ),
                PremiumDashboard(year: year, premCal: premCal),
              ],
            ),
    );
  }
}
