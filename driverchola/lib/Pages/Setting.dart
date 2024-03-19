import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:chola_driver_flutter/Widgets/SettingListTile.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool emailReciept = false;
  bool biometricLoginReciept = false;
  bool nightModeReciept = false;
  bool locationAutoShareReciept = false;
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
          preferredHeight: size.height * 0.09,
          title: 'Settings',
        ),
        body: SizedBox(
          height: size.height - statusBarHeight,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Constants.themeColor,
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: Constants.gradientColor,
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //   ),
            // ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.045,
                  ),
                  Container(
                    height: size.height * 0.1,
                    width: size.width * 0.85,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Color(0xffB795FF),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.08,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/Userperson.png',
                            color: Colors.black,
                          ),
                        ),
                        // SizedBox(
                        //   width: size.width * 0.03,
                        // ),
                        Container(
                          width: size.width * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (Constants.firstName.length != 0)
                                    ? Constants.firstName
                                    : 'User Name',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.shortestSide * 0.05,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                (Constants.phoneNo.length != 0)
                                    ? '+91 ' + Constants.phoneNo
                                    : '+91 0123456789',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.shortestSide * 0.035,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: size.width * 0.035,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Transform.rotate(
                              angle: 45 * (3.141592653589793 / 180),
                              child: Icon(
                                Icons.near_me,
                                color: Colors.black,
                                size: size.width * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Divider(
                    color: Color(0xffAFAFAF),
                  ),
                  SettingListTile(
                    title: ' Auto E-mail Reciept',
                    value: emailReciept,
                    onChanged: (value) {
                      (!emailReciept)
                          ? Constants.showError(context,
                              "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!")
                          : null;
                      setState(() {
                        emailReciept = value;
                      });
                      setState(() {
                        emailReciept = false;
                      });
                    },
                    imagePath: 'assets/AutoEmail.png',
                  ),
                  Divider(
                    color: Color(0xffAFAFAF),
                  ),
                  SettingListTile(
                    title: 'Biometric Login',
                    value: biometricLoginReciept,
                    onChanged: (value) {
                      (!biometricLoginReciept)
                          ? Constants.showError(context,
                              "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!")
                          : null;
                      setState(() {
                        biometricLoginReciept = value;
                      });
                      setState(() {
                        biometricLoginReciept = false;
                      });
                    },
                    imagePath: 'assets/Frame.png',
                  ),
                  Divider(
                    color: Color(0xffAFAFAF),
                  ),
                  SettingListTile(
                    title: 'Night Mode',
                    value: nightModeReciept,
                    onChanged: (value) {
                      (!nightModeReciept)
                          ? Constants.showError(context,
                              "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!")
                          : null;
                      setState(() {
                        nightModeReciept = value;
                      });
                      setState(() {
                        nightModeReciept = false;
                      });
                    },
                    imagePath: 'assets/Night.png',
                  ),
                  Divider(
                    color: Color(0xffAFAFAF),
                  ),
                  SettingListTile(
                    title: 'Location auto share',
                    value: locationAutoShareReciept,
                    onChanged: (value) {
                      (!locationAutoShareReciept)
                          ? Constants.showError(context,
                              "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!")
                          : null;
                      setState(() {
                        locationAutoShareReciept = value;
                      });
                      setState(() {
                        locationAutoShareReciept = false;
                      });
                    },
                    imagePath: 'assets/RentalRide.png',
                  ),
                  Divider(
                    color: Color(0xffAFAFAF),
                  ),
                  SettingListTile1(
                    title: 'Language Preference',
                    imagePath: 'assets/Language.png',
                  ),
                  Divider(
                    color: Color(0xffAFAFAF),
                  ),
                  SettingListTile1(
                    title: 'Trusted Contact',
                    imagePath: 'assets/User.png',
                  ),
                  Divider(
                    color: Color(0xffAFAFAF),
                  ),
                  SettingListTile1(
                    title: 'Change Password',
                    imagePath: 'assets/Lock.png',
                  ),
                  Divider(
                    color: Color(0xffAFAFAF),
                  ),
                  SettingListTile1(
                    title: 'SOS Configuration',
                    imagePath: 'assets/sos.png',
                  ),
                  Divider(
                    color: Color(0xffAFAFAF),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
