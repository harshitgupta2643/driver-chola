import 'dart:convert';
import 'dart:math';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/EnterDetails1.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
// import 'package:chola_driver_flutter/Widgets/Date.dart';
import 'package:chola_driver_flutter/Widgets/DropDown.dart';
import 'package:chola_driver_flutter/Widgets/dateofBirth.dart';
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
  DateTime dob =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

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
    // dob = DateTime.now();
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
          title: "Personal Details",
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
                          'First Name',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.shortestSide * 0.045,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.03,
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
                      height: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Last Name',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.shortestSide * 0.045,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.03,
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
                      height: size.width * 0.03,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Date of Birth (DOB)',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.shortestSide * 0.045,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.03,
                    ),
                    DateOfBirth(
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                      backgroundDropdownColor: Color(0xffeef4fa),
                      itemColor: Colors.black,
                      onDateTimeChanged: (datetime) {
                        print(datetime);
                        // print(dob);

                        setState(() {
                          dob = datetime;
                        });
                        print(dob);
                      },
                    ),
                    SizedBox(
                      height: size.width * 0.03,
                    ),
                    Row(
                      children: [
                        CustomDropDown(
                            controller: _bloodgroupController,
                            onChanged: (value) {
                              setState(() {
                                _bloodgroupController.text = value!;
                              });
                            },
                            ListOfDropDown: Constants.bloodGroup,
                            labelText: "Blood Group",
                            icon: Icon(Icons.bloodtype),
                            vertical: 0.02,
                            horizontal: 0.02),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        CustomDropDown(
                          controller: _genderController,
                          onChanged: (value) {
                            setState(() {
                              _genderController.text = value!;
                            });
                          },
                          ListOfDropDown: Constants.gender,
                          labelText: "Gender",
                          icon: const Icon(
                            Icons.transgender_outlined,
                          ),
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
                            print(dob);
                            // print(DateTime.now());
                            if (!dob.isBefore(DateTime.now()
                                .subtract(Duration(days: 18 * 365)))) {
                              Constants.showError(
                                context,
                                '*You must be 18 years Old',
                              );
                            } else {
                              Map<String, dynamic> result = await createDetails(
                                _firstnameController.text,
                                _lastnameController.text,
                                max(
                                    Constants.gender
                                        .indexOf(_genderController.text),
                                    0),
                                dob.toString(),
                                max(
                                    Constants.bloodGroup
                                        .indexOf(_bloodgroupController.text),
                                    0),
                              );

                              setState(() {
                                data = result;
                                Constants.firstName = _firstnameController.text;
                              });
                              print(data['dob']);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EnterDetails1(
                                    jwt: data['jwt'] as String,
                                  ),
                                ),
                              );
                            }
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
