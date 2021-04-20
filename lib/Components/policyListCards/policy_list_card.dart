import 'package:intl/intl.dart';

import '../../Components/micro/field_component.dart';
import 'package:flutter/material.dart';

class PolicyListCard extends StatelessWidget {
  final dynamic object;
  final int choice;
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  PolicyListCard({this.object, this.choice});
  mainContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FieldComponent(
              field: 'Policy No',
              value: object['polnum'],
            ),
            FieldComponent(
              field: 'Start Date',
              //value: object['occdate'],
              value: formatter
                  .format(DateTime.parse(object['occdate'] + 'T000000')),
            ),
            FieldComponent(
              field: 'Product',
              value: object['product'],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FieldComponent(
              field: 'Premium',
              value: object['prem'],
            ),
            FieldComponent(
              field: 'End Date',
              //value: object['btdate'],
              value: formatter
                  .format(DateTime.parse(object['btdate'] + 'T000000')),
            ),
          ],
        ),
      ],
    );
  }

  createContent() {
    if (this.choice == -2) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: mainContent(),
      );
    }
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blueGrey[50]),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: mainContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return createContent();
  }
}
