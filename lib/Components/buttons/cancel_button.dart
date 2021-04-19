import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: Colors.lightBlue,
        child: Text('Cancel'),
      ),
    );
  }
}
