import 'package:flutter/material.dart';
import '../../Models/user_models.dart';
import '../micro/field_component.dart';

class BankChangePolicyCard extends StatefulWidget {
  BankChangeListClass bankChangeListClass;
  BankChangePolicyCard({this.bankChangeListClass, Key key}) : super(key: key);
  @override
  _BankChangePolicyCardState createState() => _BankChangePolicyCardState();
}

class _BankChangePolicyCardState extends State<BankChangePolicyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldComponent(
                field: 'Policy No',
                value: widget.bankChangeListClass.policyNo,
              ),
              FieldComponent(
                field: 'Policy Owner',
                value: widget.bankChangeListClass.policyOwner,
              ),
              FieldComponent(
                field: 'Policy Status',
                value: widget.bankChangeListClass.policyStatus,
              ),
              FieldComponent(
                field: 'Billing Frequency',
                value: widget.bankChangeListClass.billingFrequency,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldComponent(
                field: 'Start Date',
                value: widget.bankChangeListClass.startDate,
              ),
              FieldComponent(
                field: 'Life Assured',
                value: widget.bankChangeListClass.lifeAssured,
              ),
              FieldComponent(
                field: 'Premium Status',
                value: widget.bankChangeListClass.premiumPayingStatus,
              ),
              FieldComponent(
                field: 'Paid to Date',
                value: widget.bankChangeListClass.paidToDate,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
