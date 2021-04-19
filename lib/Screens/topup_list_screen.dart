import '../Components/custom_appbar.dart';
import '../Components/policyListCards/topup_change_card.dart';
import '../Components/search_bar.dart';
import '../Screens/topup/premium_redirection_final_screen.dart';
import '../Screens/topup/topup_final_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class TopupListScreen extends StatefulWidget {
  int choice;
  TopupListScreen({this.choice, Key key}) : super(key: key);
  @override
  _TopupListScreenState createState() => _TopupListScreenState();
}

class _TopupListScreenState extends State<TopupListScreen> {
  final ScrollController _scrollController = ScrollController();
  int count = 0;
  List<dynamic> selectedPolicies = [];
  List<dynamic> selectedCards = [];
  List<dynamic> listAll = [];
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

  void addSelected(dynamic object) {
    setState(() {
      selectedPolicies.add(object);
    });
    print(selectedPolicies.length);
  }

  void unSelectCard(dynamic object) {
    setState(() {
      selectedPolicies.remove(object);
    });
    print(selectedPolicies.length);
  }

  getCardContentList() {
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
    if (widget.choice == 6) return 'Top up Contribution';
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
                      increaseCount: this.increaseCount,
                      decreaseCount: this.decreaseCount,
                      addSelected: this.addSelected,
                      unSelect: this.unSelectCard,
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
  Function increaseCount, decreaseCount, addSelected, unSelect;
  PolicyCard(
      {this.cardContent,
      this.choice,
      this.increaseCount,
      this.decreaseCount,
      this.addSelected,
      this.unSelect,
      Key key})
      : super(key: key);
  @override
  _PolicyCardState createState() => _PolicyCardState();
}

class _PolicyCardState extends State<PolicyCard> {
  getScreen() {
    if (widget.choice == 6)
      return TopupFinalScreen(
        object: widget.cardContent,
      );
    return PremiumRedirectionFinalScreen(
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
        child: TopupChangeCard(
          object: widget.cardContent,
        ),
      ),
    );
  }
}
