import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/auth_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/network_utils.dart';
import './otp_screen.dart';
import 'loading_screen.dart';
import 'prem_calender.dart';

class LoginIn extends StatefulWidget {
  @override
  LoginInState createState() => new LoginInState();
}

class LoginInState extends State<LoginIn> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;
  bool _obscureText = true;
  bool _isLoading = false;
  TextEditingController _emailController, _passwordController;
  String _emailError, _passwordError;

  @override
  void initState() {
    super.initState();
    _fetchSessionAndNavigate();
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 250, 172, 1),
      key: _scaffoldKey,
      body: _isLoading
          ? new LoadingScreen()
          : Column(mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Image(
                    image: AssetImage('assets/icon.jpeg'),
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Enter your number',
                        errorText: _emailError,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          labelText: 'Enter your password',
                          errorText: _passwordError,
                          suffixIcon: new GestureDetector(
                            onTap: _togglePassword,
                            child: new Icon(Icons.remove_red_eye),
                          )),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.white30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      _generateOtp();
                    },
                    child: Text(
                      'SignIn',
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                  ),
                ]),
    );
  }

  _fetchSessionAndNavigate() async {
    _showLoading();
    _sharedPreferences = await _prefs;
    String authToken = AuthUtils.getToken(_sharedPreferences);
    await AuthUtils.putImei(_sharedPreferences);

    if (authToken != null) {
      var responseJson = await NetworkUtils.validateTokenWithServer(authToken);

      if (responseJson['valid']) {
        AuthUtils.insertDetails(_sharedPreferences, responseJson['body']);
        Navigator.of(_scaffoldKey.currentContext)
            .pushReplacementNamed(PremCalender.routeName);
      } else if (responseJson['networkError']) {
        NetworkUtils.showSnackBar(
            _scaffoldKey, "network error..please try again later");
      } else {
        NetworkUtils.showSnackBar(
            _scaffoldKey, "session expired.pls login again");
        NetworkUtils.logoutUser1(_sharedPreferences);

        _hideLoading();
      }
    } else {
      _hideLoading();
    }
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

  _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  _generateOtp() async {
    _showLoading();
    if (_valid()) {
      var responseJson = await NetworkUtils.generateOTP(
          _emailController.text, _passwordController.text);

      if (responseJson['valid']) {
        print('response is valid');
        // NetworkUtils.showSnackBar(_scaffoldKey, responseJson['body']);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Otp(
                      phone: _emailController.text,
                      password: _passwordController.text,
                      sharedPreferences: _sharedPreferences,
                      message: responseJson['body'],
                    )));
      } else {
        NetworkUtils.showSnackBar(_scaffoldKey, responseJson['body']);

        _hideLoading();
      }
    } else {
      setState(() {
        _isLoading = false;
        _emailError;
      });
    }
  }

  _valid() {
    bool valid = true;
    _emailError = null;
    _passwordError = null;

    if (_emailController.text.isEmpty) {
      valid = false;
      _emailError = "Phone can't be blank!";
    }

    if (valid && _passwordController.text.isEmpty) {
      valid = false;
      _passwordError = "password must be entered!";
    }

    return valid;
  }
}
