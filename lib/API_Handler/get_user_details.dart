import '../Models/user.dart';
import 'dart:io';

class UserDetailsApi {
  User getDetails(String email) {
    File pickedImage;
    String username = 'Ravish12';
    String name = 'Ravish Kumar';
    String dob = '01/01/2021';
    String phonenumber = '1234567890';
    String city = 'Bhopal';
    String state = 'Madhya Pradesh';
    String country = 'India';
    String pincode = '462003';
    String email = 'xyz@gmail.com';
    String gender = 'M';
    String maritalstatus = 'Married';
    User user = User(
        pickedImage: pickedImage,
        username: username,
        name: name,
        dob: dob,
        phonenumber: phonenumber,
        city: city,
        state: state,
        country: country,
        pincode: pincode,
        email: email,
        gender: gender,
        maritalstatus: maritalstatus);
    return user;
  }
}
