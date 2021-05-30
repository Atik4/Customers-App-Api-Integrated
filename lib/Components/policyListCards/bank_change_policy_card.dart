import 'package:flutter/material.dart';
import '../micro/field_component.dart';
import 'package:intl/intl.dart';

class BankChangePolicyCard extends StatelessWidget {
  final dynamic object;
  BankChangePolicyCard({this.object});
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
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
                value: object['polnum'],
              ),
              FieldComponent(
                field: 'Policy Owner',
                value: object['ownernum'],
              ),
              FieldComponent(
                field: 'Policy Status',
                value: object['polstat'],
              ),
              FieldComponent(
                field: 'Billing Frequency',
                value: object['billfreq'],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldComponent(
                field: 'Start Date',
                value: formatter
                    .format(DateTime.parse(object['occdate'] + 'T000000')),
              ),
              FieldComponent(
                field: 'Life Assured',
                value: object['polnum'],
              ),
              FieldComponent(
                field: 'Premium Status',
                value: object['premstat'],
              ),
              FieldComponent(
                field: 'Paid to Date',
                value: formatter
                    .format(DateTime.parse(object['ptdate'] + 'T000000')),
                //value: object['ptdate'],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
