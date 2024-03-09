import 'dart:io';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/AddDocument.dart';
// import 'package:chola_driver_flutter/Widgets/BackButton.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
// import 'package:chola_driver_flutter/Widgets/DropDown.dart';
import 'package:chola_driver_flutter/Widgets/Field.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

class ParmanentAddress extends StatefulWidget {
  const ParmanentAddress({super.key});

  @override
  State<ParmanentAddress> createState() => _ParmanentAddressState();
}

class _ParmanentAddressState extends State<ParmanentAddress> {
  TextEditingController streetController = TextEditingController();
  TextEditingController addressline2Controller = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController apartmentController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(
        top: statusBarHeight,
      ),
      child: Scaffold(
        backgroundColor: Constants.themeColor,
        appBar: CustomAppBar(
          preferredHeight: size.height * 0.08,
          title: 'Home Address',
        ),
        body: SizedBox(
          height: size.height - statusBarHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.height * 0.02,
            ),
            child: Center(
              child: Container(
                width: size.width,
                height: size.height * 0.75,
                decoration: BoxDecoration(
                  color: Color(0xffD3DBFB),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02,
                                      vertical: size.height * 0.01,
                                    ),
                                    child: Text(
                                      'House No.',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: size.shortestSide * 0.035,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Field(
                                    labelText: "House No",
                                    hintText: "Enter Your House Number",
                                    vertical: 0.03,
                                    horizontal: 0.04,
                                    snackbarText: '* Required',
                                    fieldController: houseController,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02,
                                      vertical: size.height * 0.01,
                                    ),
                                    child: Text(
                                      'Apartment, Suite, etc..',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: size.shortestSide * 0.035,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Field(
                                    labelText: "Apartment",
                                    hintText: "Enter Your Apartment Name",
                                    vertical: 0.03,
                                    horizontal: 0.03,
                                    snackbarText: '* Required',
                                    fieldController: apartmentController,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01,
                              ),
                              child: Text(
                                'Street',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: size.shortestSide * 0.035,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Field(
                          labelText: "Street",
                          hintText: "Enter Name of Street",
                          vertical: 0.03,
                          horizontal: 0.04,
                          // icon: Icon(Icons.location_on),
                          snackbarText: '* Required',
                          fieldController: streetController,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01,
                              ),
                              child: Text(
                                'Address Line 2',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: size.shortestSide * 0.035,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Field(
                          labelText: "Address Line 2",
                          hintText: "Enter Your Address Line 2",
                          vertical: 0.03,
                          horizontal: 0.03,
                          snackbarText: '* Required',
                          fieldController: addressline2Controller,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01,
                              ),
                              child: Text(
                                'City',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: size.shortestSide * 0.035,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Field(
                          labelText: "City",
                          hintText: "Enter Your City",
                          vertical: 0.03,
                          horizontal: 0.03,
                          snackbarText: '* Required',
                          fieldController: cityController,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01,
                              ),
                              child: Text(
                                'State',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: size.shortestSide * 0.035,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Field(
                          labelText: "State",
                          hintText: "Enter Your State",
                          vertical: 0.03,
                          horizontal: 0.03,
                          snackbarText: '* Required',
                          fieldController: stateController,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01,
                              ),
                              child: Text(
                                'Country',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: size.shortestSide * 0.035,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Field(
                          labelText: "Country",
                          hintText: "Enter Your Country",
                          vertical: 0.03,
                          horizontal: 0.03,
                          snackbarText: '* Required',
                          fieldController: countryController,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: size.height * 0.1,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
                vertical: size.height * 0.02,
              ),
              child: AgreeButton(
                buttonText: "Save Address",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Directory appDocDir = await getApplicationCacheDirectory();
                    String appDocPath = appDocDir.path;

                    // Create a "Permanent Address" folder if it doesn't exist
                    String permanentAddressFolderPath = '$appDocPath/Documents';
                    Directory(permanentAddressFolderPath)
                        .createSync(recursive: true);
                    print(permanentAddressFolderPath);
                    // Store the address information in a file inside the folder
                    File addressFile =
                        File('$permanentAddressFolderPath/address.txt');
                    await addressFile
                        .writeAsString('House No: ${houseController.text}\n'
                            'Apartment: ${apartmentController.text}\n'
                            'Street: ${streetController.text}\n'
                            'Address Line 2: ${addressline2Controller.text}\n'
                            'City: ${cityController.text}\n'
                            'State: ${stateController.text}\n'
                            'Country: ${countryController.text}');
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddDocument(
                          isVerifyPermanentAddress: true,
                        ),
                      ),
                    );
                  }
                },
                padding: 0.8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
