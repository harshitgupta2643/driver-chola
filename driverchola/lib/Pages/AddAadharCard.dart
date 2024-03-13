import 'dart:io';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/AddDocument.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:chola_driver_flutter/Widgets/Field.dart';
import 'package:chola_driver_flutter/Widgets/ImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class AadharCard extends StatefulWidget {
  const AadharCard({
    super.key,
  });

  @override
  State<AadharCard> createState() => _AadharCardState();
}

class _AadharCardState extends State<AadharCard> {
  TextEditingController aadharCardController = TextEditingController();
  bool isVerify = false;
  File? _frontImageFile;
  File? _backImageFile;
  FocusNode _aadharFocus = FocusNode();
  @override
  void initState() {
    super.initState();
    _aadharFocus.requestFocus();
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
        appBar: CustomAppBar(
          preferredHeight: size.height * 0.08,
          title: "Aadhar",
        ),
        backgroundColor: Constants.themeColor,
        body: SizedBox(
          height: size.height - statusBarHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.height * 0.02,
              vertical: size.height * 0.02,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/Aadhar.png',
                    width: double.maxFinite,
                  ),
                  Text(
                    'Add Your Aadhar',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.shortestSide * 0.06,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.02,
                    ),
                    child: Field(
                      labelText: "",
                      hintText: "Enter Your Aadhar Number",
                      vertical: 0.04,
                      focusNode: _aadharFocus,
                      horizontal: 0.04,
                      maxLength: 12,
                      keyboardType: TextInputType.number,
                      fieldController: aadharCardController,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Aadhar Card Front',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: size.shortestSide * 0.055,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '(Click Again to reselect)',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: size.shortestSide * 0.027,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                    ),
                    child: ImagePickerButton(
                      onImagePicked: (file) {
                        setState(() {
                          _frontImageFile = file;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Aadhar Card Back',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: size.shortestSide * 0.055,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '(Click Again to reselect)',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: size.shortestSide * 0.027,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                    ),
                    child: ImagePickerButton(
                      onImagePicked: (file) {
                        setState(() {
                          _backImageFile = file;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AgreeButton(
                            buttonText: "Save & Continue",
                            onPressed: () {
                              if (aadharCardController.length != 12) {
                                Constants.showError(
                                  context,
                                  "Enter Valid Aadhar Number",
                                );
                              } else if (_frontImageFile == null) {
                                Constants.showError(
                                  context,
                                  "Please Attach/Take Picture of Front side of Aadhar Card",
                                );
                              } else if (_backImageFile == null) {
                                Constants.showError(
                                  context,
                                  "Please Attach/Take Picture of Back side of Aadhar Card",
                                );
                              } else {
                                setState(() {
                                  isVerify = true;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddDocument(
                                      isVerifyPermanentAddress: true,
                                      isVerifyAadhar: isVerify,
                                    ),
                                  ),
                                );
                              }
                            },
                            padding: 0.7,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Expanded(
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              double fontSize = constraints.maxWidth * 0.04;
                              return Text(
                                'Upload all Documents to start earning with CHOLA.',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: fontSize,
                                  color: Colors.black,
                                ),
                              );
                            }),
                          ),
                          // Container(

                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // bottomNavigationBar:
      ),
    );
  }
}
