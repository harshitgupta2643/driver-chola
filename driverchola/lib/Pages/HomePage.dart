import 'dart:async';
import 'dart:io';

import 'package:chola_driver_flutter/Constants/Constants.dart';
// import 'package:chola_driver_flutter/Pages/Earning.dart';
import 'package:chola_driver_flutter/Pages/Service.dart';
import 'package:chola_driver_flutter/Widgets/CustomMenuButton.dart';
import 'package:chola_driver_flutter/Widgets/Menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:upgrader/upgrader.dart';

class HomePage extends StatefulWidget {
  // final String jwt;
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController _controller;
  Position? currentPosition;
  PanelController? _panelController;
  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    _panelController = PanelController();
    _initMap();
  }

  Future<void> _initMap() async {
    try {
      await _requestLocationPermission();
      await _getCurrentLocation();
    } catch (e) {
      print("Error initializing map: $e");
      // Handle the error here, for example, show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please connect to the Internet.'),
        ),
      );
    }
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.location.request();
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        currentPosition = position;
      });
    } catch (e) {
      print("Error getting current location: $e");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Connection Error',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            content: Text(
              'Please connect to the Internet.',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  void _moveToCurrentLocation() {
    if (currentPosition != null && _controller != null) {
      _controller.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(
            currentPosition!.latitude,
            currentPosition!.longitude,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return UpgradeAlert(
      dialogStyle: (Platform.isIOS)
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      showIgnore: false,
      showReleaseNotes: false,
      showLater: false,
      upgrader: Upgrader(
        messages: UpgraderMessages(
          code:
              'A new version of the app is available. Please update to continue using the app.',
        ),
        languageCode: 'en',
      ),
      onUpdate: () {
        // Handle update action
        Constants.navigateToUrl();
        return false; // Return false to close the dialog
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Scaffold(
          appBar: HomeAppBar(
            preferredHeight: size.height * 0.12,
            title: "",
          ),
          body: Stack(
            children: [
              if (currentPosition != null)
                GoogleMap(
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    zoom: 15.0,
                    target: LatLng(
                      currentPosition!.latitude,
                      currentPosition!.longitude,
                    ),
                  ),
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                    ),
                  },
                  markers: Set<Marker>.from([
                    Marker(
                      markerId: MarkerId("currentLocation"),
                      position: LatLng(
                        currentPosition!.latitude,
                        currentPosition!.longitude,
                      ),
                      infoWindow: InfoWindow(
                        title: "Current Location",
                        snippet: "You are here",
                      ),
                    ),
                  ]),
                ),
              if (currentPosition == null)
                Center(
                  child: CircularProgressIndicator(),
                ),
              Positioned(
                bottom: size.height * 0.13,
                left: size.width * 0.03,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    onPressed: () {
                      //privacy  policy and terms of service
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => HomePage(),
                      //   ),
                      // );
                      Constants.showError(context,
                          "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                    },
                    icon: Icon(
                      Icons.privacy_tip,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: size.height * 0.13,
                right: size.width * 0.03,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    onPressed: _moveToCurrentLocation,
                    icon: Icon(
                      Icons.my_location,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: size.height * 0.13,
                right: size.width * 0.4,
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.8,
                      child: Switch(
                        activeColor: Colors.green,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                        // inactiveThumbColor: Colors.red,
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                        dragStartBehavior: DragStartBehavior.start,
                        splashRadius: size.height * 0.1,
                        trackOutlineColor: MaterialStatePropertyAll(
                          switchValue ? Colors.green : Colors.red,
                        ),
                        thumbColor: MaterialStatePropertyAll(
                          switchValue ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                    // Text(
                    //   switchValue ? 'Online' : 'Offline',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
              SlidingUpPanel(
                controller: _panelController,
                panel: _panelController != null
                    ? CustomPanelWidget(panelController: _panelController!)
                    : Container(),
                isDraggable: true,
                collapsed: CustomCollapsedWidget(),
                minHeight: MediaQuery.of(context).size.height * 0.11,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                maxHeight: MediaQuery.of(context).size.height * 0.5,
              ),
            ],
          ),
          drawer: MenuWidget(),
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double preferredHeight;
  final VoidCallback? onPressed;
  final String title;

  const HomeAppBar(
      {Key? key,
      required this.preferredHeight,
      this.onPressed,
      required this.title})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: preferredHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: AppBar(
        elevation: 5,
        primary: false,
        title: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.black,
            ),
            minimumSize: MaterialStatePropertyAll(
              Size(
                size.width * 0.3,
                size.height * 0.06,
              ),
            ),
          ),
          onPressed: () {
            Constants.showError(context,
                "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");

            //Navigator to Earning
          },
          child: Text(
            'INR 00.00',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.shortestSide * 0.06,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        leading: CustomMenuIconButton(
          // onPressed: ,
          child_widget: Image.asset(
            'assets/Menu.png',
          ),
        ),
        // leadingWidth: MediaQuery.of(context).size.width * 0.15,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.016,
              // vertical: size.height * 0.02,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomePage(),
                  //   ),
                  // );
                  Constants.showError(context,
                      "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFF839DFE),
          ),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.01,
                ),
                child: Text(
                  'OWN VEHICLE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24 / 375 * size.shortestSide,
                    fontFamily: 'RaviPrakash',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class CustomPanelWidget extends StatelessWidget {
  final PanelController panelController;
  const CustomPanelWidget({required this.panelController});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0,
    );
  }
}

class CustomCollapsedWidget extends StatefulWidget {
  @override
  _CustomCollapsedWidgetState createState() => _CustomCollapsedWidgetState();
}

class _CustomCollapsedWidgetState extends State<CustomCollapsedWidget> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              break;
            case 2:
              // Navigate to Map page
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => EarningPage()));
              Constants.showError(context,
                  "Stay Tuned for an Exciting Addition! We're thrilled to announce a new feature coming your way!");
              break;
            case 3:
              // Navigate to Earning page

              break;
          }
        },
      ),
    );
  }
}
