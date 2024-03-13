import 'dart:io';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/AddDocument.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:chola_driver_flutter/Widgets/Field.dart';
import 'package:chola_driver_flutter/Widgets/ImagePicker.dart';
import 'package:flutter/material.dart';

class RCCard extends StatefulWidget {
  const RCCard({
    super.key,
  });

  @override
  State<RCCard> createState() => _RCCardState();
}

class _RCCardState extends State<RCCard> {
  TextEditingController rcCardController = TextEditingController();
  bool isVerify = false;
  File? _rcCardFrontImageFile;
  File? _rcCardBackImageFile;
  TextEditingController expiryController = TextEditingController();
  DateTime? selectedDate;
  FocusNode _rcfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _rcfocusNode.requestFocus();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        expiryController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
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
          title: "Registration Card",
        ),
        backgroundColor: Constants.themeColor,
        body: SizedBox(
          height: size.height - statusBarHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.height * 0.02,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/RC.png',
                    width: double.maxFinite,
                  ),
                  Text(
                    'Add Your RC Card',
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
                      hintText: "Enter Your RC Number",
                      vertical: 0.04,
                      horizontal: 0.04,
                      keyboardType: TextInputType.text,
                      focusNode: _rcfocusNode,
                      fieldController: rcCardController,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Expiry Date',
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
                    child: TextFormField(
                      controller: expiryController,
                      onTap: () => _selectDate(context),
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.calendar_month,
                        ),
                        enabled: true,
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "",
                        labelStyle: TextStyle(
                          // color: widget.color ?? ThemeData.light().colorScheme.primary,
                          fontWeight: FontWeight.w900,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                        ),
                        hintText: "Enter the Expiry Date",
                        // icon: widget.icon,
                        contentPadding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.of(context).size.shortestSide * 0.03,
                          horizontal:
                              MediaQuery.of(context).size.shortestSide * 0.04,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid expiry date';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Registration Card Front',
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
                          _rcCardFrontImageFile = file;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Registration Card Back',
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
                          _rcCardBackImageFile = file;
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
                        children: [
                          AgreeButton(
                            buttonText: "Save & Continue",
                            onPressed: () {
                              if (rcCardController.text.isEmpty) {
                                Constants.showError(
                                  context,
                                  "Please enter your RC number.",
                                );
                              } else if (_rcCardFrontImageFile == null) {
                                Constants.showError(
                                  context,
                                  "Please Attach/Take Picture of the Registration Card Front",
                                );
                              } else if (_rcCardBackImageFile == null) {
                                Constants.showError(
                                  context,
                                  "Please Attach/Take Picture of the Registration Card Back",
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddDocument(
                                      isVerifyAadhar: true,
                                      isVerifyPan: true,
                                      isVerifyDriverLicense: true,
                                      isVerifyRC: true,
                                      isVerifyPermanentAddress: true,
                                      isVerifyVehicle: true,
                                      isVerifyPhoto: true,
                                      isVerifyBankAccount: true,
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
