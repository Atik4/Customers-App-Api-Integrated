import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import '../Screens/payment_gateway.dart';
import 'buttons/cancel_button.dart';

class TopupCard extends StatefulWidget {
  @override
  _TopupCardState createState() => _TopupCardState();
}

const TextStyle textStyle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

class _TopupCardState extends State<TopupCard> {
  TextEditingController nameController1 = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  TextEditingController nameController3 = TextEditingController();
  TextEditingController nameController4 = TextEditingController();

  TextEditingController topupcontroller = TextEditingController();

  String dropdownValue1 = 'CAPF';
  String dropdownValue2 = 'BALF';
  String dropdownValue3 = 'INTF';
  String dropdownValue4 = 'DIVF';

  bool flag = true;

  Map<String, double> map1 = {
    'dropdownValue1': 0.0,
    'dropdownValue2': 0.0,
    'dropdownValue3': 0.0,
    'dropdownValue4': 0.0,
  };

  Map<String, double> map2 = {
    'dropdownValue1': 0.0,
    'dropdownValue2': 0.0,
    'dropdownValue3': 0.0,
    'dropdownValue4': 0.0,
  };

  void func(String text, double value) {
    map1[text] = value;
    map2[text] = value * 0.01 * double.parse(topupcontroller.text);
  }

  Widget display() {
    double sum = 0;

    if (map1.length > 0) {
      map1.forEach((key, value) {
        sum = sum + value;
      });

      if (sum != 100.0) {
        setState(() {
          flag = false;
        });
        return Padding(
          padding: const EdgeInsets.only(left: 70, right: 70, top: 10),
          child: Text(
            'Total should be equal to 100.0 %',
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5, left: 15, right: 10, bottom: 20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Top-up To ',
                  style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                ),
                Container(
                  width: 80,
                  margin: const EdgeInsets.only(left: 20),
                  color: Colors.blueGrey[50],
                  child: TextFormField(
                    controller: topupcontroller,
                    decoration: InputDecoration(filled: false),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      print(val);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      '(%)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Target Amount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
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
                  child: Text('${map2['dropdownValue1']}'),
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
                child: Text('${map2['dropdownValue2']}'),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
                child: Text('${map2['dropdownValue3']}'),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
                child: Text('${map2['dropdownValue4']}'),
              )
            ]),
            display(),
          ],
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
                    onPressed: flag
                        ? () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentGateway(
                                          totalPremiumAmount: double.parse(
                                              topupcontroller.text))))
                            }
                        : null,
                    color: Colors.lightBlue,
                    child: Text('Pay'),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
