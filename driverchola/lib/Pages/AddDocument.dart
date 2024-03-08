import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/AddAadharCard.dart';
import 'package:chola_driver_flutter/Pages/AddBankAccount.dart';
import 'package:chola_driver_flutter/Pages/AddDrivingLicense.dart';
import 'package:chola_driver_flutter/Pages/AddInsurance.dart';
import 'package:chola_driver_flutter/Pages/AddLivePhoto.dart';
import 'package:chola_driver_flutter/Pages/AddPan.dart';
import 'package:chola_driver_flutter/Pages/AddParmanentAddress.dart';
import 'package:chola_driver_flutter/Pages/AddRCCard.dart';
import 'package:chola_driver_flutter/Pages/AddVehicle.dart';
import 'package:chola_driver_flutter/Pages/Verifying.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:chola_driver_flutter/Widgets/DocumentButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AddDocument extends StatefulWidget {
  final bool? isVerifyAadhar;
  final bool? isVerifyPan;
  final bool? isVerifyDriverLicense;
  final bool? isVerifyRC;
  final bool? isVerifyInsurance;
  final bool? isVerifyPhoto;
  final bool? isVerifyVehicle;
  final bool? isVerifyPermanentAddress;
  final bool? isVerifyBankAccount;
  const AddDocument({
    super.key,
    this.isVerifyAadhar,
    this.isVerifyPan,
    this.isVerifyDriverLicense,
    this.isVerifyRC,
    this.isVerifyInsurance,
    this.isVerifyPhoto,
    this.isVerifyVehicle,
    this.isVerifyPermanentAddress,
    this.isVerifyBankAccount,
  });

  @override
  State<AddDocument> createState() => _AddDocumentState();

  static _AddDocumentState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AddDocumentState>();
}

