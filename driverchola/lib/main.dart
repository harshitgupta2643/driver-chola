import 'dart:io' show Platform;
import 'package:chola_driver_flutter/Constants/Constants.dart';
// import 'package:chola_driver_flutter/Pages/Login.dart';
import 'package:chola_driver_flutter/Pages/LoginPage1.dart';
// import 'package:chola_driver_flutter/Pages/Signup.dart';
import 'package:chola_driver_flutter/Services/Notification.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
// import 'package:chola_driver_flutter/Widgets/LandingPageButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'Pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseAppCheck.instance.activate();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.blue,
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ),
  );
  //Notification:
  WidgetsFlutterBinding.ensureInitialized();
  PushNotificationService pushNotificationService = PushNotificationService();
  await pushNotificationService.initialize();
  String? token = await pushNotificationService.getToken();
  print('Token on app start: $token');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chola Chariots',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFF8D7)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        backgroundColor: Constants.themeColor,
        child: _buildContent(),
      );
    } else {
      return Scaffold(
        backgroundColor: Constants.themeColor,
        body: _buildContent(),
      );
    }
  }

  Widget _buildContent() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        bottom: size.height * 0.1,
        top: size.height * 0.1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/Chola_Logo.png',
                width: size.width,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              // Image.asset(
              //   'assets/tagLine.png',
              //   width: size.width * 0.6,
              // ),
              Text(
                'Drive with CHOLA\n              Own a Chariot',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.shortestSide * 0.05867,
                  fontFamily: 'RacingSansOne',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 1.43,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.2,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: AgreeButton(
                buttonText: "Get Started",
                borderRadius: 12,
                onPressed: () {
                  Navigator.push(
                    context,
                    Platform.isIOS
                        ? CupertinoPageRoute(
                            builder: (context) => LoginPage1(),
                          )
                        : MaterialPageRoute(
                            builder: (context) => LoginPage1(),
                          ),
                  );
                },
                suffixWidget: Icon(
                  Icons.double_arrow,
                  color: Colors.white,
                ),
                padding: 0.7,
                fontSize: MediaQuery.of(context).size.shortestSide * 0.0533,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
