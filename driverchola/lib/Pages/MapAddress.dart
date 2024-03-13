import 'package:chola_driver_flutter/Constants/Constants.dart';
import 'package:chola_driver_flutter/Pages/AddParmanentAddress.dart';
import 'package:chola_driver_flutter/Widgets/Buttonfill.dart';
import 'package:chola_driver_flutter/Widgets/CustomAppbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapAddress extends StatefulWidget {
  const MapAddress({Key? key}) : super(key: key);

  @override
  State<MapAddress> createState() => _MapAddressState();
}

class _MapAddressState extends State<MapAddress> {
  late GoogleMapController mapController;
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  void _updateMarkerPosition(LatLng newPosition) {
    setState(() {
      _currentLocation = newPosition;
    });
    print(_currentLocation);
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
          title: 'Residence Address',
          preferredHeight: size.height * 0.08,
        ),
        body: _currentLocation != null
            ? Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _currentLocation!,
                      zoom: 14.47,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                      Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer()),
                    },
                    onCameraMove: (CameraPosition? position) {
                      if (_currentLocation != position!.target) {
                        _updateMarkerPosition(position.target);
                      }
                    },
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/pin.png',
                      width: size.width * 0.1,
                      height: size.width * 0.1,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AgreeButton(
                        buttonText: 'Continue',
                        onPressed: () {
                          setState(() {
                            Constants.latLang = _currentLocation!;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ParmanentAddress(),
                            ),
                          );
                        },
                        padding: 0.6,
                      ),
                    ),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Color(0xff6A4DE8),
                  backgroundColor: Colors.transparent,
                ),
              ),
      ),
    );
  }
}
