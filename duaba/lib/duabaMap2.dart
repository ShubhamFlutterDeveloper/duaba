import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location1 extends StatefulWidget {
  const Location1({Key? key}) : super(key: key);

  @override
  State<Location1> createState() => _Location1State();
}

class _Location1State extends State<Location1> {
    LatLng? currentLoc = const LatLng(30.6972397, 76.6896764);
    Location location = Location();
    LocationData? _currentPosition;
    final Completer<GoogleMapController?> _controller = Completer();
    String? _address;
    Marker? marker;
    Set<Marker>  markers = {
      Marker(
      markerId: MarkerId('1  '),
      position: LatLng(30.711442886999272, 76.72129294838996),
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    };
  void initstate(){
    super.initState();
    getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          GoogleMap(
            markers:markers,
              myLocationEnabled: true,
              myLocationButtonEnabled:false,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: currentLoc!,
                zoom: 16,
              ),

              onCameraMove: (CameraPosition? position) {
                if (currentLoc != position!.target) {
                  setState(() {
                    currentLoc = position.target;
                  });
                }
              },
              onCameraIdle: () {
                print('camera idle');
                getAddressFromLatLng();
              },
              onTap: (latLng) {
                print (latLng);
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              }
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(90, 50 ,0, 0),
              child: Text('Select Your Location',
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.black ),
              )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80,right: 18,left: 18),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:10),
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: SvgPicture.asset('assets/Location_pin.svg',
                      alignment: Alignment.center,
                      height: 20,
                      width: 15,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search Location',
                  hintStyle: TextStyle(color: Colors.black54),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
            ), ),
       /*   Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: SvgPicture.asset(
                'assets/location.svg', height: 170, width: 170,
              ),
            ),
          ),
          Positioned(
            top: 90,
            right: 20,
            left: 20,
            child: Container(
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(12),
                border: Border.all (color: Colors.black),

                color: Colors.white,
              ),
              padding: const EdgeInsets.all(5),
              child: Row(
                  children: [
                    IconButton(icon: SvgPicture.asset('assets/Location_pin.svg',
                    ), onPressed: () {},
                    ),
                    Text( _address ?? 'Pick your address',
                        overflow: TextOverflow.visible,softWrap: true),
                  ]
              ),
            ),
          ),*/
        ],
      ),
    );
  }
  getAddressFromLatLng() async {
    try {
      GeoData data = await Geocoder2.getDataFromCoordinates(
          latitude: currentLoc!.latitude,
          longitude: currentLoc!.longitude,
          googleMapApiKey: ('AIzaSyCMzydBgkIhD0fupc0qgcrQ_If-Os8UQjg'));
      setState(() {
        _address = data.address;
      });
    } catch (e) {
      print(e);
    }
  }
  getCurrentLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    final GoogleMapController? controller = await _controller.future;

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    if (_permissionGranted == PermissionStatus.granted) {
      location.changeSettings(accuracy: LocationAccuracy .high);

      _currentPosition = await location.getLocation();
      controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
        LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!),
        zoom: 16,
      )));
      setState(() {
        currentLoc =
            LatLng (_currentPosition!.latitude!, _currentPosition!.longitude!);
      });
    }
  }
}
