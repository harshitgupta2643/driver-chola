import 'dart:convert';
import 'dart:math';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/EnterDetails1.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:chola_driver_flutter/Widgets/Date.dart';
import 'package:chola_driver_flutter/Widgets/DropDown.dart';
import 'package:chola_driver_flutter/Widgets/Field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EnterDetails extends StatefulWidget {
  final String jwt;
  const EnterDetails({required this.jwt, Key? key}) : super(key: key);

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _genderController = TextEditingController();
  final _dobController = TextEditingController();
  final _bloodgroupController = TextEditingController();
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  Map<String, dynamic> data = {};

  createDetails(String firstName, String lastName, int gender, String dob,
      int bloodGroup) async {
    print('dhjbcjdkbcdkj');
    // print(dialCode.runtimeType);
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/auth/update'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.jwt}',
      },
      body: jsonEncode({
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'dob': dob,
        'bloodGroup': bloodGroup,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update Details.');
    }
  }

  @override
  void initState() {
    super.initState();
    _firstNameFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Scaffold(
        backgroundColor: Constants.themeColor,
        appBar: CustomAppBar(
          title: "Enter Details",
          preferredHeight: size.height * 0.08,
        ),
        body: SizedBox(
          height: size.height - MediaQuery.of(context).padding.top,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.04,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Enter Your First Name',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.shortestSide * 0.05,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Field(
                      labelText: "",
                      hintText: "Enter Your First Name",
                      icon: Icon(Icons.person),
                      vertical: 0.03,
                      horizontal: 0.04,
                      focusNode: _firstNameFocusNode,
                      snackbarText: 'Please enter your firstname',
                      fieldController: _firstnameController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Enter Your Last Name',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.shortestSide * 0.05,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Field(
                      labelText: "",
                      hintText: "Enter Your Last Name",
                      vertical: 0.03,
                      icon: Icon(
                        Icons.person,
                      ),
                      horizontal: 0.04,
                      snackbarText: 'Please enter your Lastname',
                      fieldController: _lastnameController,
                      focusNode: _lastNameFocusNode,
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Row(
                      children: [
                        DobField(
                            flex: 2,
                            labelText: "DOB",
                            suffixicon: Icon(Icons.date_range_outlined),
                            hintText: "Enter Your DOB",
                            vertical: 0.03,
                            icon: Icon(Icons.calendar_month),
                            snackbarText: '*Dob Required',
                            horizontal: 0.04,
                            // icon: Icon(Icons.calendar_today),
                            dobController: _dobController),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        CustomDropDown(
                            controller: _bloodgroupController,
                            // flex: 1,
                            onChanged: (value) {
                              setState(() {
                                _bloodgroupController.text = value!;
                              });
                            },
                            ListOfDropDown: Constants.bloodGroup,
                            labelText: "BloodGroup",
                            // icon: Icon(Icons.bloodtype),
                            vertical: 0.02,
                            horizontal: 0.02),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        CustomDropDown(
                          controller: _genderController,
                          onChanged: (value) {
                            setState(() {
                              _genderController.text = value!;
                            });
                          },
                          ListOfDropDown: Constants.gender,
                          labelText: "Gender",
                          vertical: 0.02,
                          horizontal: 0.02,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    AgreeButton(
                      buttonText: "Next",
                      onPressed: () async {
                        try {
                          if (_formKey.currentState!.validate()) {
                            Map<String, dynamic> result = await createDetails(
                              _firstnameController.text,
                              _lastnameController.text,
                              max(
                                  Constants.gender
                                      .indexOf(_genderController.text),
                                  0),
                              _dobController.text,
                              max(
                                  Constants.bloodGroup
                                      .indexOf(_bloodgroupController.text),
                                  0),
                            );

                            setState(() {
                              data = result;
                              Constants.firstName = _firstnameController.text;
                            });
                            print(data['phoneNoVerified']);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EnterDetails1(
                                  jwt: data['jwt'] as String,
                                ),
                              ),
                            );
                          }
                        } catch (e) {
                          print('Exception: $e');
                        }
                      },
                      padding: 0.9,
                      borderRadius: 0,
                      suffixWidget: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
