import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/AddDocument.dart';
// import 'package:chola_driver_flutter/Pages/HomePage.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';

class VerifyBankDetails extends StatefulWidget {
  const VerifyBankDetails({Key? key}) : super(key: key);

  @override
  State<VerifyBankDetails> createState() => _VerifyBankDetailsState();
}

class _VerifyBankDetailsState extends State<VerifyBankDetails> {
  bool isVerified = false;

  @override
  void initState() {
    super.initState();
    isVerified = false;
    // Simulating verification after 10 seconds
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isVerified = true;
      });
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
          title: "Verification",
          preferredHeight: size.height * 0.08,
        ),
        backgroundColor: Constants.themeColor,
        body: SizedBox(
          height: size.height - statusBarHeight,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (!isVerified)
                    ? CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                        color: Color(0xff6A4DE8),
                      )
                    : Container(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                if (isVerified)
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: size.shortestSide * 0.3,
                  ),
                Text(
                  isVerified ? 'Verified' : 'Verifying Bank Details',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xff717171),
                    fontWeight: FontWeight.w700,
                    fontSize: isVerified
                        ? size.shortestSide * 0.1
                        : size.shortestSide * 0.05,
                  ),
                ),
                // SizedBox(
                //   height: size.height * 0.02,
                // ),
                // Image.asset(
                //   'assets/digiLocker.png',
                // ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: (isVerified)
            ? SizedBox(
                height: size.height * 0.1,
                child: Center(
                  child: Column(
                    children: [
                      AgreeButton(
                        buttonText: "Okay",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddDocument(
                                isVerifyAadhar: true,
                                isVerifyPan: true,
                                isVerifyDriverLicense: true,
                                isVerifyPermanentAddress: true,
                                isVerifyBankAccount: true,
                              ),
                            ),
                          );
                        },
                        padding: 0.6,
                      ),
                      // SizedBox(
                      //   height: size.height * 0.01,
                      // ),
                      // Text(
                      //   'Upload all Documents to start earning with CHOLA.',
                      //   overflow: TextOverflow.ellipsis,
                      //   maxLines: 1,
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w500,
                      //     fontSize: size.shortestSide * 0.04,
                      //     color: Colors.black,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
