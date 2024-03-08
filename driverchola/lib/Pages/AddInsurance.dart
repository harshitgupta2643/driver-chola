import 'dart:io';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/AddDocument.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:chola_driver_flutter/Widgets/Field.dart';
import 'package:chola_driver_flutter/Widgets/ImagePicker.dart';
import 'package:flutter/material.dart';

class Insurance extends StatefulWidget {
  const Insurance({
    super.key,
  });

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  TextEditingController insuranceController = TextEditingController();
  bool isVerify = false;
  File? _insuranceImageFile;
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
          title: "Add Insurance",
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
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02,
                ),
                child: Image.asset(
                  'assets/Insurance.png',
                  // width: double.maxFinite,
                ),
              ),
              Text(
                'Add Your Insurance',
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
                  labelText: "Insurance Number",
                  hintText: "Enter Your Insurance Number",
                  vertical: 0.04,
                  horizontal: 0.04,
                  keyboardType: TextInputType.text,
                  fieldController: insuranceController,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Image of your Insurance',
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
                      _insuranceImageFile = file;
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
                    if (insuranceController.text.isEmpty) {
                      Constants.showError(
                        context,
                        "Please enter your Insurance number.",
                      );
                    } else if (_insuranceImageFile == null) {
                      Constants.showError(
                        context,
                        "Please upload a valid Insurance image.",
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
                            isVerifyInsurance: true,
                            isVerifyPermanentAddress: true,
                            isVerifyPhoto: true,
                            isVerifyVehicle: true,
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
