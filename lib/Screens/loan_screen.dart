import 'package:flutter/material.dart';
import '../Components/loan_card.dart';
import '../API_Handler/api_handler_class.dart';
import '../Components/benefit_summary.dart';
import '../Components/custom_appbar.dart';
import '../Components/fund_summary_card.dart';
import '../Components/rider_info.dart';
import '../Models/user_models.dart';

class LoanScreen extends StatelessWidget {
  FundSummary obj = FundSummary(5000, 10000, 15000, 20000);

  final dynamic object;
  LoanScreen({this.object});
  ApiHandler _apiHandler = ApiHandler();
  PremiumInfo getRiderInfo(String policyNo) {
    return _apiHandler.getRiderInfo(policyNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Loan Quotation', '', '', Size.fromHeight(120)),
      body: Container(
        child: ListView(
          children: [
            RiderInfo(),
            BenefitSummaryCard(),
            FundSummaryCard(
              obj: obj,
            ),
            LoanCard(
              obj: obj,
            ),
          ],
        ),
      ),
    );
  }
}
