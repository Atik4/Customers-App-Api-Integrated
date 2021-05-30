import '../Components/policyListCards/address_card.dart';
import '../Screens/final_change_screen.dart';
import 'package:flutter/material.dart';
import '../Components/custom_appbar.dart';
import '../Models/user_models.dart';
import 'package:flutter/cupertino.dart';
import '../Components/search_bar.dart';
import '../constants.dart';
import '../Components/policyListCards/bank_change_policy_card.dart';

class ChangesPolicyList extends StatefulWidget {
  int month, choice;
  ChangesPolicyList({this.month, this.choice, Key key}) : super(key: key);
  @override
  _ChangesPolicyListState createState() => _ChangesPolicyListState();
}

class _ChangesPolicyListState extends State<ChangesPolicyList> {
  final ScrollController _scrollController = ScrollController();
  int count = 0;
  List<dynamic> selectedPolicies = [];
  List<dynamic> selectedCards = [];
  List<bool> isSelected = [];
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
    });
    print(selectedPolicies.length);
  }

  void unSelectCard(dynamic object) {
    setState(() {
      selectedPolicies.remove(object);
    });
    print(selectedPolicies.length);
  }

  List<dynamic> getCardContentList() {
    if (widget.choice == 0)
      return listAddresses;
    else if (widget.choice == 2) return listBankChangeCardClass;
  }

  List<dynamic> filteredList = [];
  void createFilteredListBankChange(String input) {
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

  void createFilteredListAddressChange(String input) {
    if (input.isEmpty) {
      setState(() {
        filteredList = getCardContentList();
      });
    } else {
      List<dynamic> temp = [];
      listAddresses.map((address) {
        String element = address.city.toLowerCase();
        if (element.contains(input.toLowerCase())) temp.add(address);
      }).toList();
      setState(() {
        filteredList = temp;
      });
    }
  }

  void createFilteredList(String input) {
    if (widget.choice == 0)
      createFilteredListAddressChange(input);
    else if (widget.choice == 2) createFilteredListBankChange(input);
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
              Text(
                changesOptions[widget.choice],
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
      appBar: CustomAppBar(
          changesOptions[widget.choice], '', '', Size.fromHeight(120)),
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
                      bankChangeListClass: listBankChangeCardClass[0],
                      cardContent: filteredList[index],
                      choice: widget.choice,
                      increaseCount: this.increaseCount,
                      decreaseCount: this.decreaseCount,
                      addSelected: this.addSelected,
                      unSelect: this.unSelectCard,
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
  dynamic cardContent;
  int choice;
  Function increaseCount, decreaseCount, addSelected, unSelect;
  PolicyCard(
      {this.bankChangeListClass,
      this.cardContent,
      this.choice,
      this.increaseCount,
      this.decreaseCount,
      this.addSelected,
      this.unSelect,
      Key key})
      : super(key: key);
  @override
  _PolicyCardState createState() => _PolicyCardState();
}

class _PolicyCardState extends State<PolicyCard> {
  bool isLongPressed = false;

  Widget createCard() {
    if (widget.choice == 0) {
      return AddressCard(
        address: widget.cardContent,
        policyNo: '24569AB8712345455',
      );
    } else if (widget.choice == 2) {
      return BankChangePolicyCard(
        object: widget.cardContent,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      child: FlatButton(
        color: !isLongPressed ? Colors.white : Colors.blueGrey[200],
        onPressed: () {
          setState(() {
            isLongPressed = false;
          });
          widget.decreaseCount();
          widget.unSelect(widget.bankChangeListClass);
          print(isLongPressed);
        },
        onLongPress: () {
          setState(() {
            isLongPressed = true;
          });
          widget.increaseCount();
          widget.addSelected(widget.bankChangeListClass);
          print(isLongPressed);
        },
        child: createCard(),
      ),
    );
  }
}
