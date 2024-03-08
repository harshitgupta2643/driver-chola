import 'dart:convert';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/PartnerPreForm.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:chola_driver_flutter/Widgets/Field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EnterDetails1 extends StatefulWidget {
  final String jwt;
  const EnterDetails1({required this.jwt, super.key});

  @override
  State<EnterDetails1> createState() => _EnterDetails1State();
}

class _EnterDetails1State extends State<EnterDetails1> {
  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  final _referralController = TextEditingController();
  FocusNode _cityFocusNode = FocusNode();
  FocusNode _referralFocusNode = FocusNode();
  Map<String, dynamic> data = {};

  updateCity(String cityName) async {
    print('dhjbcjdkbcdkj');
    // print(dialCode.runtimeType);
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/auth/update'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.jwt}',
      },
      body: jsonEncode({
        'cityName': cityName,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update City.');
    }
  }

  @override
  void initState() {
    super.initState();
    _cityFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(
        top: statusBarHeight,
      ),
      child: Scaffold(
        backgroundColor: Constants.themeColor,
        appBar: CustomAppBar(
          title: "Enter Details",
          preferredHeight: size.height * 0.08,
        ),
        body: SizedBox(
          height: size.height - MediaQuery.of(context).padding.top,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.04,
            ),
            child: SingleChildScrollView(
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
                          'Enter Your City Name',
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
                      hintText: "Enter Your City Name",
                      icon: Icon(Icons.location_city),
                      vertical: 0.03,
                      horizontal: 0.04,
                      focusNode: _cityFocusNode,
                      snackbarText: 'Please enter your City Name',
                      fieldController: _cityController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Refferal Code (optional)',
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
                      hintText: "Enter Your Referral Code",
                      vertical: 0.03,
                      icon: Icon(
                        Icons.discount,
                      ),
                      horizontal: 0.04,
                      fieldController: _referralController,
                      focusNode: _referralFocusNode,
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    AgreeButton(
                      buttonText: "Next",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            Map<String, dynamic> result = await updateCity(
                              _cityController.text.toUpperCase(),
                            );

                            setState(() {
                              data = result;
                            });
                            print(data['cityName']);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PartnerPreForm(),
                              ),
                            );
                          } catch (e) {
                            print('Exception: $e');
                          }
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