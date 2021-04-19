import '../Components/custom_appbar.dart';
import '../Models/user_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/search_bar.dart';
import '../constants.dart';
import '../Components/service_request_card.dart';

const Color Color1 = Color.fromRGBO(146, 132, 110, 1);
const Color Color2 = Color.fromRGBO(194, 183, 168, 0.6);
const Color Color3 = Color.fromRGBO(226, 221, 212, 0.3);

class ServiceRequestList extends StatefulWidget {
  @override
  _ServiceRequestListState createState() => _ServiceRequestListState();
}

class _ServiceRequestListState extends State<ServiceRequestList> {
  final ScrollController _scrollController = ScrollController();
  List<ServiceRequest> filteredList = [];
  String dropdownValue = 'Select';

  void createFilteredList(String input) {
    if (input.isEmpty) {
      setState(() {
        filteredList = serviceRequestList;
      });
    } else {
      List<ServiceRequest> temp = [];
      serviceRequestList.map((serviceRequest) {
        String srNo = serviceRequest.srNo.toLowerCase();
        if (srNo.contains(input.toLowerCase())) temp.add(serviceRequest);
      }).toList();
      setState(() {
        filteredList = temp;
      });
    }
  }

  void sortList() {
    if (dropdownValue == 'Status') {
      filteredList.sort((a, b) => a.status.compareTo(b.status));
    } else if (dropdownValue == 'RaisedDate') {
      filteredList.sort((a, b) => a.srDate.compareTo(b.srDate));
    } else if (dropdownValue == 'CompletionDate') {
      filteredList.sort((a, b) => a.completionDate.compareTo(b.completionDate));
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
      backgroundColor: Color.fromRGBO(243, 250, 172, 1),
      appBar: CustomAppBar('Service Request', '', '', Size.fromHeight(100)),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 15,
            ),
            SearchField(
              searchFunction: createFilteredList,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'Sort By',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        sortList();
                      });
                    },
                    items: <String>[
                      'Select',
                      'RaisedDate',
                      'CompletionDate',
                      'Status',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: filteredList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FlatButton(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            title: Text(
                              filteredList[index].srNo,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Text('SR date : ${filteredList[index].srDate}',
                                    style:
                                        TextStyle(fontSize: 12, color: Color1)),
                                Text(
                                    'SR Completion Date: ${filteredList[index].completionDate}',
                                    style:
                                        TextStyle(fontSize: 12, color: Color1)),
                              ],
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 30,
                                ),
                                Text('Status: ${filteredList[index].status}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color1,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServiceRequestCard()));
                        });
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
