import 'package:insuranceproject2/Screens/payment_gateway.dart';

import '../../Components/policyListCards/multi_select_policy_card.dart';
import '../final_change_screen.dart';
import 'package:flutter/material.dart';
import '../../Components/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import '../../Components/search_bar.dart';
import '../../constants.dart';

class MonthlyPolicyList extends StatefulWidget {
  int choice, month;
  MonthlyPolicyList({this.choice, this.month, Key key}) : super(key: key);
  @override
  _MonthlyPolicyListState createState() => _MonthlyPolicyListState();
}

class _MonthlyPolicyListState extends State<MonthlyPolicyList> {
  final ScrollController _scrollController = ScrollController();
  int count = 0;
  List<dynamic> selectedPolicies = [];
  List<dynamic> selectedCards = [];
  List<bool> isSelected = [];
  List<dynamic> listAll = [];
  bool multiSelectMode = false;
  double totalPremium = 0;
  void switchToMultiSelectMode() {
    multiSelectMode = !multiSelectMode;
  }

  void increaseCount() {
    setState(() {
      count++;
    });
  }

  void decreaseCount() {
    setState(() {
      count--;
    });
  }

  void addSelected(dynamic object) {
    setState(() {
      selectedPolicies.add(object);
      totalPremium += object.premium;
    });
    print(selectedPolicies.length);
  }

  void unSelectCard(dynamic object) {
    setState(() {
      selectedPolicies.remove(object);
      totalPremium -= object.premium;
    });
    if (selectedPolicies.length == 0) {
      setState(() {
        this.multiSelectMode = false;
      });
    }
    print(selectedPolicies.length);
  }

  List<dynamic> getCardContentList() {
    return listPolicyPremium;
  }

  List<dynamic> filteredList = [];

  void createFilteredList(String input) {
    if (input.isEmpty) {
      setState(() {
        filteredList = getCardContentList();
      });
    } else {
      List<dynamic> temp = [];
      listAll.map((policyPremium) {
        String policy = policyPremium.policyNo.toLowerCase();
        if (policy.contains(input.toLowerCase())) temp.add(policyPremium);
      }).toList();
      setState(() {
        filteredList = temp;
      });
    }
  }

  @override
  void initState() {
    setState(() {
      listAll = getCardContentList();
    });
    createFilteredList("");
    // TODO: implement initState
    super.initState();
  }

  Widget createButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
      child: RaisedButton(
        color: Colors.amber,
        onPressed: () {
          print("len: " + this.selectedPolicies.length.toString());
          if (count > 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FinalChangeScreen(
                selectedCards: this.selectedPolicies,
                choice: widget.choice,
              );
            }));
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (totalPremium > 0
                  ? FlatButton(
                      color: Colors.amber,
                      child: Text(
                        'Pay Premium ${this.totalPremium}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black87),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentGateway(
                                      totalPremiumAmount: totalPremium,
                                    )));
                      })
                  : Text(
                      'Pay Premium ${this.totalPremium}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black87),
                    )),
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
      appBar: CustomAppBar('Premium Due for ${monthsList[widget.month]}', '',
          '', Size.fromHeight(120)),
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
                    return MultiSelectPolicyCard(
                      cardContent: filteredList[index],
                      choice: widget.choice,
                      increaseCount: this.increaseCount,
                      decreaseCount: this.decreaseCount,
                      addSelected: this.addSelected,
                      unSelect: this.unSelectCard,
                      multiSelectMode: this.multiSelectMode,
                      switchToMultiSelectMode: this.switchToMultiSelectMode,
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
