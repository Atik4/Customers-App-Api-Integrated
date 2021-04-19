import '../../Components/file_selector.dart';

import '../../Models/user_models.dart';
import 'package:flutter/material.dart';

import '../buttons/cancel_button.dart';
import '../buttons/save_button.dart';

class BankChangeCard extends StatefulWidget {
  Function setFormObject;
  BankChangeCard({this.setFormObject, Key key}) : super(key: key);
  @override
  _BankChangeCardState createState() => _BankChangeCardState();
}

class _BankChangeCardState extends State<BankChangeCard> {
  String ifsc;
  String bankname;
  String bankbranch;
  String maxamount;
  String terminationdate;

  void saveChanges() {
    BankDetails bankDetails =
        BankDetails(ifsc, bankname, bankbranch, maxamount, terminationdate);
    widget.setFormObject(bankDetails);
    print('bank details save');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'IFSC Code',
                  ),
                  onChanged: (value) => ifsc = value,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Bank Name',
                    ),
                    onChanged: (value) => bankname = value),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Branch Name',
                    ),
                    onChanged: (value) => bankbranch = value),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Max Amount',
                    ),
                    onChanged: (value) => maxamount = value),
                TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Termination Date', hintText: 'DD/MM/YYYY'),
                    onChanged: (value) => terminationdate = value),
              ],
            ),
          ),
        ),
        FileSelector(),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CancelButton(),
                  SaveButton(
                    saveChanges: this.saveChanges,
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Container(
              //       width: 120,
              //       child: RaisedButton(
              //         onPressed: () {},
              //         color: Colors.lightBlue,
              //         child: Text('Apply-All'),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
