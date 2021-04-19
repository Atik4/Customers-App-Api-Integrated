import '../Models/user_models.dart';
import 'package:flutter/material.dart';

class PremiumPolicyCard extends StatefulWidget {
  PolicyPremium policyPremium;
  Function addPremium, deletePremium;
  PremiumPolicyCard(
      {this.policyPremium, this.addPremium, this.deletePremium, Key key})
      : super(key: key);
  @override
  _PremiumPolicyCardState createState() => _PremiumPolicyCardState();
}

class _PremiumPolicyCardState extends State<PremiumPolicyCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      child: FlatButton(
          onPressed: () {
            setState(() {
              if (!isPressed) {
                isPressed = true;
                widget.addPremium(widget.policyPremium.premium);
              } else {
                isPressed = false;
                widget.deletePremium(widget.policyPremium.premium);
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
                            widget.policyPremium.policyNo,
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
                                        widget.policyPremium.product),
                                  ),
                                  Container(
                                    child: Text('Start Date: ' +
                                        widget.policyPremium.startDate),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Due: ' + widget.policyPremium.endDate,
                                  ),
                                  Text(
                                    'Prem: ' +
                                        widget.policyPremium.premium.toString(),
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
                            widget.policyPremium.policyNo,
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
                                        widget.policyPremium.product),
                                  ),
                                  Container(
                                    child: Text('Start Date: ' +
                                        widget.policyPremium.startDate),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Due: ' + widget.policyPremium.endDate,
                                  ),
                                  Text(
                                    'Prem: ' +
                                        widget.policyPremium.premium.toString(),
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
