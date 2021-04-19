import 'package:flutter/material.dart';
import '../Components/date_time_picker.dart';

class ReportChangeCard extends StatefulWidget {
  Function generateReport;
  ReportChangeCard({this.generateReport, Key key}) : super(key: key);
  @override
  _ReportChangeCardState createState() => _ReportChangeCardState();
}

class _ReportChangeCardState extends State<ReportChangeCard> {
  String option = 'Unit';
  String fromDate;
  String toDate;

  setFromDate(date) {
    setState(() {
      this.fromDate = date;
    });
    print(fromDate);
  }

  setToDate(date) {
    setState(() {
      this.toDate = date;
    });
    print(toDate);
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 10),
          child: Text(
            'Select Your Choice',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          title: const Text('Unit Statement'),
          leading: Radio(
            value: 'Unit',
            groupValue: option,
            onChanged: (value) {
              setState(() {
                option = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Premium Paid Statement'),
          leading: Radio(
            value: 'Premium',
            groupValue: option,
            onChanged: (value) {
              setState(() {
                option = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 40),
          child: DateTimePickerDOB(
            title: 'From Date',
            setDate: setFromDate,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 40),
          child: DateTimePickerDOB(
            title: 'To Date',
            setDate: setToDate,
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 120,
                    child: RaisedButton(
                      onPressed: () {
                        widget.generateReport(
                            this.option, this.fromDate, this.toDate);
                      },
                      color: Colors.lightBlue,
                      child: Text('Generate'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
