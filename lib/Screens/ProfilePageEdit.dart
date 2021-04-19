import 'dart:io';

import 'package:flutter/material.dart';
import '../Components/custom_appbar.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageEdit extends StatefulWidget {
  File pickedImage;

  String username;
  String dob;
  String phonenumber;
  String city;
  String state;
  String country;
  String pincode;
  String email;
  String gender;
  String maritalstatus;
  Function settingValues;

  ProfilePageEdit(
      {this.pickedImage,
      this.username,
      this.dob,
      this.phonenumber,
      this.city,
      this.state,
      this.country,
      this.pincode,
      this.email,
      this.gender,
      this.maritalstatus,
      this.settingValues});

  @override
  _ProfilePageEditState createState() => _ProfilePageEditState();
}

class _ProfilePageEditState extends State<ProfilePageEdit> {
  _loadPicker(ImageSource source) async {
    File picked = await ImagePicker.pickImage(source: source);
    if (picked != null) {
      _cropImage(picked);
    }
    Navigator.pop(context);
  }

  _cropImage(File picked) async {
    File cropped = await ImageCropper.cropImage(
      androidUiSettings: AndroidUiSettings(
        statusBarColor: Colors.red,
        toolbarColor: Colors.red,
        toolbarTitle: "Crop Image",
        toolbarWidgetColor: Colors.white,
      ),
      sourcePath: picked.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
      ],
      maxWidth: 800,
    );
    if (cropped != null) {
      setState(() {
        widget.pickedImage = cropped;
      });
    }
  }

  void _showPickOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Pick from Gallery"),
              onTap: () {
                _loadPicker(ImageSource.gallery);
              },
            ),
            ListTile(
              title: Text("Take a pictuer"),
              onTap: () {
                _loadPicker(ImageSource.camera);
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Profile Edit Page", '', '', Size.fromHeight(100)),
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 80,
                      child:
                          widget.pickedImage == null ? Text("Picture") : null,
                      backgroundImage: widget.pickedImage != null
                          ? FileImage(widget.pickedImage)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Center(
                    child: RaisedButton(
                      child: Text("Pick Image"),
                      onPressed: () {
                        _showPickOptionsDialog(context);
                      },
                    ),
                  ),
                  Text(
                    'UserName',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: widget.username),
                    onChanged: (value) {
                      setState(() {
                        widget.username = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'DOB',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: widget.dob),
                    onChanged: (value) {
                      setState(() {
                        widget.dob = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Phone No.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: widget.phonenumber),
                    onChanged: (value) {
                      setState(() {
                        widget.phonenumber = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'City',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: widget.city),
                    onChanged: (value) {
                      setState(() {
                        widget.city = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'State',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: widget.state),
                    onChanged: (value) {
                      setState(() {
                        widget.state = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Country',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: widget.country),
                    onChanged: (value) {
                      setState(() {
                        widget.country = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Pin Code',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: widget.pincode),
                    onChanged: (value) {
                      setState(() {
                        widget.pincode = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: widget.email),
                    onChanged: (value) {
                      setState(() {
                        widget.email = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Gender',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    title: const Text('M'),
                    leading: Radio(
                      value: 'M',
                      groupValue: widget.gender,
                      onChanged: (value) {
                        setState(() {
                          widget.gender = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('F'),
                    leading: Radio(
                      value: 'F',
                      groupValue: widget.gender,
                      onChanged: (value) {
                        setState(() {
                          widget.gender = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Marital Status',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    title: const Text('Married'),
                    leading: Radio(
                      value: 'Married',
                      groupValue: widget.maritalstatus,
                      onChanged: (value) {
                        setState(() {
                          widget.maritalstatus = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Unmarried'),
                    leading: Radio(
                      value: 'Unmarried',
                      groupValue: widget.maritalstatus,
                      onChanged: (value) {
                        setState(() {
                          widget.maritalstatus = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          widget.settingValues(
                              widget.pickedImage,
                              widget.username,
                              widget.dob,
                              widget.phonenumber,
                              widget.city,
                              widget.state,
                              widget.country,
                              widget.pincode,
                              widget.email,
                              widget.gender,
                              widget.maritalstatus);

                          Navigator.pop(context);
                        },
                        color: Colors.lightBlue,
                        child: Text('Save'),
                      ),
                      RaisedButton(
                        onPressed: () => Navigator.pop(context),
                        color: Colors.lightBlue,
                        child: Text('Cancel'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
