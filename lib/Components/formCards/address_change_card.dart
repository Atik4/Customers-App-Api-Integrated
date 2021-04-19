import '../../Components/file_selector.dart';

import '../../Components/policyListCards/address_card.dart';
import '../../Components/custom_dropdown.dart';

import '../buttons/cancel_button.dart';
import '../buttons/save_button.dart';
import '../../Models/user_models.dart';
import 'package:flutter/material.dart';

class AddressChangeCard extends StatefulWidget {
  Function setFormObject;
  AddressChangeCard({this.setFormObject, Key key}) : super(key: key);
  @override
  _AddressChangeCardState createState() => _AddressChangeCardState();
}

class _AddressChangeCardState extends State<AddressChangeCard> {
  String address1 = '';
  String address2 = '';
  String address3 = '';
  String city = '';
  String postalcode = '';
  String email = '';
  String mobile = '';

  void saveChanges() {
    Address address = Address(
        line1: address1,
        line2: address2,
        line3: address3,
        pinCode: postalcode,
        mobile: mobile,
        email: email);
    widget.setFormObject(address);
    print('address save');
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
                    labelText: 'Line-1',
                  ),
                  onChanged: (value) => address1 = value,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Line-2',
                    ),
                    onChanged: (value) => address2 = value),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Line-3(Optional)',
                    ),
                    onChanged: (value) => address3 = value),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'City',
                    ),
                    onChanged: (value) => city = value),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Postal Code',
                    ),
                    onChanged: (value) => postalcode = value),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    onChanged: (value) => email = value),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Mobile',
                    ),
                    onChanged: (value) => mobile = value),
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
                  )
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
