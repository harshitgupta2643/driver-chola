import 'dart:io';

import 'package:chola_driver_flutter/Constants/ApiCollection.dart';
import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/AddDocument.dart';
import 'package:chola_driver_flutter/Widgets/BottomLine.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:chola_driver_flutter/Widgets/Field.dart';
import 'package:chola_driver_flutter/Widgets/ImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:pinput/pinput.dart';
// import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
  String frontImageUrl = '';
  String backImageUrl = '';
  FocusNode _aadharFocus = FocusNode();
  late SharedPreferences _prefs;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _aadharFocus.requestFocus();
    _loadData();
  }

  @override
  void dispose() {
    _aadharFocus.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        aadharCardController.text = _prefs.getString('aadharCard') ?? '';

        // Load front and back image URLs
        String? frontImageUrl = _prefs.getString('AadharCardFrontUrl');
        String? backImageUrl = _prefs.getString('AadharCardBackUrl');
        print(frontImageUrl);
        print(backImageUrl);

        _frontImageFile = File(frontImageUrl!);

        _backImageFile = File(backImageUrl!);
      });
    }
  }

  Future<void> _saveData() async {
    setState(() {
      isLoading = true;
    });
    await _prefs.setString('aadharCard', aadharCardController.text);
    if (_frontImageFile != null) {
      // setState(() async {

      // });
      frontImageUrl =
          await uploadFile(_frontImageFile, 'AadharCard', 'AadharCardFront');
      if (mounted) {
        await _prefs.setString('AadharCardFrontUrl', frontImageUrl);
      }
    }
    if (_backImageFile != null) {
      // setState(() async {
      //   backImageUrl =
      //       await uploadFile(_backImageFile, 'AadharCard', 'AadharCardBack');
      // });
      backImageUrl =
          await uploadFile(_backImageFile, 'AadharCard', 'AadharCardBack');
      if (mounted) {
        await _prefs.setString('AadharCardBackUrl', backImageUrl);
      }
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<String> uploadFile(
      File? _imageFile, String docsName, String fileName) async {
    if (_imageFile == null) return '';
    final destination = '${Constants.phoneNo}/${docsName}/${fileName}';

    try {
      print('object');
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('${fileName}/');
      print('123');
      await ref.putFile(_imageFile);
      print('object2');
      String downloadURL = await ref.getDownloadURL();
      print('object3');
      print(downloadURL);
      return downloadURL;
    } catch (e) {
      print('error occurred');
      return '';
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
                      color: Colors.black,
                      fontSize: size.shortestSide * 0.0533,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
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
                      color: Colors.black,
                      fontSize: size.shortestSide * 0.0533,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Text(
                    '(Click Again to reselect)',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.shortestSide * 0.0267,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0,
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
                      docsName: 'AadharCard',
                      fileName: 'AadharCardFront',
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
                      color: Colors.black,
                      fontSize: size.shortestSide * 0.0533,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Text(
                    '(Click Again to reselect)',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.shortestSide * 0.0267,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0,
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
                      docsName: 'AadharCard',
                      fileName: 'AadharCardBack',
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
                        children: <Widget>[
                          Visibility(
                            visible: !isLoading,
                            child: AgreeButton(
                              buttonText: "Save & Continue",
                              onPressed: () async {
                                if (aadharCardController.text.length != 12) {
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
                                  await _saveData();

                                  await ApiCollection.updateAadharCard(
                                    aadharCardController.text,
                                    frontImageUrl,
                                    backImageUrl,
                                  );

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddDocument(
                                        isVerifyPermanentAddress: true,
                                        isVerifyAadhar: isVerify,
                                        isVerifyPhoto: true,
                                      ),
                                    ),
                                  );
                                }
                              },
                              padding: 0.7,
                            ),
                          ),
                          Visibility(
                            visible: isLoading,
                            child: CircularProgressIndicator(),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          bottomLine(),
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
