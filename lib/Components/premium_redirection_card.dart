import 'buttons/save_button.dart';
import 'package:flutter/material.dart';
import 'buttons/cancel_button.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';

const TextStyle textStyle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

class PremiumRedirectionCard extends StatefulWidget {
  @override
  _PremiumRedirectionCardState createState() => _PremiumRedirectionCardState();
}

class _PremiumRedirectionCardState extends State<PremiumRedirectionCard> {
  TextEditingController nameController1 = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  TextEditingController nameController3 = TextEditingController();
  TextEditingController nameController4 = TextEditingController();
  TextEditingController nameController5 = TextEditingController();

  String dropdownValue1 = 'CAPF';
  String dropdownValue2 = 'BALF';
  String dropdownValue3 = 'DALF';
  String dropdownValue4 = 'EALF';
  String dropdownValue5 = 'HALF';

  bool flag = true;

  Map<String, double> map = {
    'dropdownValue1': 0.0,
    'dropdownValue2': 0.0,
    'dropdownValue3': 0.0,
    'dropdownValue4': 0.0,
    'dropdownValue5': 0.0,
  };

  void func(String text, double value) {
    map[text] = value;
  }

  Widget display() {
    double sum = 0;
    if (map.length > 0) {
      map.forEach((key, value) {
        sum = sum + value;
      });

      if (sum > 100.0) {
        setState(() {
          flag = false;
        });
        return Padding(
          padding: const EdgeInsets.only(left: 70, right: 70, top: 10),
          child: Text(
            'Total should be less than 100.0 %',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        );
      } else {
        setState(() {
          flag = true;
        });
        return Text('');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(top: 5, left: 15, right: 10, bottom: 0),
            child: Text(
              'Future Premium Redirections',
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[200]),
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: DropdownButton<String>(
                          value: dropdownValue1,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue1 = newValue;
                            });
                          },
                          items: <String>[
                            'CAPF',
                            'ABC',
                            'DEF',
                            'EFG',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),
                    AutoSizeTextField(
                      controller: nameController1,
                      fullwidth: false,
                      minFontSize: 12,
                      minWidth: 20,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        setState(() {
                          func('dropdownValue1',
                              double.parse(nameController1.text).toDouble());
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text('%'),
                    )
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: DropdownButton<String>(
                          value: dropdownValue2,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue2 = newValue;
                            });
                          },
                          items: <String>[
                            'BALF',
                            'ABC',
                            'DEF',
                            'EFG',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      AutoSizeTextField(
                        controller: nameController2,
                        fullwidth: false,
                        minFontSize: 12,
                        minWidth: 20,
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            func('dropdownValue2',
                                double.parse(nameController2.text).toDouble());
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('%'),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: DropdownButton<String>(
                          value: dropdownValue3,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue3 = newValue;
                            });
                          },
                          items: <String>[
                            'DALF',
                            'ABC',
                            'DEF',
                            'EFG',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      AutoSizeTextField(
                        controller: nameController3,
                        fullwidth: false,
                        minFontSize: 12,
                        minWidth: 20,
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            func('dropdownValue3',
                                double.parse(nameController3.text).toDouble());
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('%'),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: DropdownButton<String>(
                          value: dropdownValue4,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue4 = newValue;
                            });
                          },
                          items: <String>[
                            'EALF',
                            'ABC',
                            'DEF',
                            'EFG',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      AutoSizeTextField(
                        controller: nameController4,
                        fullwidth: false,
                        minFontSize: 12,
                        minWidth: 20,
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            func('dropdownValue4',
                                double.parse(nameController4.text).toDouble());
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('%'),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: DropdownButton<String>(
                            value: dropdownValue5,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue5 = newValue;
                              });
                            },
                            items: <String>[
                              'HALF',
                              'ABC',
                              'DEF',
                              'EFG',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                      AutoSizeTextField(
                        controller: nameController5,
                        fullwidth: false,
                        minFontSize: 12,
                        minWidth: 20,
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            func('dropdownValue5',
                                double.parse(nameController5.text).toDouble());
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('%'),
                      )
                    ]),
              ],
            ),
          ),
          display(),
        ]),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CancelButton(),
                Container(
                  width: 120,
                  child: RaisedButton(
                    onPressed: flag ? () => Navigator.pop(context) : null,
                    color: Colors.lightBlue,
                    child: Text('Confirm'),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
