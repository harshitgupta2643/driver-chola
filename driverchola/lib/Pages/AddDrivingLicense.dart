import 'dart:io';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/AddDocument.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:chola_driver_flutter/Widgets/Date.dart';
import 'package:chola_driver_flutter/Widgets/Field.dart';
import 'package:chola_driver_flutter/Widgets/ImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class DrivingLicense extends StatefulWidget {
  const DrivingLicense({
    super.key,
  });

  @override
  State<DrivingLicense> createState() => _DrivingLicenseState();
}

class _DrivingLicenseState extends State<DrivingLicense> {
  TextEditingController licenseController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  DateTime? selectedDate;
  bool isVerify = false;
  File? _frontImageFile;
  File? _backImageFile;
  FocusNode _drivingFocus = FocusNode();
  @override
  void initState() {
    super.initState();
    _drivingFocus.requestFocus();
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
          title: "Driving License",
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
                'assets/DrivingLicense.png',
                width: double.maxFinite,
              ),
              Text(
                'Add Your Driving License',
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
                  focusNode: _drivingFocus,
                  hintText: "Enter Your License Number",
                  vertical: 0.04,
                  horizontal: 0.04,
                  maxLength: 16,
                  keyboardType: TextInputType.text,
                  fieldController: licenseController,
                ),
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
                      vertical: MediaQuery.of(context).size.shortestSide * 0.03,
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
                'Driving License Front',
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
                'Driving License Back',
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
                    children: [
                      AgreeButton(
                        buttonText: "Save & Continue",
                        onPressed: () {
                          if (licenseController.length > 16) {
                            Constants.showError(
                              context,
                              "Please enter a valid License number. License numbers in India are up to 16 characters long.",
                            );
                          } else if (_frontImageFile == null) {
                            Constants.showError(
                              context,
                              "Please upload a valid Front Image of your driving license .",
                            );
                          } else if (_backImageFile == null) {
                            Constants.showError(
                              context,
                              "Please upload a valid Back Image of your driving license .",
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddDocument(
                                  isVerifyPermanentAddress: true,
                                  isVerifyAadhar: true,
                                  isVerifyDriverLicense: true,
                                  isVerifyPan: true,
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
            ])),
          ),
        ),
        // bottomNavigationBar:
      ),
    );
  }
}
