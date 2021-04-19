import '../../Components/policyListCards/topup_change_card.dart';
import '../../Components/report_generation_card.dart';
import '../../Components/custom_appbar.dart';
import '../../Components/custom_dropdown.dart';
import '../../constants.dart';
import 'package:flutter/material.dart';

class ReportGenerationFinalScreen extends StatefulWidget {
  List<dynamic> selectedCards;
  int choice;
  ReportGenerationFinalScreen({this.selectedCards, this.choice, Key key})
      : super(key: key);
  @override
  _ReportGenerationFinalScreenState createState() =>
      _ReportGenerationFinalScreenState();
}

class _ReportGenerationFinalScreenState
    extends State<ReportGenerationFinalScreen> {
  dynamic formObject;
  @override
  void initState() {
    // TODO: implement initState
    print(widget.selectedCards.length);
    super.initState();
  }

  giveCard(int index) {
    return CustomDropdown(
      text: widget.selectedCards[index].policyNo,
      card: TopupChangeCard(
        object: widget.selectedCards[index],
      ),
    );
  }

  void generateReport(String reportType, String fromDate, String toDate) {
    print(reportType);
    print(fromDate);
    print(toDate);
    switch (reportType) {
      case 'Unit':
        print('unit statement selected');
        break;
      case 'Premium':
        print('premium paid statement selected');
        break;
    }
  }

  Widget createForm() {
    return ReportChangeCard(
      generateReport: this.generateReport,
    );
  }

  List<Widget> createDropdowns() {
    List<Widget> list = [];
    for (int i = 0; i < widget.selectedCards.length; i++) {
      list.add(giveCard(i));
    }
    list.add(createForm());
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          changesOptions[widget.choice], '', '', Size.fromHeight(100)),
      body: ListView(
        children: createDropdowns(),
      ),
    );
  }
}
