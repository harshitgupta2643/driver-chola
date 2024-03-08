import 'dart:convert';
import 'dart:ffi';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/ComingSoon.dart';
import 'package:chola_driver_flutter/Pages/PhoneVerification.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/Field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

createPhoneNumber(String phoneNo, String dialCode) async {
  // print('dhjbcjdkbcdkj');
  // print(dialCode.runtimeType);
  var response = await http.post(
    Uri.parse('https://chola-web-app.azurewebsites.net/api/auth/enter'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'phoneNo': phoneNo.toString(),
      'countryCode': dialCode.toString(),
      'user_Type': 1,
      'auth_Type': 0,
    }),
  );
  print(response.body);
  if (response.statusCode == 200) {
    print(json.decode(response.body).runtimeType);
    return json.decode(response.body);
  } else {
    throw Exception('Failed to create PhoneNumber.');
  }
}

class LoginPage1 extends StatefulWidget {
  const LoginPage1({super.key});

  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode _phoneNumberFocusNode = FocusNode();
  String dialCode = '+91';
  Map<String, dynamic> data = {};
  bool isLoading = false;
  // Future<dynamic>? data;

  @override
  void initState() {
    super.initState();
    _phoneNumberFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Scaffold(
        backgroundColor: Constants.themeColor,
        body: SizedBox(
          height: size.height - statusBarHeight,
          child: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.05,
              right: size.width * 0.05,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (isLoading)
                      ? Center(
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.transparent,
                            color: Color(0xff6A4DE8),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Enter Your Phone Number',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: size.shortestSide * 0.06,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        // width: size.width * 0.2,
                        child: CountryCodePicker(
                          padding: EdgeInsets.only(
                            top: size.height * 0.001,
                            bottom: size.height * 0.001,
                            left: size.height * 0.00,
                            right: size.height * 0.00,
                          ),

                          onChanged: (value) {
                            // countryCode = CountryCode(dialCode: value.dialCode);
                            setState(() {
                              dialCode = value.dialCode!;
                            });
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'IN',
                          favorite: ['+91', 'IN'],
                          // optional. Shows only country name and flag when popup is closed.
                          showCountryOnly: false,
                          // optional. Shows the dialog
                          showOnlyCountryWhenClosed: false,
                          showDropDownButton: true,
                          dialogBackgroundColor: Constants.themeColor,
                          // barrierColor: Colors.amberAccent,
                          // flagDecoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(4),
                          // ),
                          searchDecoration: InputDecoration(
                            hintText: "Search",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          // flagWidth: size.width * 0.1,

                          hideMainText: true,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                          // optional. shows the flag instead
                          showFlag: true,
                          // showFlagMain: true,
                          // optional. shows the flag in the Text
                          showFlagDialog: true,
                          // optional. closes the dialog when an item is picked
                          closeIcon: Icon(
                            Icons.close,
                            color: Theme.of(
                              context,
                            ).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Expanded(
                        flex: 2,
                        child: Field(
                          labelText: "",
                          hintText: "Enter Your Phone Number",
                          vertical: 0.03,
                          horizontal: 0.04,
                          fieldController: phoneNumberController,
                          focusNode: _phoneNumberFocusNode,
                          // maxLength: 10,
                          prefixText: dialCode + " ",
                          keyboardType: TextInputType.number,
                          snackbarText: '* Required',
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  AgreeButton(
                    buttonText: "Next",
                    onPressed: () async {
                      if (phoneNumberController.text.isEmpty) {
                        Constants.showError(
                            context, 'Phone Number is required');
                      } else {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: dialCode + phoneNumberController.text,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent: (String verificationId,
                                int? resendToken) async {
                              Map<String, dynamic> result =
                                  await createPhoneNumber(
                                phoneNumberController.text,
                                dialCode,
                              );
                              setState(() {
                                data = result;
                              });
                              print(data['message']);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhoneVerify(
                                    verificationId: verificationId,
                                    phoneNumber: dialCode +
                                        " " +
                                        phoneNumberController.text,
                                    alreadyExist: data['alreadyExist'] as bool,
                                    jwt: data['jwt'] as String,
                                  ),
                                ),
                              );
                              setState(() {
                                isLoading = false;
                              });
                            },
                            codeAutoRetrievalTimeout: (verificationId) {},
                          );
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });
                          Constants.showError(context, 'Exception: $e');
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
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'By continuing you may receive an SMS for verification.\nStandard Message and data rates may apply.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: size.shortestSide * 0.05,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Divider(
                          color: Color(0xff757575),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'or',
                          style: TextStyle(
                            color: Color(0xff757575),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Divider(
                          color: Color(0xff757575),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  AgreeButton(
                    buttonText: "Continue With Facebook",
                    fontSize: size.shortestSide * 0.05,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComingSoon(),
                        ),
                      );
                    },
                    padding: 0.9,
                    fillColor: [Colors.white, Colors.white],
                    textColor: Colors.black,
                    borderRadius: 0,
                    prefixWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/fb_.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  AgreeButton(
                    buttonText: "Continue With Google",
                    fontSize: size.shortestSide * 0.05,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComingSoon(),
                        ),
                      );
                    },
                    padding: 0.9,
                    fillColor: [Colors.white, Colors.white],
                    textColor: Colors.black,
                    borderRadius: 0,
                    prefixWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/google_.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}