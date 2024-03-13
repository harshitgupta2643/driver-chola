import 'dart:io';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/AddDocument.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
// import 'package:chola_driver_flutter/Widgets/CustomDropDown1.dart';
// import 'package:chola_driver_flutter/Widgets/DropDown.dart';
import 'package:chola_driver_flutter/Widgets/Field.dart';
import 'package:chola_driver_flutter/Widgets/ImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VehicleDetails extends StatefulWidget {
  const VehicleDetails({
    super.key,
  });

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  TextEditingController vehicleTypeController = TextEditingController();
  TextEditingController vehicleModelController = TextEditingController();
  TextEditingController vehicleColorController = TextEditingController();
  TextEditingController vehicleYearController = TextEditingController();
  TextEditingController vehicleCompanyController = TextEditingController();
  TextEditingController licensePlateController = TextEditingController();
  bool isVerify = false;
  DateTime? selectedDate;
  File? _vehicleImageFile;
  // String dropdownValue1 = 'Item 1';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.year,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        vehicleYearController.text = "${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    String dropdownValue1 = 'Maruti-Suzuki';

    return Padding(
      padding: EdgeInsets.only(
        top: statusBarHeight,
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          preferredHeight: size.height * 0.08,
          title: "Vehicle Details",
        ),
        backgroundColor: Constants.themeColor,
        body: SizedBox(
          height: size.height - statusBarHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
              vertical: size.height * 0.02,
            ),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Text(
                  '\t\tVehicle Type',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: size.shortestSide * 0.05,
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
                    labelText: "Vehicle Type",
                    hintText: "Enter Your Vehicle Type",
                    vertical: 0.04,
                    horizontal: 0.04,
                    keyboardType: TextInputType.text,
                    fieldController: vehicleTypeController,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  '\t\tVehicle Company/Make',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: size.shortestSide * 0.05,
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
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    value: dropdownValue1,
                    onChanged: (String? newValue) {
                      setState(() {
                        if (Constants.vehicleCompany.contains(newValue)) {
                          dropdownValue1 = newValue!;
                        }
                      });
                    },
                    items: Constants.vehicleCompany
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  '\t\tVehicle Model',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: size.shortestSide * 0.05,
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
                    labelText: "Vehicle Model",
                    hintText: "Enter Your Vehicle Model",
                    vertical: 0.04,
                    horizontal: 0.04,
                    keyboardType: TextInputType.text,
                    fieldController: vehicleModelController,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  '\t\tVehicle Year',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: size.shortestSide * 0.05,
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
                    controller: vehicleYearController,
                    onTap: () => _selectDate(context),
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.calendar_month,
                      ),
                      enabled: true,
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Vehicle Year',
                      labelStyle: TextStyle(
                        // color: widget.color ?? ThemeData.light().colorScheme.primary,
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                      ),
                      hintText: 'Enter Vehicle Year',
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
                        return 'please Enter a valid Year';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  '\t\tVehicle Color',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: size.shortestSide * 0.05,
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
                    labelText: "Vehicle Color",
                    hintText: "Enter Your Vehicle Color",
                    vertical: 0.04,
                    horizontal: 0.04,
                    keyboardType: TextInputType.text,
                    fieldController: vehicleColorController,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  '\t\tLicense Plate Number',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: size.shortestSide * 0.05,
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
                    labelText: "License Plate Number",
                    hintText: "Enter Your License Plate Number",
                    vertical: 0.04,
                    horizontal: 0.04,
                    keyboardType: TextInputType.text,
                    fieldController: licensePlateController,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  '\t\tPicture of Your Vehicle',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: size.shortestSide * 0.05,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  '(Click Again to reselect)',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
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
                        _vehicleImageFile = file;
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
                            if (vehicleTypeController.length == 0) {
                              Constants.showError(
                                context,
                                "Please Enter Vehicle Type",
                              );
                            } else if (vehicleModelController.length == 0) {
                              Constants.showError(
                                context,
                                "Please Enter Vehicle Model",
                              );
                            } else if (vehicleYearController.length == 0) {
                              Constants.showError(
                                context,
                                "Please Enter Valid Vehicle Year",
                              );
                            } else if (vehicleColorController.length == 0) {
                              Constants.showError(
                                context,
                                "Please Enter Vehicle Color",
                              );
                            } else if (licensePlateController.length == 0) {
                              Constants.showError(
                                context,
                                "Please Enter License Plate Number",
                              );
                            } else if (_vehicleImageFile == null) {
                              Constants.showError(
                                context,
                                "Please Attach/Take Picture of Vehicle",
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddDocument(
                                    isVerifyAadhar: true,
                                    isVerifyPan: true,
                                    isVerifyDriverLicense: true,
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
              ],
            ),
          ),
        ),
        // bottomNavigationBar:
      ),
    );
  }
}
