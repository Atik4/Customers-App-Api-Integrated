import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/premium_calender_dashboard.dart';
import '../Components/drawer.dart';
import '../API_Handler/get_user_details.dart';
import '../Models/user.dart';

class PremCalender extends StatefulWidget {
  String email;
  PremCalender({this.email, Key key}) : super(key: key);
  @override
  _PremCalenderState createState() => _PremCalenderState();
}

class _PremCalenderState extends State<PremCalender> {
  getDetails() {
    UserDetailsApi userDetailsApi = UserDetailsApi();
    User user = userDetailsApi.getDetails(widget.email);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(
        user: getDetails(),
      ),
      appBar: AppBar(
        title: Text('Premium Due'),
      ),
      body: ListView(
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
                  'In Force Policies',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
          PremiumDashboard(),
        ],
      ),
    );
  }
}
