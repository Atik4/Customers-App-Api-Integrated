import '../../utils/auth_utils.dart';
import '../../utils/network_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/policyListCards/address_card.dart';
import '../../Components/formCards/address_change_card.dart';
import '../../Components/formCards/bank_change_card.dart';
import '../../Components/custom_appbar.dart';
import '../../Components/custom_dropdown.dart';
import '../../Components/policyListCards/bank_change_policy_card.dart';
import '../../constants.dart';
import 'package:flutter/material.dart';

class AddressChangeFinalScreen extends StatefulWidget {
  List<dynamic> selectedCards;
  int choice;
  AddressChangeFinalScreen({this.selectedCards, this.choice, Key key})
      : super(key: key);
  @override
  _AddressChangeFinalScreenState createState() =>
      _AddressChangeFinalScreenState();
}

class _AddressChangeFinalScreenState extends State<AddressChangeFinalScreen> {
  dynamic formObject;
  List<String> listSelectedPolicies = [];
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _authToken;
  SharedPreferences _sharedPreferences;

  @override
  void initState() {
    super.initState();
    print('Address CHange Final Screen');
    print(widget.selectedCards.length);
    for (dynamic card in widget.selectedCards) {
      listSelectedPolicies.add(card.policyNo);
    }
    for (int i = 0; i < listSelectedPolicies.length; i++)
      print(listSelectedPolicies[i]);
    _fetchSessionAndNavigate();
  }

  _fetchSessionAndNavigate() async {
    _sharedPreferences = await _prefs;
    String authToken = AuthUtils.getToken(_sharedPreferences);
    setState(() {
      _authToken = authToken;
    });
  }

  giveCard(int index) {
    if (widget.choice == 0) {
      return CustomDropdown(
        text: widget.selectedCards[index].policyNo,
        card: AddressCard(
          address: widget.selectedCards[index],
          policyNo: '24569AB8712345455',
        ),
        selectPolicy: this.selectPolicy,
        removePolicy: this.removePolicy,
      );
    } else if (widget.choice == 1) {
      return CustomDropdown(
          text: 'Change Frequency',
          card: BankChangePolicyCard(
            object: listBankChangeCardClass[index],
          ));
    } else if (widget.choice == 2) {
      return CustomDropdown(
          text: widget.selectedCards[index].policyNo,
          card: BankChangePolicyCard(
            object: widget.selectedCards[index],
          ));
    }
  }

  _postForm(dynamic object) async {
    String endpoint = '/user/modifyAddress';
    var responseJson =
        await NetworkUtils.postWithBody(object, _authToken, endpoint);
    print(responseJson);
    if (responseJson.status == 200) {
      print('Address Change successful');
    } else {
      print('Address Change unsuccessful');
    }
  }

  void setFormObject(dynamic object) {
    setState(() {
      this.formObject = object;
    });
    print('Main yahan hun');
    String polnums = '';
    if (listSelectedPolicies.length > 0) {
      polnums = listSelectedPolicies[0];
      for (int i = 1; i < listSelectedPolicies.length; i++) {
        polnums += ',' + listSelectedPolicies[i];
      }
    }
    var finalObject = {};
    finalObject['company'] = '1235';
    finalObject['polnums'] = polnums;
    finalObject['cltaddr01'] = object.line1;
    finalObject['cltaddr02'] = object.line2;
    finalObject['cltaddr03'] = object.line3;
    finalObject['cltaddr04'] = object.city;
    finalObject['cltaddr05'] = ' ';
    finalObject['cltpcode'] = object.pinCode;
    finalObject['ctrycode'] = 'IND';

    print(finalObject);
    _postForm(finalObject);
  }

  void selectPolicy(String policyNo) {
    setState(() {
      listSelectedPolicies.add(policyNo);
    });
  }

  void removePolicy(String policyNo) {
    setState(() {
      listSelectedPolicies.remove(policyNo);
    });
  }

  Widget createForm() {
    if (widget.choice == 0) {
      return AddressChangeCard(
        setFormObject: setFormObject,
      );
    } else if (widget.choice == 2) {
      return BankChangeCard(
        setFormObject: setFormObject,
      );
    }
  }

  List<Widget> createDropdowns() {
    List<Widget> list = [];
    for (int i = 0; i < widget.selectedCards.length; i++) {
      list.add(giveCard(i));
    }
    list.add(createForm());
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          changesOptions[widget.choice], '', '', Size.fromHeight(100)),
      body: ListView(
        children: createDropdowns(),
      ),
    );
  }
}
