import '../../Components/current_fund_card.dart';

import '../../Components/benefit_summary.dart';

import '../../API_Handler/api_handler_class.dart';
import '../../Components/custom_appbar.dart';
import '../../Components/rider_info.dart';
import '../../Components/topup_cards.dart';
import '../../Models/user_models.dart';
import 'package:flutter/material.dart';

class TopupFinalScreen extends StatelessWidget {
  final dynamic object;
  TopupFinalScreen({this.object});
  ApiHandler _apiHandler = ApiHandler();
  PremiumInfo getRiderInfo(String policyNo) {
    return _apiHandler.getRiderInfo(policyNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Topup Contribution', '', '', Size.fromHeight(120)),
      body: Container(
        child: ListView(
          children: [
            RiderInfo(),
            BenefitSummaryCard(),
            CurrentFundCard(),
            TopupCard(),
          ],
        ),
      ),
    );
  }
}
