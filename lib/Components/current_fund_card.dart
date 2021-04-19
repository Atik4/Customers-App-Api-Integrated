import '../Models/user_models.dart';
import 'package:flutter/material.dart';

class CurrentFundCard extends StatefulWidget {
  @override
  _CurrentFundCardState createState() => _CurrentFundCardState();
}

const TextStyle textStyle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

class _CurrentFundCardState extends State<CurrentFundCard> {
  CurrentFundCardDetails currentFundCardDetails =
      CurrentFundCardDetails('25.00%', '50.00%', '12.00%', '15.00%');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5, left: 15, right: 10, bottom: 0),
          child: Text(
            'Current Fund',
            style: TextStyle(fontSize: 20, color: Colors.blueGrey),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey[200]),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'CAPF',
                      style: textStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'BALF',
                      style: textStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'INTF',
                      style: textStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'DIVF',
                      style: textStyle,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      currentFundCardDetails.CAPF,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      currentFundCardDetails.BALF,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      currentFundCardDetails.INTF,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      currentFundCardDetails.DIVF,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
