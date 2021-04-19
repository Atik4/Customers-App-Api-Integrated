import 'package:flutter/material.dart';

class DateTimePickerDOB extends StatefulWidget {
  String title;
  Function setDate;
  DateTimePickerDOB({this.title, this.setDate, Key key}) : super(key: key);
  @override
  _DateTimePickerDOBState createState() => _DateTimePickerDOBState();
}

class _DateTimePickerDOBState extends State<DateTimePickerDOB> {
  DateTime selectedDate = DateTime.now();
  final fieldText = TextEditingController();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1990),
      lastDate: DateTime(2040),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.setDate(convertDateToStringFormat(picked));
      // fieldText.value =
      //     TextEditingValue(text: '${selectedDate.toString()}'.split(' ')[0]);
      fieldText.value =
          TextEditingValue(text: convertDateToStringFormat(picked));
    }
  }

  String convertDateToStringFormat(DateTime date) {
    String day = date.day.toString();
    if (day.length == 1) day = '0' + day;
    String month = date.month.toString();
    if (month.length == 1) month = '0' + month;
    String year = date.year.toString();
    return day + '/' + month + '/' + year;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            keyboardType: null,
            readOnly: true,
            showCursor: false,
            decoration: InputDecoration(
              labelText: widget.title,
            ),
            enabled: true,
            controller: fieldText,
            onTap: () => _selectDate(context),
          ),
        ],
      ),
    );
  }
}
