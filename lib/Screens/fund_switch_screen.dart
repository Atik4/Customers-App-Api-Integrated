import 'package:flutter/material.dart';
import '../API_Handler/api_handler_class.dart';
import '../Components/benefit_summary.dart';
import '../Components/current_fund_card.dart';
import '../Components/custom_appbar.dart';
import '../Components/fund_switch_card.dart';
import '../Components/rider_info.dart';
import '../Models/user_models.dart';

class FundSwitchScreen extends StatelessWidget {
  final dynamic object;
  FundSwitchScreen({this.object});
  ApiHandler _apiHandler = ApiHandler();
  PremiumInfo getRiderInfo(String policyNo) {
    return _apiHandler.getRiderInfo(policyNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Fund Switch', '', '', Size.fromHeight(120)),
      body: Container(
        child: ListView(
          children: [
            RiderInfo(),
            BenefitSummaryCard(),
            CurrentFundCard(),
            FundSwitchCard(),
          ],
        ),
      ),
    );
  }
}
