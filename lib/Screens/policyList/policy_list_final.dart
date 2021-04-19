import '../../Screens/fund_switch_screen.dart';
import '../../Screens/loan_screen.dart';

import '../../Screens/topup/topup_final_screen.dart';

import '../../Screens/payment_gateway.dart';
import '../../API_Handler/api_handler_class.dart';
import '../../Components/buttons/functional_button.dart';
import '../../Components/custom_appbar.dart';
import '../../Components/rider_info.dart';
import '../../Components/benefit_details.dart';
import '../../Components/benefit_summary.dart';
import '../../Components/fund_summary_card.dart';
import '../../Models/user_models.dart';
import 'package:flutter/material.dart';

class PolicyListFinalScreen extends StatelessWidget {
  FundSummary obj = FundSummary(5000, 10000, 15000, 20000);
  final dynamic object;
  PolicyListFinalScreen({this.object});
  ApiHandler _apiHandler = ApiHandler();
  PremiumInfo getRiderInfo(String policyNo) {
    return _apiHandler.getRiderInfo(policyNo);
  }

  createButtons(BuildContext context) {
    PolicyPremium obj;
    obj = object;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FunctionalButton(
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PaymentGateway(totalPremiumAmount: obj.premium)));
              },
              text: 'Pay Premium',
            ),
            FunctionalButton(
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoanScreen(
                              object: object,
                            )));
              },
              text: 'Apply Loan',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FunctionalButton(
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TopupFinalScreen(
                              object: object,
                            )));
              },
              text: 'Pay Top-up',
            ),
            FunctionalButton(
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FundSwitchScreen(
                              object: object,
                            )));
              },
              text: 'Fund Switch',
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Premium Details', '', '', Size.fromHeight(120)),
      body: Container(
        child: ListView(
          children: [
            RiderInfo(),
            BenefitSummaryCard(),
            BenefitDetailsCard(),
            FundSummaryCard(
              obj: obj,
            ),
            createButtons(context)
          ],
        ),
      ),
    );
  }
}
