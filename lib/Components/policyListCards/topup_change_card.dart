import '../../Components/micro/field_component.dart';

import '../../Models/user_models.dart';
import 'package:flutter/material.dart';

class TopupChangeCard extends StatelessWidget {
  final dynamic object;
  TopupChangeCard({this.object});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blueGrey[50]),
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
                value: object.policyNo,
              ),
              FieldComponent(
                field: 'Policy Status',
                value: object.policyStatus,
              ),
              FieldComponent(
                field: 'Billing Frequency',
                value: object.billingFrequency,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldComponent(
                field: 'Installment',
                value: object.installmentPremium,
              ),
              FieldComponent(
                field: 'Premium Status',
                value: object.premiumPayingStatus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
