import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

import 'buttons/cancel_button.dart';

class FundSwitchCard extends StatefulWidget {
  @override
  _FundSwitchCardState createState() => _FundSwitchCardState();
}

const TextStyle textStyle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

class _FundSwitchCardState extends State<FundSwitchCard> {
  TextEditingController nameController1 = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  TextEditingController nameController3 = TextEditingController();
  TextEditingController nameController4 = TextEditingController();
  TextEditingController nameController5 = TextEditingController();
  TextEditingController nameController6 = TextEditingController();
  TextEditingController nameController7 = TextEditingController();
  TextEditingController nameController8 = TextEditingController();

  String dropdownValue1 = 'CAPF';
  String dropdownValue2 = 'BALF';
  String dropdownValue3 = 'INTF';
  String dropdownValue4 = 'DIVF';

  String dropdownValue5 = 'CAPF';
  String dropdownValue6 = 'BALF';
  String dropdownValue7 = 'INTF';
  String dropdownValue8 = 'DIVF';

  bool flag1 = true;
  bool flag2 = true;

  Map<String, double> map1 = {
    'dropdownValue1': 0.0,
    'dropdownValue2': 0.0,
    'dropdownValue3': 0.0,
    'dropdownValue4': 0.0,
  };

  Map<String, double> map2 = {
    'dropdownValue5': 0.0,
    'dropdownValue6': 0.0,
    'dropdownValue7': 0.0,
    'dropdownValue8': 0.0,
  };

  void func1(String text, double value) {
    map1[text] = value;
  }

  void func2(String text, double value) {
    map2[text] = value;
  }

  Widget display() {
    double sum1 = 0;

    if (map1.length > 0) {
      map1.forEach((key, value) {
        sum1 = sum1 + value;
      });

      if (sum1 != 100.0) {
        setState(() {
          flag1 = false;
        });
      } else {
        setState(() {
          flag1 = true;
        });
      }
    }

    double sum2 = 0;

    if (map2.length > 0) {
      map2.forEach((key, value) {
        sum2 = sum2 + value;
      });

      if (sum2 != 100.0) {
        setState(() {
          flag2 = false;
        });
      } else {
        setState(() {
          flag2 = true;
        });
      }
    }

    if (!flag1 || !flag2) {
      return Padding(
        padding: const EdgeInsets.only(left: 70, right: 70, top: 10),
        child: Text(
          'Total should be equal to 100.0 %',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 70, right: 70, top: 10),
        child: Text(
          '',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'Switch From',
                        style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: Text(
                        'Switch To',
                        style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 5.0, right: 20),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: AutoSizeTextField(
                        controller: nameController1,
                        fullwidth: false,
                        minFontSize: 12,
                        minWidth: 20,
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            func1('dropdownValue1',
                                double.parse(nameController1.text).toDouble());
                          });
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 20, right: 20),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: AutoSizeTextField(
                        controller: nameController5,
                        fullwidth: false,
                        minFontSize: 12,
                        minWidth: 20,
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          setState(() {
                            func2('dropdownValue5',
                                double.parse(nameController5.text).toDouble());
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 20),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: AutoSizeTextField(
                          controller: nameController2,
                          fullwidth: false,
                          minFontSize: 12,
                          minWidth: 20,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              func1(
                                  'dropdownValue2',
                                  double.parse(nameController2.text)
                                      .toDouble());
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20, right: 20),
                        child: DropdownButton<String>(
                          value: dropdownValue6,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue6 = newValue;
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: AutoSizeTextField(
                          controller: nameController6,
                          fullwidth: false,
                          minFontSize: 12,
                          minWidth: 20,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              func2(
                                  'dropdownValue6',
                                  double.parse(nameController6.text)
                                      .toDouble());
                            });
                          },
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 20),
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
                            'INTF',
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: AutoSizeTextField(
                          controller: nameController3,
                          fullwidth: false,
                          minFontSize: 12,
                          minWidth: 20,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              func1(
                                  'dropdownValue3',
                                  double.parse(nameController3.text)
                                      .toDouble());
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20, right: 20),
                        child: DropdownButton<String>(
                          value: dropdownValue7,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue7 = newValue;
                            });
                          },
                          items: <String>[
                            'INTF',
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: AutoSizeTextField(
                          controller: nameController7,
                          fullwidth: false,
                          minFontSize: 12,
                          minWidth: 20,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              func2(
                                  'dropdownValue7',
                                  double.parse(nameController7.text)
                                      .toDouble());
                            });
                          },
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 20),
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
                            'DIVF',
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: AutoSizeTextField(
                          controller: nameController4,
                          fullwidth: false,
                          minFontSize: 12,
                          minWidth: 20,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              func1(
                                  'dropdownValue4',
                                  double.parse(nameController4.text)
                                      .toDouble());
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20, right: 20),
                        child: DropdownButton<String>(
                          value: dropdownValue8,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue8 = newValue;
                            });
                          },
                          items: <String>[
                            'DIVF',
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: AutoSizeTextField(
                          controller: nameController8,
                          fullwidth: false,
                          minFontSize: 12,
                          minWidth: 20,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              func2(
                                  'dropdownValue8',
                                  double.parse(nameController8.text)
                                      .toDouble());
                            });
                          },
                        ),
                      ),
                    ]),
                display(),
              ],
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CancelButton(),
                Container(
                  width: 120,
                  child: RaisedButton(
                    onPressed: flag1 && flag2 ? () {} : null,
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
