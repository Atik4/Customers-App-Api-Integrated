import '../utils/auth_utils.dart';
import '../utils/network_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './prem_calender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'loading_screen.dart';

class Otp extends StatefulWidget {
  final String phone;
  final String password;
  final String message;
  final SharedPreferences sharedPreferences;
  Otp(
      {this.phone,
      this.sharedPreferences,
      this.password,
      this.message,
      Key key})
      : super(key: key);

  @override
  OtpState createState() => new OtpState();
}

class OtpState extends State<Otp> {
  String otpString;
  bool _isLoading = false;
  String _otpError;
  String message;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    message = widget.message;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      if (message != null) {
        NetworkUtils.showSnackBar(_scaffoldKey, widget.message);
        message = null;
      }
    });

    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 250, 172, 1),
      key: _scaffoldKey,
      body: _isLoading
          ? new LoadingScreen()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  padding: const EdgeInsets.all(15.0),
                  child: OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 50,
                      style: TextStyle(fontSize: 17),
                      onChanged: (pin) {
                        otpString = pin;
                      },
                      onCompleted: (pin) {
                        otpString = pin;
                      }),
                ),
                RaisedButton(
                  color: Colors.white30,
                  onPressed: () {
                    _authenticateUser();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Verify',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: RaisedButton(
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          _generateOtp();
                        },
                        child: Text(
                          'Resend OTP',
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: RaisedButton(
                        color: Colors.amber,
                        onPressed: () {
                          Navigator.of(_scaffoldKey.currentContext)
                              .pushReplacementNamed('/');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Wrong Number',
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  _authenticateUser() async {
    _showLoading();

    if (_valid()) {
      var responseJson = await NetworkUtils.authenticateUser(
          widget.phone, otpString, widget.password);

      print(responseJson);

      if (responseJson == null) {
        NetworkUtils.showSnackBar(_scaffoldKey, 'Something went wrong!');
      } else if (responseJson == 'NetworkError') {
        NetworkUtils.showSnackBar(_scaffoldKey, null);
      } else if (responseJson['status'] == 'ERROR') {
        NetworkUtils.showSnackBar(_scaffoldKey, responseJson['body']);
      } else {
        AuthUtils.insertDetails(widget.sharedPreferences, responseJson);
        /**
         * Removes stack and start with the new page.
         * In this case on press back on HomePage app will exit.
         * **/
        await Navigator.of(_scaffoldKey.currentContext)
            //	.pushReplacementNamed(HomePage.routeName);

            .pushReplacementNamed(PremCalender.routeName);
      }
      _hideLoading();
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  _valid() {
    bool valid = true;
    _otpError = null;
    print(otpString);
    if (otpString.length < 6) {
      valid = false;
      _otpError = "OTP must be 6 long";
      NetworkUtils.showSnackBar(_scaffoldKey, _otpError);
    }
    return valid;
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

  _generateOtp() async {
    _showLoading();
    if (_valid1()) {
      var responseJson =
          await NetworkUtils.generateOTP(widget.phone, widget.password);

      if (responseJson['valid']) {
        print('response is valid');
        NetworkUtils.showSnackBar(_scaffoldKey, responseJson['body']);
        _hideLoading();
      } else {
        NetworkUtils.showSnackBar(_scaffoldKey, responseJson['body']);

        _hideLoading();
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  _valid1() {
    bool valid = true;

    if (widget.phone.isEmpty) {
      NetworkUtils.showSnackBar(_scaffoldKey, "phone number must be entered");
      valid = false;
    }

    return valid;
  }
}
