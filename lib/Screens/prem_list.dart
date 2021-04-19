import '../Screens/payment_gateway.dart';
import '../Components/custom_appbar.dart';
import '../Components/premium_policy_card.dart';
import '../Models/user_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/search_bar.dart';
import '../constants.dart';

class PremList extends StatefulWidget {
  int month;
  PremList({this.month, Key key}) : super(key: key);
  @override
  _PremListState createState() => _PremListState();
}

class _PremListState extends State<PremList> {
  double totalPremium = 0;
  final ScrollController _scrollController = ScrollController();
  void addPremium(double value) {
    setState(() {
      totalPremium += value;
    });
  }

  void deletePremium(double value) {
    setState(() {
      totalPremium -= value;
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
    }
  }

  @override
  void initState() {
    createFilteredList("");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Premium Summary', 'VR Ravichandran',
          monthsList[widget.month], Size.fromHeight(140)),
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
                    return PremiumPolicyCard(
                      policyPremium: filteredList[index],
                      addPremium: this.addPremium,
                      deletePremium: this.deletePremium,
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.amber),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 5, right: 10, top: 5, bottom: 5),
                        child: Column(
                          children: [
                            Text(
                              'Total Premium',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
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
                    padding:
                        EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
                    child: RaisedButton(
                      color: Colors.amber,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentGateway(
                                    totalPremiumAmount: totalPremium)));
                      },
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
