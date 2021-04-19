import 'package:flutter/material.dart';
import '../Models/user_models.dart';
import '../Components/buttons/save_button.dart';
import '../Components/buttons/cancel_button.dart';

class LoanCard extends StatefulWidget {
  FundSummary obj;

  LoanCard({this.obj});

  @override
  _LoanCardState createState() => _LoanCardState();
}

const TextStyle textStyle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

class _LoanCardState extends State<LoanCard> {
  LoanDetails loanDetails = LoanDetails(100000, 1000000, 1000000);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5, left: 15, right: 10, bottom: 0),
          child: Text(
            'Loan Quotation',
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
                      'Surrender Values(Basic Plans)',
                      style: textStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Total Fund Balances',
                      style: textStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Reversionary Bonus',
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
                      loanDetails.surrenderValues.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      (loanDetails.totalFundBalances +
                              widget.obj.divf +
                              widget.obj.intf +
                              widget.obj.balf +
                              widget.obj.capf)
                          .toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      loanDetails.reversionaryBonus.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 5, left: 15, right: 10, bottom: 0),
            child: Text(
              'Loan Value : ${loanDetails.surrenderValues + loanDetails.totalFundBalances + loanDetails.reversionaryBonus + widget.obj.divf + widget.obj.intf + widget.obj.balf + widget.obj.capf}',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CancelButton(),
              SaveButton(
                saveChanges: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
