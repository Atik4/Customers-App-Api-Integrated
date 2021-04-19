import '../../Components/policyListCards/policy_list_card.dart';

import '../../Screens/final_change_screen.dart';
import 'package:flutter/material.dart';
import 'address_card.dart';
import 'bank_change_policy_card.dart';
import 'report_generation_policy_list_card.dart';
import '../../Screens/reportGeneration/report_generation_final.dart';

class MultiSelectPolicyCard extends StatefulWidget {
  dynamic cardContent;
  int choice;
  bool multiSelectMode;
  Function increaseCount,
      decreaseCount,
      addSelected,
      unSelect,
      switchToMultiSelectMode;
  MultiSelectPolicyCard(
      {this.cardContent,
      this.choice,
      this.increaseCount,
      this.decreaseCount,
      this.addSelected,
      this.unSelect,
      this.multiSelectMode,
      this.switchToMultiSelectMode,
      Key key})
      : super(key: key);
  @override
  _MultiSelectPolicyCardState createState() => _MultiSelectPolicyCardState();
}

class _MultiSelectPolicyCardState extends State<MultiSelectPolicyCard> {
  bool isSelected = false;
  onPressed() {
    if (!widget.multiSelectMode) {
      if (widget.choice == -2) return;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        if (widget.choice == 3) {
          return ReportGenerationFinalScreen(
            selectedCards: [widget.cardContent],
            choice: widget.choice,
          );
        } else {
          return FinalChangeScreen(
            selectedCards: [widget.cardContent],
            choice: widget.choice,
          );
        }
      }));
    } else if (widget.multiSelectMode && !this.isSelected) {
      setState(() {
        this.isSelected = true;
      });
      widget.increaseCount();
      widget.addSelected(widget.cardContent);
    } else if (widget.multiSelectMode && this.isSelected) {
      setState(() {
        this.isSelected = false;
      });
      widget.decreaseCount();
      widget.unSelect(widget.cardContent);
    }
  }

  onLongPressed() {
    setState(() {
      isSelected = true;
    });
    if (!widget.multiSelectMode) {
      widget.switchToMultiSelectMode();
    }
    widget.increaseCount();
    widget.addSelected(widget.cardContent);
  }

  Widget createCard() {
    if (widget.choice == -1 || widget.choice == -2) {
      return PolicyListCard(
        object: widget.cardContent,
        choice: widget.choice,
      );
    } else if (widget.choice == 0) {
      return AddressCard(
        address: widget.cardContent,
        policyNo: widget.cardContent.policyNo,
      );
    } else if (widget.choice == 2) {
      return BankChangePolicyCard(
        bankChangeListClass: widget.cardContent,
      );
    } else if (widget.choice == 3) {
      return ReportGenerationPolicyCard(
        object: widget.cardContent,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      child: FlatButton(
        color: !isSelected ? Colors.white : Colors.blueGrey[200],
        onPressed: () {
          onPressed();
        },
        onLongPress: () {
          onLongPressed();
        },
        child: createCard(),
      ),
    );
  }
}
