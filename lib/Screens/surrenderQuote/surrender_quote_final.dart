import '../../Components/benefit_summary.dart';
import '../../API_Handler/api_handler_class.dart';
import '../../Components/benefit_details.dart';
import '../../Components/custom_appbar.dart';
import '../../Components/fund_summary_card.dart';
import '../../Components/rider_info.dart';
import '../../Components/surrender_quote_card.dart';
import '../../Models/user_models.dart';
import 'package:flutter/material.dart';

class SurrenderQuoteFinalScreen extends StatelessWidget {
  FundSummary obj = FundSummary(5000, 10000, 15000, 20000);

  final dynamic object;
  SurrenderQuoteFinalScreen({this.object});
  ApiHandler _apiHandler = ApiHandler();
  PremiumInfo getRiderInfo(String policyNo) {
    return _apiHandler.getRiderInfo(policyNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Surrender Quote', '', '', Size.fromHeight(120)),
      body: Container(
        child: ListView(
          children: [
            RiderInfo(),
            BenefitDetailsCard(),
            BenefitSummaryCard(),
            FundSummaryCard(
              obj: obj,
            ),
            SurrenderQuoteCard(
              obj: obj,
            ),
          ],
        ),
      ),
    );
  }
}
