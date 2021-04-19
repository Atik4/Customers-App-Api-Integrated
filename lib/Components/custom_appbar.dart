import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color Color1 = Color.fromRGBO(146, 132, 110, 1);
const Color Color2 = Color.fromRGBO(194, 183, 168, 0.6);
const Color Color3 = Color.fromRGBO(226, 221, 212, 0.3);
//const Color mainColor = Color(0xFF92846E);

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final String username;
  final String month;
  CustomAppBar(
    this.title,
    this.username,
    this.month,
    this.preferredSize, {
    Key key,
  }) : super(key: key);

  Widget util(String field) {
    if (field.isNotEmpty) {
      return FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          field,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      );
    }
    return Container();
  }

  Widget returnContent() {
    if (username.isEmpty) {
      return util(title);
    } else if (month.isEmpty) {
      return Column(
        children: [
          util(title),
          util('for'),
          util(username),
        ],
      );
    } else {
      return Column(
        children: [
          util(title),
          util('of'),
          util(username),
          util('$month 2021')
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Container(
        padding: EdgeInsets.only(top: 35),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(right: 20, left: 10),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 0,
                focusColor: Colors.amberAccent,
                hoverColor: Colors.amberAccent,
                backgroundColor: Colors.amberAccent,
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Text(
            //       title,
            //       style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 25,
            //           fontWeight: FontWeight.w600),
            //     ),
            //     username.isNotEmpty ? util('of') : SizedBox.shrink(),
            //     util(username),
            //     month.isNotEmpty ? util('$month 2021') : SizedBox.shrink(),
            //   ],
            // ),
            returnContent(),
            // Container(
            //   width: 45,
            //   height: 45,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //         image: NetworkImage(
            //             "https://s3.amazonaws.com/cms-assets.tutsplus.com/uploads/users/810/profiles/19338/profileImage/profile-square-extra-small.png"),
            //         fit: BoxFit.fill),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
