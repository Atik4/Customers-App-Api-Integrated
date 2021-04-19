import 'package:flutter/cupertino.dart';
import '../utils/network_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/ProfilePage.dart';
import '../Screens/addressChange/address_change_policy_list.dart';
import '../Screens/bankChange/bank_change_policy_list.dart';
import '../Screens/topup/topup_list_screen.dart';
import '../Screens/frequencyChange/frequency_change_policy_list.dart';
import 'package:flutter/material.dart';
import '../Screens/service_request_list.dart';
import '../Screens/reportGeneration/report_generation_policy_list.dart';
import '../Screens/policyList/monthly_policy_list.dart';

class MainDrawer extends StatelessWidget {
  final String mobile;
  final String name;
  final SharedPreferences sharedPreferences;
  MainDrawer({this.mobile, this.name, this.sharedPreferences});

  Widget createField(Icon icon, String text, int choice, BuildContext context) {
    return ListTile(
        leading: icon,
        title: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
        onTap: () {
          if (choice == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BankChangePolicyList(
                          choice: choice,
                        )));
          } else if (choice == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddressChangePolicyList(
                          choice: choice,
                        )));
          } else if (choice == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FrequencyChangePolicyList(
                          choice: 1,
                        )));
          } else if (choice == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReportGenerationPolicyList(
                          choice: 3,
                        )));
          } else if (choice == 6 ||
              choice == 7 ||
              choice == 4 ||
              choice == -1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TopupListScreen(
                          choice: choice,
                        )));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MonthlyPolicyList(
                          choice: choice,
                        )));
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.blueGrey,
                child: Column(
                  children: [
                    RaisedButton(
                      child: Icon(
                        Icons.account_circle,
                        size: 50,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                      color: Colors.blueGrey,
                    ),
                    Text(
                      "$name",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "$mobile",
                      style: TextStyle(color: Colors.black87),
                    )
                  ],
                ),
              ),
              createField(Icon(Icons.arrow_forward_ios_rounded), "Policy List",
                  -1, context),
              ListTile(
                  leading: Icon(Icons.arrow_forward_ios_rounded),
                  title: Text(
                    "Service Request",
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceRequestList()));
                  }),
              createField(Icon(Icons.arrow_forward_ios_rounded),
                  "Address Change", 0, context),
              createField(Icon(Icons.arrow_forward_ios_rounded),
                  "Frequency Change", 1, context),
              createField(Icon(Icons.arrow_forward_ios_rounded), "Bank Change",
                  2, context),
              createField(Icon(Icons.arrow_forward_ios_rounded),
                  "Surrender Quote", 4, context),
              createField(Icon(Icons.arrow_forward_ios_rounded),
                  "Report Generation", 3, context),
              createField(
                  Icon(Icons.arrow_forward_ios_rounded), "Top-up", 6, context),
              createField(Icon(Icons.arrow_forward_ios_rounded),
                  "Premium Redirection", 7, context),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => LoginIn()));
                  _logout(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  _logout(BuildContext context) {
    NetworkUtils.logoutUser(context, sharedPreferences);
  }
}
