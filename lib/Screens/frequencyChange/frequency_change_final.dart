import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/buttons/cancel_button.dart';
import '../../Components/buttons/save_button.dart';
import '../../Components/custom_appbar.dart';
import '../../Components/formCards/frequency_change_card.dart';
import '../../Components/policyListCards/bank_change_policy_card.dart';
import '../../Models/user_models.dart';
import 'package:flutter/material.dart';
import '../../Components/file_selector.dart';
import '../../utils/auth_utils.dart';
import '../../utils/network_utils.dart';

class FrequencyChangeFinal extends StatefulWidget {
  dynamic object;
  FrequencyChangeFinal({this.object, Key key}) : super(key: key);
  @override
  _FrequencyChangeFinalState createState() => _FrequencyChangeFinalState();
}

class _FrequencyChangeFinalState extends State<FrequencyChangeFinal> {
  String option = 'Annual', billfreq;
  int factor;
  double premium;
  bool isCalculated = false;

  BankChangeListClass bankChangeListClass = BankChangeListClass(
      policyNo: '34127AB87981454897',
      policyOwner: 'Mayank Patel',
      lifeAssured: 'Life Assured',
      policyStatus: 'Inactive',
      startDate: '26/5/2017',
      billingFrequency: 'Yearly',
      paidToDate: '29/09/2019',
      premiumPayingStatus: 'Pending');

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _authToken;
  SharedPreferences _sharedPreferences;
  final Map mp = {
    '01': 'Annual',
    '02': 'Half Annual',
    '04': 'Quaterly',
    '12': 'Monthly'
  };
  final Map mp1 = {
    'Annual': '01',
    'Half Annual': '02',
    'Quaterly': '04',
    'Monthly': '12'
  };
  @override
  void initState() {
    super.initState();
    setState(() {
      this.billfreq = mp[widget.object['billfreq']];
    });
    _fetchSessionAndNavigate();
  }

  _fetchSessionAndNavigate() async {
    _sharedPreferences = await _prefs;
    String authToken = AuthUtils.getToken(_sharedPreferences);
    setState(() {
      _authToken = authToken;
    });
  }

  double getCurrentPremium(policyNo) {
    return 10000;
  }

  setFactor() {
    if (option == 'Annual') {
      setState(() {
        factor = 1;
      });
    } else if (option == 'Half Annual') {
      setState(() {
        factor = 2;
      });
    } else if (option == 'Quaterly') {
      setState(() {
        factor = 3;
      });
    } else {
      setState(() {
        factor = 4;
      });
    }
  }

  void setOption(String value) {
    setState(() {
      option = value;
    });
  }

  double calculatePremium() {
    setFactor();
    return this.premium =
        getCurrentPremium(bankChangeListClass.policyNo) / factor;
  }

  String giveText() {
    if (this.premium == null) return '   --   ';
    return this.premium.toStringAsFixed(2);
  }

  void saveChanges() async {
    String endpoint = '/crud/FPOLMASTER/update?isValid=false';
    dynamic requestObject = widget.object;
    setFactor();
    requestObject['billfreq'] = mp1[this.option];
    print(requestObject);
    var responseJson =
        await NetworkUtils.postWithBody1(requestObject, _authToken, endpoint);

    if (responseJson != null) {
      print('Frequency Change successful');
      print(responseJson);
      String endpoint = '/mcheck/accept?rid=' + responseJson;
      var changeResponse =
          await NetworkUtils.postWithBody("", _authToken, endpoint);
      print('response json');
      print(changeResponse);
    } else {
      print('Frequency Change unsuccessful');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Frequency Change', '', '', Size.fromHeight(100)),
      body: ListView(
        children: [
          BankChangePolicyCard(
            object: widget.object,
          ),
          FrequencyChangeCard(
            setOption: this.setOption,
          ),
          Column(
            children: [
              Card(
                color: Colors.blueGrey[100],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Text(
                          giveText(),
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Revised',
                          style: TextStyle(color: Colors.blueGrey[700]),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Premium',
                          style: TextStyle(color: Colors.blueGrey[700]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 140,
                child: RaisedButton(
                  onPressed: () {
                    print('hi');
                    calculatePremium();
                  },
                  color: Colors.lightBlue,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text('Calculate Premium'),
                  ),
                ),
              ),
              FileSelector(),
              // FunctionalButton(
              //   text: 'Confirm',
              //   function: () {},
              // ),
              // CancelButton(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                CancelButton(),
                SaveButton(
                  saveChanges: this.saveChanges,
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
