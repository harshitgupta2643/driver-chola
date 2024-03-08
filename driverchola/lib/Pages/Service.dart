import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/Earning.dart';
import 'package:chola_driver_flutter/Pages/HomePage.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:chola_driver_flutter/Widgets/ServiceListTile.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  int _currentIndex = 0;
  bool soloRide = false;
  bool groupRide = false;
  bool corporateRide = false;
  bool schoolRide = false;
  bool rentalRide = false;
  bool reserveRide = false;
  bool packageRide = false;
  bool intercityRide = false;

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
          title: "Services",
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
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: size.height * 0.03,
                // ),
                ServiceListTile(
                  title: " Solo Rides",
                  value: soloRide,
                  onChanged: (value) {
                    setState(() {
                      soloRide = value;
                    });
                  },
                  imagePath: 'assets/SoloRide.png',
                ),
                Divider(
                  color: Color(0xffAFAFAF),
                ),
                ServiceListTile(
                  title: "Group Rides",
                  value: groupRide,
                  onChanged: (value) {
                    setState(() {
                      groupRide = value;
                    });
                  },
                  imagePath: 'assets/Frame.png',
                ),
                Divider(
                  color: Color(0xffAFAFAF),
                ),
                ServiceListTile(
                  title: "Corporate Rides",
                  value: corporateRide,
                  onChanged: (value) {
                    setState(() {
                      corporateRide = value;
                    });
                  },
                  imagePath: 'assets/Night.png',
                ),
                Divider(
                  color: Color(0xffAFAFAF),
                ),
                ServiceListTile(
                  title: "School Rides",
                  value: schoolRide,
                  onChanged: (value) {
                    setState(() {
                      schoolRide = value;
                    });
                  },
                  imagePath: 'assets/SchoolRide.png',
                ),
                Divider(
                  color: Color(0xffAFAFAF),
                ),
                ServiceListTile(
                  title: " Rental Rides",
                  value: rentalRide,
                  onChanged: (value) {
                    setState(() {
                      rentalRide = value;
                    });
                  },
                  imagePath: 'assets/SoloRide.png',
                ),
                Divider(
                  color: Color(0xffAFAFAF),
                ),
                ServiceListTile(
                  title: "Reserve Rides",
                  value: reserveRide,
                  onChanged: (value) {
                    setState(() {
                      reserveRide = value;
                    });
                  },
                  imagePath: 'assets/Frame.png',
                ),
                Divider(
                  color: Color(0xffAFAFAF),
                ),
                ServiceListTile(
                  title: "Package Rides",
                  value: packageRide,
                  onChanged: (value) {
                    setState(() {
                      packageRide = value;
                    });
                  },
                  imagePath: 'assets/Night.png',
                ),
                Divider(
                  color: Color(0xffAFAFAF),
                ),
                ServiceListTile(
                  title: "Intercity Rides",
                  value: intercityRide,
                  onChanged: (value) {
                    setState(() {
                      intercityRide = value;
                    });
                  },
                  imagePath: 'assets/SchoolRide.png',
                ),
                Divider(
                  color: Color(0xffAFAFAF),
                ),
                Text(
                  'To receive Ride request Please Turn on the button.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.shortestSide * 0.038,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // SizedBox(
                //   height: size.height * 0.01,
                // )
              ],
            ),
          ),
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
