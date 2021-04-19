import '../../API_Handler/api_handler_class.dart';
import '../../Components/custom_appbar.dart';
import '../../Components/fund_summary_card.dart';
import '../../Components/premium_redirection_card.dart';
import '../../Components/rider_info.dart';
import '../../Components/topup_cards.dart';
import '../../Models/user_models.dart';
import 'package:flutter/material.dart';

class PremiumRedirectionFinalScreen extends StatelessWidget {
  FundSummary obj = FundSummary(5000, 10000, 15000, 20000);
  final dynamic object;
  PremiumRedirectionFinalScreen({this.object});
  ApiHandler _apiHandler = ApiHandler();
  PremiumInfo getRiderInfo(String policyNo) {
    return _apiHandler.getRiderInfo(policyNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Premium Redirection', '', '', Size.fromHeight(120)),
      body: Container(
        child: ListView(
          children: [
            RiderInfo(),
            FundSummaryCard(
              obj: obj,
            ),
            PremiumRedirectionCard(),
          ],
        ),
      ),
    );
  }
}
