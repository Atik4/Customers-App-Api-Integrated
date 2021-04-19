import '../../Components/policyListCards/multi_select_policy_card.dart';
import '../final_change_screen.dart';
import 'package:flutter/material.dart';
import '../../Components/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import '../../Components/search_bar.dart';
import '../../constants.dart';

class AddressChangePolicyList extends StatefulWidget {
  int choice;
  AddressChangePolicyList({this.choice, Key key}) : super(key: key);
  @override
  _AddressChangePolicyListState createState() =>
      _AddressChangePolicyListState();
}

class _AddressChangePolicyListState extends State<AddressChangePolicyList> {
  final ScrollController _scrollController = ScrollController();
  int count = 0;
  List<dynamic> selectedPolicies = [];
  List<dynamic> selectedCards = [];
  List<bool> isSelected = [];
  bool multiSelectMode = false;

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
    });
    print(selectedPolicies.length);
  }

  void unSelectCard(dynamic object) {
    setState(() {
      selectedPolicies.remove(object);
    });
    if (selectedPolicies.length == 0) {
      setState(() {
        this.multiSelectMode = false;
      });
    }
    print(selectedPolicies.length);
  }

  List<dynamic> getCardContentList() {
    if (widget.choice == 0)
      return listAddresses;
    else if (widget.choice == 2) return listBankChangeCardClass;
  }

  List<dynamic> filteredList = [];

  void createFilteredList(String input) {
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
