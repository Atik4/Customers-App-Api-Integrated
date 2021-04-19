import '../../Screens/frequencyChange/frequency_change_final.dart';
import 'package:flutter/material.dart';
import '../../Components/custom_appbar.dart';
import '../../Models/user_models.dart';
import 'package:flutter/cupertino.dart';
import '../../Components/search_bar.dart';
import '../../constants.dart';
import '../../Components/policyListCards/bank_change_policy_card.dart';

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

  @override
  void initState() {
    createFilteredList("");
    // TODO: implement initState
    super.initState();
  }

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
                  itemCount: filteredList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PolicyCard(
                      bankChangeListClass: filteredList[index],
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

// ignore: must_be_immutable
class PolicyCard extends StatefulWidget {
  BankChangeListClass bankChangeListClass;
  int choice;
  PolicyCard({this.bankChangeListClass, this.choice, Key key})
      : super(key: key);
  @override
  _PolicyCardState createState() => _PolicyCardState();
}

class _PolicyCardState extends State<PolicyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      child: FlatButton(
        color: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FrequencyChangeFinal();
          }));
        },
        child: BankChangePolicyCard(
          bankChangeListClass: widget.bankChangeListClass,
        ),
      ),
    );
  }
}
