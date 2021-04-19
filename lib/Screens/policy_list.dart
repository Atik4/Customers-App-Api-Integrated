import '../Components/policyListCards/address_card.dart';

import '../Screens/prem_details.dart';
import 'package:flutter/material.dart';
import '../Components/custom_appbar.dart';
import '../Models/user_models.dart';
import 'package:flutter/cupertino.dart';
import '../Components/search_bar.dart';
import '../constants.dart';

class PolicyList extends StatefulWidget {
  int month, choice;
  PolicyList({this.month, this.choice, Key key}) : super(key: key);
  @override
  _PolicyListState createState() => _PolicyListState();
}

class _PolicyListState extends State<PolicyList> {
  double totalPremium = 0;
  final ScrollController _scrollController = ScrollController();
  int count = 0;
  List<String> selectedPolicies = [];
  List<dynamic> selectedCards = [];
  List<bool> isSelected = [];
  void increaseCount() {
    setState(() {
      count++;
    });
  }

  void decreaseCount() {
    setState(() {
      count--;
    });
  }

  List<PolicyPremium> filteredList = [];
  void createFilteredList(String input) {
    if (input.isEmpty) {
      setState(() {
        filteredList = listPolicyPremium;
      });
    } else {
      List<PolicyPremium> temp = [];
      listPolicyPremium.map((policyPremium) {
        String product = policyPremium.product.toLowerCase();
        if (product.contains(input.toLowerCase())) temp.add(policyPremium);
      }).toList();
      setState(() {
        filteredList = temp;
      });
      totalPremium = 0;
      for (int i = 0; i < filteredList.length; i++) {
        setState(() {
          totalPremium += filteredList[i].premium;
        });
      }
    }
  }

  @override
  void initState() {
    createFilteredList("");
    totalPremium = 0;
    for (int i = 0; i < filteredList.length; i++) {
      setState(() {
        totalPremium += filteredList[i].premium;
      });
    }
    // TODO: implement initState
    super.initState();
  }

  Widget createAppBar() {
    if (widget.month != null)
      return CustomAppBar('Premium Summary', 'VR Ravichandran',
          monthsList[widget.month], Size.fromHeight(140));
    return CustomAppBar(
        'Premium Summary', 'VR Ravichandran', '', Size.fromHeight(120));
  }

  Widget createButtons() {
    if (widget.choice == -1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.amber),
            child: Padding(
                padding: EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 5),
                child: Column(
                  children: [
                    Text(
                      'Total Premium',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      this.totalPremium.toString(),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            child: RaisedButton(
              color: Colors.amber,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text(
                      'Pay Premium',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      //size: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
      child: RaisedButton(
        color: Colors.amber,
        onPressed: () {
          if (count > 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PremDetails(
                //policyPremium: widget.policyPremium,
                choice: widget.choice,
              );
            }));
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Change Address',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.arrow_forward,
                //size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      backgroundColor: Color.fromRGBO(243, 250, 172, 1),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            SearchField(
              searchFunction: createFilteredList,
            ),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: filteredList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PolicyCard(
                      policyPremium: filteredList[index],
                      choice: widget.choice,
                      increaseCount: this.increaseCount,
                      decreaseCount: this.decreaseCount,
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: createButtons(),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PolicyCard extends StatefulWidget {
  PolicyPremium policyPremium;
  int choice;
  Function increaseCount, decreaseCount;
  PolicyCard(
      {this.policyPremium,
      this.choice,
      this.increaseCount,
      this.decreaseCount,
      Key key})
      : super(key: key);
  @override
  _PolicyCardState createState() => _PolicyCardState();
}

class _PolicyCardState extends State<PolicyCard> {
  bool isLongPressed = false;
  Address address = Address(
      line1: '9, Harshit Nagar',
      line2: 'Shree Ram Chawk',
      line3: 'Mohba Bazar',
      pinCode: '492099',
      city: 'Raipur',
      mobile: '+91 8717892888',
      email: 'atikagarwal4@gmail.com');
  Widget cardContent() {
    if (widget.choice == -1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text('Product : ' + widget.policyPremium.product),
              ),
              Container(
                child: Text('Start Date: ' + widget.policyPremium.startDate),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Due: ' + widget.policyPremium.endDate,
              ),
              Text(
                'Prem: ' + widget.policyPremium.premium.toString(),
              ),
            ],
          ),
        ],
      );
    } else {
      return AddressCard(
        address: address,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        child: FlatButton(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return PremDetails(
            //     policyPremium: widget.policyPremium,
            //     choice: widget.choice,
            //   );
            // }));
            setState(() {
              isLongPressed = false;
            });
            widget.decreaseCount();
            print(isLongPressed);
          },
          onLongPress: () {
            setState(() {
              isLongPressed = true;
            });
            widget.increaseCount();
            print(isLongPressed);
          },
          child: Card(
            color: !isLongPressed ? Colors.white : Colors.blueGrey[200],
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            //margin: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      widget.policyPremium.policyNo,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: cardContent(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
