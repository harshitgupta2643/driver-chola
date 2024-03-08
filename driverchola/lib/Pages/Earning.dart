import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/HomePage.dart';
import 'package:chola_driver_flutter/Pages/Service.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';

class EarningPage extends StatefulWidget {
  const EarningPage({super.key});

  @override
  State<EarningPage> createState() => _EarningPageState();
}

class _EarningPageState extends State<EarningPage> {
  int _currentIndex = 2;
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
          title: "Earning",
          preferredHeight: size.height * 0.08,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
        backgroundColor: Constants.themeColor,
        body: SizedBox(
          height: size.height - statusBarHeight,
          child: Container(),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Color(0xffCFD6FF),
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            useLegacyColorScheme: true,
            type: BottomNavigationBarType.fixed,
            items: [
              // BottomNavigationBarItem(
              //   activeIcon: Image.asset(
              //     'assets/assistant.png',
              //     // color: Colors.black,
              //   ),
              //   icon: Image.asset(
              //     'assets/assistant.png',
              //     // color: Colors.grey[700],
              //   ),
              //   label: "Assistant",
              // ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(
                    bottom: size.height * 0.005,
                    top: size.height * 0.005,
                  ),
                  child: Image.asset(
                    'assets/ServiceIcon.png',
                    color: Colors.black,
                  ),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(
                    bottom: size.height * 0.005,
                    top: size.height * 0.005,
                  ),
                  child: Image.asset(
                    'assets/ServiceIcon.png',
                    color: Colors.grey[700],
                  ),
                ),
                label: "Service",
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/NavigationIcon.png',
                  color: Colors.black,
                ),
                icon: Image.asset(
                  'assets/NavigationIcon.png',
                  color: Colors.grey[700],
                ),
                label: "Map",
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/EarningIcon.png',
                  color: Colors.black,
                ),
                icon: Image.asset(
                  'assets/EarningIcon.png',
                  color: Colors.grey[700],
                ),
                label: "Earning",
              ),
            ],
            elevation: 5,
            selectedItemColor: Colors.grey[800],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              switch (index) {
                case 0:
                  // Navigate to Assistant page
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ServicePage()));
                  break;
                case 1:
                  // Navigate to Service page
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                  break;
                case 2:
                  // Navigate to Map page
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EarningPage()));
                  break;
                case 3:
                  // Navigate to Earning page

                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
