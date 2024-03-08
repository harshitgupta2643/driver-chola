import 'dart:io';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/AddDocument.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:chola_driver_flutter/Widgets/Field.dart';
import 'package:chola_driver_flutter/Widgets/ImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PanCard extends StatefulWidget {
  const PanCard({
    super.key,
  });

  @override
  State<PanCard> createState() => _PanCardState();
}

class _PanCardState extends State<PanCard> {
  TextEditingController panCardController = TextEditingController();
  bool isVerify = false;
  File? _frontImageFile;
  File? _backImageFile;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Padding(
      padding:  EdgeInsets.only(
        top: statusBarHeight,
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          preferredHeight: size.height * 0.08,
          title: "Add Pan Card",
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
                    'assets/Pan.png',
                    width: double.maxFinite,
                  ),
                  Text(
                    'Add Your Pan Card',
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
                      labelText: "Pan Number",
                      hintText: "Enter Your Pan Number",
                      vertical: 0.04,
                      horizontal: 0.04,
                      maxLength: 10,
                      keyboardType: TextInputType.text,
                      fieldController: panCardController,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Front side of your PAN',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: size.shortestSide * 0.045,
                      color: Colors.black,
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
                    'Back side of your PAN',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: size.shortestSide * 0.045,
                      color: Colors.black,
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
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: size.height * 0.15,
          child: Center(
            child: Column(
              children: [
                AgreeButton(
                  buttonText: "Okay",
                  onPressed: () {
                    if (panCardController.length != 10) {
                      Constants.showError(
                        context,
                        "Please enter a valid PAN number. \nPAN numbers in India are 10 characters long.",
                      );
                    } else if (_frontImageFile == null) {
                      Constants.showError(
                        context,
                        "Please select the Front image of your PAN card.",
                      );
                    } else if (_backImageFile == null) {
                      Constants.showError(
                        context,
                        "Please select the Back image of your PAN card.",
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
                            isVerifyPan: isVerify,
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
                  child: LayoutBuilder(builder: (context, constraints) {
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
      ),
    );
  }
}