class _AddDocumentState extends State<AddDocument> {
  bool isVerifyAadhar = false;
  bool isVerifyPan = false;
  bool isVerifyDriverLicense = false;
  bool isVerifyRC = false;
  bool isVerifyInsurance = false;
  bool isVerifyPhoto = false;
  bool isVerifyVehicle = false;
  bool isVerifyPermanentAddress = false;
  // bool isVerifyAcknowledgement = false;
  bool isVerifyBankAccount = false;
  bool isVerifyCheck = false;

  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    isVerifyAadhar = widget.isVerifyAadhar ?? false;
    isVerifyPan = widget.isVerifyPan ?? false;
    isVerifyDriverLicense = widget.isVerifyDriverLicense ?? false;
    isVerifyRC = widget.isVerifyRC ?? false;
    isVerifyInsurance = widget.isVerifyInsurance ?? false;
    isVerifyPhoto = widget.isVerifyPhoto ?? false;
    isVerifyVehicle = widget.isVerifyVehicle ?? false;
    isVerifyPermanentAddress = widget.isVerifyPermanentAddress ?? false;
    isVerifyBankAccount = widget.isVerifyBankAccount ?? false;
  }

  void setAadharVerify(bool value) {
    setState(() {
      isVerifyAadhar = value;
    });
  }

  void setPanVerify(bool value) {
    setState(() {
      isVerifyPan = value;
    });
  }

  void setDriverLicenseVerify(bool value) {
    setState(() {
      isVerifyDriverLicense = value;
    });
  }

  void setRCVerify(bool value) {
    setState(() {
      isVerifyRC = value;
    });
  }

  void setInsuranceVerify(bool value) {
    setState(() {
      isVerifyInsurance = value;
    });
  }

  void setPhotoVerify(bool value) {
    setState(() {
      isVerifyPhoto = value;
    });
  }

  void setVehicleDetailVerify(bool value) {
    setState(() {
      isVerifyVehicle = value;
    });
  }

  void setPermanentAddressVerify(bool value) {
    setState(() {
      isVerifyPermanentAddress = value;
    });
  }

  void setBankAccountVerify(bool value) {
    setState(() {
      isVerifyBankAccount = value;
    });
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
          title: "Legal Records",
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DocumentButton(
                    isEnable: true,
                    label: 'Permanent Address',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ParmanentAddress(),
                        ),
                      ).then((value) {
                        if (value != null && value is bool) {
                          setPermanentAddressVerify(value);
                        }
                      });
                    },
                    isVerify: isVerifyPermanentAddress,
                  ),
                  DocumentButton(
                    isEnable: isVerifyPermanentAddress,
                    label: 'Aadhar Card',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AadharCard(),
                        ),
                      ).then((value) {
                        if (value != null && value is bool) {
                          setAadharVerify(value);
                        }
                      });
                    },
                    isVerify: isVerifyAadhar,
                  ),
                  DocumentButton(
                    isEnable: isVerifyAadhar,
                    label: 'Pan Card',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PanCard(),
                        ),
                      ).then((value) {
                        if (value != null && value is bool) {
                          setPanVerify(value);
                        }
                      });
                    },
                    isVerify: isVerifyPan,
                  ),
                  DocumentButton(
                    isEnable: isVerifyPan,
                    label: 'Driver License',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DrivingLicense(),
                        ),
                      ).then((value) {
                        if (value != null && value is bool) {
                          setDriverLicenseVerify(value);
                        }
                      });
                    },
                    isVerify: isVerifyDriverLicense,
                  ),
                  DocumentButton(
                    isEnable: isVerifyDriverLicense,
                    label: 'Bank Account',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BankAccount(),
                        ),
                      ).then((value) {
                        if (value != null && value is bool) {
                          setBankAccountVerify(value);
                        }
                      });
                    },
                    isVerify: isVerifyBankAccount,
                  ),
                  DocumentButton(
                    isEnable: isVerifyBankAccount,
                    label: 'LivePhoto',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LivePhoto(),
                        ),
                      ).then((value) {
                        if (value != null && value is bool) {
                          setPhotoVerify(value);
                        }
                      });
                    },
                    isVerify: isVerifyPhoto,
                  ),
                  DocumentButton(
                    isEnable: isVerifyPhoto,
                    label: 'Vehicle Details',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VehicleDetails(),
                        ),
                      ).then((value) {
                        if (value != null && value is bool) {
                          setVehicleDetailVerify(value);
                        }
                      });
                    },
                    isVerify: isVerifyVehicle,
                  ),
                  DocumentButton(
                    isEnable: isVerifyVehicle,
                    label: 'Registration Card',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RCCard(),
                        ),
                      ).then((value) {
                        if (value != null && value is bool) {
                          setRCVerify(value);
                        }
                      });
                    },
                    isVerify: isVerifyRC,
                  ),
                  DocumentButton(
                    isEnable: isVerifyRC,
                    label: 'Car Insurance',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Insurance(),
                        ),
                      ).then((value) {
                        if (value != null && value is bool) {
                          setInsuranceVerify(value);
                        }
                      });
                    },
                    isVerify: isVerifyInsurance,
                  ),
                  // DocumentButton(
                  //   isEnable: isVerifyInsurance,
                  //   label: 'Acknowledgement',
                  //   onPressed: () async {
                  //     bool canCheckBiometrics = false;
                  //     try {
                  //       canCheckBiometrics = await auth.canCheckBiometrics;
                  //     } on PlatformException catch (e) {
                  //       print(e);
                  //     }

                  //     if (canCheckBiometrics) {
                  //       bool isAuthenticated = false;
                  //       try {
                  //         isAuthenticated = await auth.authenticate(
                  //           localizedReason: 'Scan your fingerprint to verify',
                  //           // useErrorDialogs: true,
                  //           // stickyAuth: true, // Android only
                  //         );
                  //       } on PlatformException catch (e) {
                  //         print(e);
                  //       }

                  //       if (isAuthenticated) {
                  //         // Add your logic here for when the fingerprint authentication is successful
                  //       } else {
                  //         // Add your logic here for when the authentication fails
                  //       }
                  //     } else {
                  //       // Biometrics are not available on this device, handle accordingly
                  //     }
                  //   },
                  //   isVerify: isVerifyAcknowledgement,
                  // ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: ((isVerifyCheck) &&
                  (isVerifyPermanentAddress) &&
                  (isVerifyAadhar) &&
                  (isVerifyPan) &&
                  (isVerifyDriverLicense) &&
                  (isVerifyInsurance) &&
                  (isVerifyPhoto) &&
                  (isVerifyRC) &&
                  (isVerifyVehicle))
              ? size.height * 0.18
              : size.height * 0.12,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.height * 0.001,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isVerifyCheck,
                      onChanged: (value) {
                        setState(() {
                          isVerifyCheck = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: LayoutBuilder(builder: (context, constraints) {
                        double fontSize = constraints.maxWidth * 0.045;
                        return Text(
                          'I hereby acknowledge given information is true to my knowledge.',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
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
                SizedBox(
                  height: size.height * 0.01,
                ),
                ((isVerifyCheck) &&
                        (isVerifyPermanentAddress) &&
                        (isVerifyAadhar) &&
                        (isVerifyPan) &&
                        (isVerifyDriverLicense) &&
                        (isVerifyInsurance) &&
                        (isVerifyPhoto) &&
                        (isVerifyRC) &&
                        (isVerifyVehicle))
                    ? AgreeButton(
                        buttonText: "Submit",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Verifying(),
                            ),
                          );
                        },
                        padding: 0.7,
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
