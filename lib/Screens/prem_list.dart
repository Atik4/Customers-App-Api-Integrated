import '../utils/auth_utils.dart';
import '../utils/network_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/payment_gateway.dart';
import '../Components/custom_appbar.dart';
import '../Components/premium_policy_card.dart';
import '../Models/user_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/search_bar.dart';
import '../constants.dart';
import 'loading_screen.dart';

class PremList extends StatefulWidget {
  final String month;
  final String year;
  PremList({this.year, this.month, Key key}) : super(key: key);
  @override
  _PremListState createState() => _PremListState();
}

class _PremListState extends State<PremList> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  SharedPreferences _sharedPreferences;
  double totalPremium = 0;
  bool _isLoading = true;
  var _name, _id;
  List policyList = new List();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    createFilteredList("");
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

    _fetchData(authToken);
  }

  _fetchData(String authToken) async {
    _showLoading();

    var responseJson = await NetworkUtils.fetch(authToken,
        '/user/getPolicyList?yearMonth=' + widget.year + widget.month);

    if (responseJson['valid']) {
      setState(() {
        for (var i = 0; i < responseJson['body'].length; i++) {
          policyList.add(responseJson['body'][i]);
        }

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

  void addPremium(double value) {
    setState(() {
      totalPremium += value;
    });
  }

  void deletePremium(double value) {
    setState(() {
      totalPremium -= value;
    });
  }

  List<PolicyPremium> filteredList = [];
  void createFilteredList(String input) {
    if (input.isEmpty) {
      setState(() {
        filteredList = listPolicyPremium;
      });
    } else {
      List<PolicyPremium> temp = [];
      listPolicyPremium.map((policyPremium) {
        String product = policyPremium.product.toLowerCase();
        if (product.contains(input.toLowerCase())) temp.add(policyPremium);
      }).toList();
      setState(() {
        filteredList = temp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Premium Summary', '$_name',
          monthsList[int.parse(widget.month) - 1], Size.fromHeight(140)),
      backgroundColor: Color.fromRGBO(243, 250, 172, 1),
      body: _isLoading
          ? LoadingScreen()
          : Container(
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
                        itemCount: policyList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PremiumPolicyCard(
                            //policyPremium: filteredList[index],
                            policyPremium: policyList[index],
                            addPremium: this.addPremium,
                            deletePremium: this.deletePremium,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.amber),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 5, right: 10, top: 5, bottom: 5),
                              child: Column(
                                children: [
                                  Text(
                                    'Total Premium',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    this.totalPremium.toString(),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 5, top: 5, bottom: 5),
                          child: RaisedButton(
                            color: Colors.amber,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentGateway()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Pay Premium',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black87),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    //size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
