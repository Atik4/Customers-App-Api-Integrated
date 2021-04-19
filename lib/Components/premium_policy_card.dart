import 'package:intl/intl.dart';

import '../Models/user_models.dart';
import 'package:flutter/material.dart';

class PremiumPolicyCard extends StatefulWidget {
  final policyPremium;
  Function addPremium, deletePremium;
  PremiumPolicyCard(
      {this.policyPremium, this.addPremium, this.deletePremium, Key key})
      : super(key: key);
  @override
  _PremiumPolicyCardState createState() => _PremiumPolicyCardState();
}

class _PremiumPolicyCardState extends State<PremiumPolicyCard> {
  bool isPressed = false;

  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      child: FlatButton(
          onPressed: () {
            setState(() {
              if (!isPressed) {
                isPressed = true;
                widget.addPremium(double.parse(widget.policyPremium['prem']));
              } else {
                isPressed = false;
                widget
                    .deletePremium(double.parse(widget.policyPremium['prem']));
              }
            });
          },
          child: !isPressed
              ? Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  //margin: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            widget.policyPremium['polnum'],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text('Product : ' +
                                        widget.policyPremium['product']),
                                  ),
                                  Container(
                                    child: Text('Start Date: ' +
                                        formatter.format(DateTime.parse(
                                            widget.policyPremium['occdate'] +
                                                'T000000'))),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Due: ' +
                                        formatter.format(DateTime.parse(
                                            widget.policyPremium['ptdate'] +
                                                'T000000')),
                                  ),
                                  Text(
                                    'Prem: ' + widget.policyPremium['prem'],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  //margin: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            widget.policyPremium['polnum'],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.assignment_turned_in_outlined,
                                  size: 30,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text('Product : ' +
                                        widget.policyPremium['product']),
                                  ),
                                  Container(
                                    child: Text('Start Date: ' +
                                        widget.policyPremium['occdate']),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Due: ' + widget.policyPremium['ptdate'],
                                  ),
                                  Text(
                                    'Prem: ' + widget.policyPremium['prem'],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }
}
