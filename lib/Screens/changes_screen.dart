import '../Components/benefit_summary.dart';
import '../Components/current_fund_card.dart';
import 'package:flutter/material.dart';
import '../Components/custom_appbar.dart';
import '../Components/rider_info.dart';
import '../constants.dart';

class ChangesScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final int choice;
  ChangesScreen({this.choice});

  Widget changesCard() {
    return changesCards[choice];
  }

  Widget conditionalCards() {
    if (choice == 6) {
      return Column(
        children: [
          BenefitSummaryCard(),
          CurrentFundCard(),
        ],
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(changesOptions[choice], '', '', Size.fromHeight(120)),
      body: Container(
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            controller: _scrollController,
            children: [
              RiderInfo(),
              //conditionalCards(),
              changesCard(),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
