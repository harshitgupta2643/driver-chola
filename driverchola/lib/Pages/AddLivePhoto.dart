import 'dart:io';

import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/AddDocument.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LivePhoto extends StatefulWidget {
  const LivePhoto({
    super.key,
  });

  @override
  State<LivePhoto> createState() => _LivePhotoState();
}

class _LivePhotoState extends State<LivePhoto> {
  File? _imageFile;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      // if (widget.onImagePicked != null) {
      //   widget.onImagePicked!(_imageFile!);
      // }
    }
  }

  bool isVerify = false;
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
          title: "Live Photo",
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
                  'assets/LivePhoto.png',
                  // width: double.maxFinite,
                ),
              ),
              Text(
                'Add Your Live Photo Here',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: size.shortestSide * 0.05,
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
                child: Column(
                  children: [
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
                    if (_imageFile != null)
                      GestureDetector(
                        onTap: () {
                          _getImage(ImageSource.camera);
                        },
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(0),
                            ),
                            color: Colors.white,
                          ),
                          child: Image.file(
                            _imageFile!,
                            width: size.width * 0.8,
                            height: size.height * 0.3,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    if (_imageFile == null)
                      GestureDetector(
                        onTap: () {
                          _getImage(ImageSource.camera);
                        },
                        child: Container(
                          height: size.height * 0.1,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.height * 0.02,
                          ),
                          child: Center(
                            child: Text(
                              "Click image",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: size.shortestSide * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
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
                  buttonText: "Save & Continue",
                  onPressed: () {
                    if (_imageFile == null) {
                      Constants.showError(
                          context, "Please upload a valid photo.");
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddDocument(
                            isVerifyAadhar: true,
                            isVerifyPermanentAddress: true,
                            isVerifyPan: true,
                            isVerifyDriverLicense: true,
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
