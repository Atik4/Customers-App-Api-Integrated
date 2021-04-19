import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  Function searchFunction;
  SearchField({this.searchFunction, Key key}) : super(key: key);
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  String input = "";
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: Container(
          child: TextField(
              controller: _controller,
              onChanged: (val) {
                input = val;
                widget.searchFunction(input);
              },
              autofocus: false,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                  suffixIcon: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                  border: InputBorder.none,
                  hintText: "Search...")),
        ),
      ),
    );
  }
}
