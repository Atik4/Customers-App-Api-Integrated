import '../../Models/user_models.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final String policyNo;
  final Address address;
  AddressCard({this.address, this.policyNo});
  Widget getLine(String text) {
    if (text == '' || text == null) return Container();
    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'Policy #${this.policyNo}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text('Status:    ' + 'In progress'),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Address: '),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(address.line1),
                          getLine(address.line2),
                          getLine(address.line3),
                          Text(address.city + ', ' + address.pinCode),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text('Mobile no: ' + address.mobile),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
