import '../Models/user_models.dart';
import 'package:flutter/material.dart';

class BenefitDetailsCard extends StatefulWidget {
  @override
  _BenefitDetailsCardState createState() => _BenefitDetailsCardState();
}

const TextStyle textStyle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

class _BenefitDetailsCardState extends State<BenefitDetailsCard> {
  BenefitDetails benefitDetails = BenefitDetails(
      'Every 5 years 20%',
      'Full SA with bonus',
      'Full SA with bonus',
      'Accidental SA',
      'Cancer, Heart Attack, Reneal');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5, left: 15, right: 10, bottom: 0),
          child: Text(
            'Benefit Details',
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
                      'Survival Benefit',
                      style: textStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'On Maturity',
                      style: textStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'On Death',
                      style: textStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'On Accidental Death',
                      style: textStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Critical Illness',
                      style: textStyle,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      benefitDetails.survivalBenefit,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      benefitDetails.onMaturity,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      benefitDetails.onDeath,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      benefitDetails.onAccidentalDeath,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      benefitDetails.criticalIllness,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}