import '../../Models/user_models.dart';
import 'package:flutter/material.dart';

import '../buttons/cancel_button.dart';
import '../buttons/save_button.dart';

class FrequencyChangeCard extends StatefulWidget {
  Function setOption;
  FrequencyChangeCard({this.setOption, Key key}) : super(key: key);
  @override
  _FrequencyChangeCardState createState() => _FrequencyChangeCardState();
}

class _FrequencyChangeCardState extends State<FrequencyChangeCard> {
  String option = 'Annual';
  List<String> optionValues = ['Annual', 'Half Annual', 'Quaterly', 'Monthly'];
  void saveChanges() {
    PremiumFrequency frequency = PremiumFrequency(option);
    print('frequency save');
  }

  void fun(value) {
    setState(() {
      option = value;
    });
    widget.setOption(value);
  }

  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 10),
          child: Text(
            'Select Your Frequency',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          title: const Text('Annual'),
          leading: Radio(
            value: 'Annual',
            groupValue: option,
            onChanged: (value) {
              fun(value);
            },
          ),
        ),
        ListTile(
          title: const Text('Half Annual'),
          leading: Radio(
            value: 'Half Annual',
            groupValue: option,
            onChanged: (value) {
              fun(value);
            },
          ),
        ),
        ListTile(
          title: const Text('Quaterly'),
          leading: Radio(
            value: 'Quaterly',
            groupValue: option,
            onChanged: (value) {
              fun(value);
            },
          ),
        ),
        ListTile(
          title: const Text('Monthly'),
          leading: Radio(
            value: 'Monthly',
            groupValue: option,
            onChanged: (value) {
              fun(value);
            },
          ),
        ),
      ],
    );
  }
}
