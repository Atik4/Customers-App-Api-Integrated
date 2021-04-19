import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'ProfilePageEdit.dart';
import '../Components/custom_appbar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File pickedImage;

  String username = 'Ravish';
  String dob = '01/01/2021';
  String phonenumber = '1234567890';
  String city = 'Bhopal';
  String state = 'Madhya Pradesh';
  String country = 'India';
  String pincode = '462003';
  String email = 'xyz@gmail.com';
  String gender = 'M';
  String maritalstatus = 'Married';

  Function settingValues(
      File pickedImage,
      String username,
      String dob,
      String phonenumber,
      String city,
      String state,
      String country,
      String pincode,
      String email,
      String gender,
      String maritalstatus) {
    setState(() {
      this.pickedImage = pickedImage;
      this.username = username;
      this.dob = dob;
      this.phonenumber = phonenumber;
      this.city = city;
      this.state = state;
      this.country = country;
      this.pincode = pincode;
      this.email = email;
      this.gender = gender;
      this.maritalstatus = maritalstatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Profile Page", '', '', Size.fromHeight(100)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                child: pickedImage == null ? Text("Picture") : null,
                backgroundImage:
                    pickedImage != null ? FileImage(pickedImage) : null,
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UserName',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'DOB',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dob,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Phone No.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      phonenumber,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'City',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      city,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'State',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Country',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      country,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Pin Code',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      pincode,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Email',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Gender',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      gender,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Marital Status',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      maritalstatus,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePageEdit(
                                      pickedImage: pickedImage,
                                      username: username,
                                      dob: dob,
                                      phonenumber: phonenumber,
                                      city: city,
                                      state: state,
                                      country: country,
                                      pincode: pincode,
                                      email: email,
                                      gender: gender,
                                      maritalstatus: maritalstatus,
                                      settingValues: settingValues)));
                        },
                        color: Colors.lightBlue,
                        child: Text('Edit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
