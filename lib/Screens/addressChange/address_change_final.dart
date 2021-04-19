import '../../Components/policyListCards/address_card.dart';
import '../../Components/formCards/address_change_card.dart';
import '../../Components/formCards/bank_change_card.dart';
import '../../Components/custom_appbar.dart';
import '../../Components/custom_dropdown.dart';
import '../../Components/policyListCards/bank_change_policy_card.dart';
import '../../constants.dart';
import 'package:flutter/material.dart';

class FinalChangeScreen extends StatefulWidget {
  List<dynamic> selectedCards;
  int choice;
  FinalChangeScreen({this.selectedCards, this.choice, Key key})
      : super(key: key);
  @override
  _FinalChangeScreenState createState() => _FinalChangeScreenState();
}

class _FinalChangeScreenState extends State<FinalChangeScreen> {
  dynamic formObject;
  @override
  void initState() {
    // TODO: implement initState
    print(widget.selectedCards.length);
    super.initState();
  }

  giveCard(int index) {
    if (widget.choice == 0) {
      return CustomDropdown(
        text: widget.selectedCards[index].policyNo,
        card: AddressCard(
          address: widget.selectedCards[index],
          policyNo: '24569AB8712345455',
        ),
      );
    } else if (widget.choice == 1) {
      return CustomDropdown(
          text: 'Change Frequency',
          card: BankChangePolicyCard(
            bankChangeListClass: listBankChangeCardClass[index],
          ));
    } else if (widget.choice == 2) {
      return CustomDropdown(
          text: widget.selectedCards[index].policyNo,
          card: BankChangePolicyCard(
            bankChangeListClass: widget.selectedCards[index],
          ));
    }
  }

  void setFormObject(dynamic object) {
    setState(() {
      this.formObject = object;
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
