import '../../Screens/frequencyChange/frequency_change_final.dart';
import 'package:flutter/material.dart';
import '../../Components/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import '../../Components/search_bar.dart';
import '../../constants.dart';
import '../../Components/policyListCards/bank_change_policy_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/auth_utils.dart';
import '../../utils/network_utils.dart';

class FrequencyChangePolicyList extends StatefulWidget {
  int month, choice;
  FrequencyChangePolicyList({this.month, this.choice, Key key})
      : super(key: key);
  @override
  _FrequencyChangePolicyListState createState() =>
      _FrequencyChangePolicyListState();
}

class _FrequencyChangePolicyListState extends State<FrequencyChangePolicyList> {
  final ScrollController _scrollController = ScrollController();
  int count = 0;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  SharedPreferences _sharedPreferences;
  var _name, _id;
  bool _isLoading = true;
  List<dynamic> listAll = [];

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
        await NetworkUtils.fetch1(authToken, '/crud/FPOLMASTER/get');
    print(responseJson);
    //print(responseJson.length());
    for (dynamic object in responseJson) {
      setState(() {
        listAll.add(object);
      });
    }
    print(listAll.length);
    setState(() {
      _isLoading = false;
    });
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

  List<dynamic> getCardContentList() {
    if (widget.choice == -1)
      return listPolicyPremium;
    else
      return listBankChangeCardClass;
  }

  List<dynamic> filteredList = [];
  void createFilteredList(String input) {
    if (input.isEmpty) {
      setState(() {
        filteredList = getCardContentList();
      });
    } else {
      List<dynamic> temp = [];
      listBankChangeCardClass.map((bankChangeCardClass) {
        String policy = bankChangeCardClass.policyNo.toLowerCase();
        if (policy.contains(input.toLowerCase())) temp.add(bankChangeCardClass);
      }).toList();
      setState(() {
        filteredList = temp;
      });
    }
  }

  // @override
  // void initState() {
  //   createFilteredList("");
  //   super.initState();
  // }

  Widget createButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
      child: RaisedButton(
        color: Colors.amber,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Change Frequency',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.arrow_forward,
                //size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Frequency Change', '', '', Size.fromHeight(120)),
      backgroundColor: Color.fromRGBO(243, 250, 172, 1),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            SearchField(
              searchFunction: createFilteredList,
            ),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: listAll.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PolicyCard(
                      object: listAll[index],
                      choice: widget.choice,
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: createButtons(),
            ),
          ],
        ),
      ),
    );
  }
}

class PolicyCard extends StatelessWidget {
  final dynamic object;
  final int choice;
  PolicyCard({this.object, this.choice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      child: FlatButton(
        color: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FrequencyChangeFinal(
              object: object,
            );
          }));
        },
        child: BankChangePolicyCard(
          object: object,
        ),
      ),
    );
  }
}
