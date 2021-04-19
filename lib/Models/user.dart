import 'package:flutter/cupertino.dart';
import 'dart:io';

class User extends ChangeNotifier {
  File pickedImage;
  String username;
  String name;
  String dob;
  String phonenumber;
  String city;
  String state;
  String country;
  String pincode;
  String email;
  String gender;
  String maritalstatus;
  User(
      {this.pickedImage,
      this.username,
      this.name,
      this.dob,
      this.phonenumber,
      this.city,
      this.state,
      this.country,
      this.pincode,
      this.email,
      this.gender,
      this.maritalstatus});

  void changeDetails(
      File pickedImage,
      String username,
      String name,
      String dob,
      String phonenumber,
      String city,
      String state,
      String country,
      String pincode,
      String email,
      String gender,
      String maritalstatus) {
    this.pickedImage = pickedImage;
    this.username = username;
    this.name = name;
    this.dob = dob;
    this.phonenumber = phonenumber;
    this.city = city;
    this.state = state;
    this.country = country;
    this.pincode = pincode;
    this.email = email;
    this.gender = gender;
    this.maritalstatus = maritalstatus;

    notifyListeners();
  }
}
