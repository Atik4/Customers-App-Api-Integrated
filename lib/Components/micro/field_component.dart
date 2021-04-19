import 'package:flutter/material.dart';

class FieldComponent extends StatelessWidget {
  final String field, value;
  FieldComponent({this.field, this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.field,
            style: TextStyle(color: Colors.blueGrey, fontSize: 13),
          ),
          Text(
            this.value,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
