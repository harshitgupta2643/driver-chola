import 'dart:async';
import 'dart:convert';
import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/EnterDetails.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;

class EmailVerify extends StatefulWidget {
  final String email;
  final String jwt;
  EmailVerify({Key? key, required this.email, required this.jwt})
      : super(key: key);

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  Timer? _resendTimer;
  int _resendSeconds = 30;
  bool _showResendButton = false;
  final _emailFormKey = GlobalKey<FormState>();
  Map<String, dynamic> data = {};
  verifyEmail() async {
    print('dhjbcjdkbcdkj');
    // print(dialCode.runtimeType);
    var response = await http.put(
      Uri.parse('https://chola-web-app.azurewebsites.net/api/auth/update'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.jwt}',
      },
      body: jsonEncode({
        'verified': true,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body).runtimeType);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to verify Email.');
    }
  }

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  @override
  void dispose() {
    _resendTimer!.cancel();
    super.dispose();
  }

  void startResendTimer() {
    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendSeconds > 0) {
        setState(() {
          _resendSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          _showResendButton = true;
        });
      }
    });
  }

  void resendOTP() {
    // Resend OTP logic
    setState(() {
      _resendSeconds = 30;
      _showResendButton = false;
    });
    startResendTimer();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    final defaultPinTheme = PinTheme(
      width: size.width * 0.2,
      height: size.height * 0.07,
      textStyle: TextStyle(
          fontSize: size.shortestSide * 0.06,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Color(0xFF839DFE),
      ),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Padding(
      padding: EdgeInsets.only(
        top: statusBarHeight,
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Enter OTP",
          preferredHeight: MediaQuery.of(context).size.height * 0.08,
        ),
        backgroundColor: Constants.themeColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height - statusBarHeight,
            child: Form(
              key: _emailFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Enter the 6-digit code sent to " + widget.email,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Pinput(
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      length: 6,
                      autofocus: true,
                      isCursorAnimationEnabled: true,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  _showResendButton
                      ? AgreeButton(
                          onPressed: resendOTP,
                          buttonText: "Resend OTP",
                          padding: 0.6,
                        )
                      : Text(
                          "You can resend OTP in $_resendSeconds sec(s)",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.shortestSide * 0.05,
                            color: Colors.black,
                          ),
                        ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  AgreeButton(
                    buttonText: "Verify OTP",
                    onPressed: () async {
                      try {
                        Map<String, dynamic> result = await verifyEmail();

                        setState(() {
                          data = result;
                        });
                        print(data['phoneNoVerified']);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EnterDetails(
                              jwt : data['jwt'] as String,
                            ),
                          ),
                        );
                      } catch (e) {
                        print('Exception: $e');
                      }
                      
                    },
                    padding: 0.8,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}