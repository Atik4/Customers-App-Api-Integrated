import '../../Screens/policyList/policy_list_final.dart';

import '../../Components/custom_appbar.dart';
import '../../Components/policyListCards/topup_change_card.dart';
import '../../Components/policyListCards/policy_list_card.dart';
import '../../Components/search_bar.dart';
import '../surrenderQuote/surrender_quote_final.dart';
import 'premium_redirection_final_screen.dart';
import 'topup_final_screen.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class TopupListScreen extends StatefulWidget {
  int choice;
  TopupListScreen({this.choice, Key key}) : super(key: key);
  @override
  _TopupListScreenState createState() => _TopupListScreenState();
}

class _TopupListScreenState extends State<TopupListScreen> {
  final ScrollController _scrollController = ScrollController();
  List<dynamic> listAll = [];

  getCardContentList() {
    if (widget.choice == -1) return listPolicyPremium;
    return listTopupCardClass;
  }

  List<dynamic> filteredList = [];
  void createFilteredList(String input) {
    if (input.isEmpty) {
      setState(() {
        filteredList = getCardContentList();
      });
    } else {
      List<dynamic> temp = [];
      listAll.map((object) {
        String policy = object.policyNo.toLowerCase();
        if (policy.contains(input.toLowerCase())) temp.add(object);
      }).toList();
      setState(() {
        filteredList = temp;
      });
    }
  }

  String appbarTitle() {
    if (widget.choice == -1) return 'Policy List';
    if (widget.choice == 6) return 'Top up Contribution';
    if (widget.choice == 4) return 'Surrender Quote';
    return 'Premium Redirection';
  }

  @override
  void initState() {
    createFilteredList("");
    setState(() {
      this.listAll = getCardContentList();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appbarTitle(), '', '', Size.fromHeight(120)),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
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
                      cardContent: filteredList[index],
                      choice: widget.choice,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PolicyCard extends StatefulWidget {
  dynamic cardContent;
  int choice;
  PolicyCard({this.cardContent, this.choice, Key key}) : super(key: key);
  @override
  _PolicyCardState createState() => _PolicyCardState();
}

class _PolicyCardState extends State<PolicyCard> {
  getScreen() {
    if (widget.choice == -1) {
      return PolicyListFinalScreen(
        object: widget.cardContent,
      );
    } else if (widget.choice == 6)
      return TopupFinalScreen(
        object: widget.cardContent,
      );
    else if (widget.choice == 4) {
      return SurrenderQuoteFinalScreen(
        object: widget.cardContent,
      );
    }
    return PremiumRedirectionFinalScreen(
      object: widget.cardContent,
    );
  }

  getCard() {
    if (widget.choice == -1)
      return PolicyListCard(
        object: widget.cardContent,
      );
    return TopupChangeCard(
      object: widget.cardContent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      child: FlatButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return getScreen();
          }));
        },
        child: getCard(),
      ),
    );
  }
}
