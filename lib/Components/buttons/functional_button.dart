import 'package:flutter/material.dart';

class FunctionalButton extends StatelessWidget {
  final Function function;
  final String text;
  FunctionalButton({this.function, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: RaisedButton(
        onPressed: () {
          function();
        },
        color: Colors.lightBlue,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(this.text),
        ),
      ),
    );
  }
}
