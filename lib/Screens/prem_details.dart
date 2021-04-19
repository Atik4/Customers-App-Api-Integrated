import '../Components/buttons/functional_button.dart';
import '../Components/custom_appbar.dart';
import '../Components/fund_summary_card.dart';
import '../Models/user_models.dart';
import '../Screens/changes_screen.dart';
import '../constants.dart';
import '../Components/benefit_details.dart';
import '../Components/benefit_summary.dart';
import '../Components/rider_info.dart';
import 'package:flutter/material.dart';

class PremDetails extends StatelessWidget {
  FundSummary obj = FundSummary(5000, 10000, 15000, 20000);
  final PolicyPremium policyPremium;
  final int choice;

  PremDetails({this.policyPremium, this.choice});

  final ScrollController _scrollController = ScrollController();

  Widget createButtons(BuildContext context) {
    if (choice >= 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FunctionalButton(
            function: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChangesScreen(
                  choice: this.choice,
                );
              }));
            },
            text: changesOptions[choice],
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FunctionalButton(
                function: () {},
                text: 'Pay Premium',
              ),
              FunctionalButton(
                function: () {},
                text: 'Apply Loan',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FunctionalButton(
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChangesScreen(
                      choice: 6,
                    );
                  }));
                },
                text: 'Pay Top-up',
              ),
              FunctionalButton(
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChangesScreen(
                      choice: 5,
                    );
                  }));
                },
                text: 'Fund Switch',
              ),
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Premium Details", '', '', Size.fromHeight(100)),
      body: Container(
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            controller: _scrollController,
            children: [
              RiderInfo(),
              BenefitSummaryCard(),
              BenefitDetailsCard(),
              FundSummaryCard(
                obj: obj,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: createButtons(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
