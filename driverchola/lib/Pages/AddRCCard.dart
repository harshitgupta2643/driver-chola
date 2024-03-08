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
  File? _rcCardImageFile;
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
          title: "Add RC Card",
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
                child: Column(children: [
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
                  labelText: "RC Number",
                  hintText: "Enter Your RC Number",
                  vertical: 0.04,
                  horizontal: 0.04,
                  keyboardType: TextInputType.text,
                  fieldController: rcCardController,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Image of your RC Card',
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
                      _rcCardImageFile = file;
                    });
                  },
                ),
              ),
            ])),
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
                    if (rcCardController.text.isEmpty) {
                      Constants.showError(
                        context,
                        "Please enter your RC number.",
                      );
                    } else if (_rcCardImageFile == null) {
                      Constants.showError(
                        context,
                        "Please upload a valid RC image.",
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
