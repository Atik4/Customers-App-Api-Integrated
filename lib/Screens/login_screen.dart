import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './otp_screen.dart';

class LoginIn extends StatelessWidget {
  getDetails() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 250, 172, 1),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
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
              padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Enter your number'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Enter your password'),
              ),
            ),
            RaisedButton(
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Otp()));
              },
              child: Text(
                'SignIn',
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
            ),
          ]),
    );
  }
}
