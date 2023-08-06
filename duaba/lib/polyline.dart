import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
/*import 'package:my_first_flutter_project/geoCoderP.dart';*/
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDirections(); //fetch direction polylines from Google API

    // for(int i=0; i<latlng.length; i++){
    //
    //   setState(() {
    //
    //   });
    //   polylines.add(
    //       Polyline(
    //         polylineId: PolylineId('1'),
    //         points: latlng,
    //         color: Colors.green,
    //       )
    //   );
    // }
  }
  PolylinePoints polylinePoints = PolylinePoints();

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyCrPOCUEMHoOXOacOtMkuQxSbSE1lYzpFA",// API Hit
      PointLatLng(30.7025812, 76.6825109),   //Starting Point
      PointLatLng(32.19085634874485, 75.70125898805497),  //End Point
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.
      forEach(
              (PointLatLng point) {
            polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          }
      );
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }
  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId line = PolylineId("poly");
    Polyline polyline = Polyline(
      jointType: JointType.round,
      polylineId: line,
      color: Colors.black54,
      points: polylineCoordinates,
      width: 4,

    );
    polylines[line] = polyline;
    setState(() {});
  }


  double lat = 0;
  double lng = 0;
  String staddres='';
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.697082, 76.689472),
    zoom: 10,
  );
  Set<Marker> markers = {
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(30.697082, 76.689472),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    /* Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      markerId: MarkerId('2'),
      position: LatLng(30.732773505360388, 76.7060875012853),
    ),*/
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(32.19085634874485, 75.70125898805497),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    ),
  };
  // Set<Polyline> polylines={};
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  List<LatLng> latlng=[
    LatLng(30.697082, 76.689472),
    LatLng(32.19085634874485, 75.70125898805497),
  ];
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value) {})
        .onError(
            (error, stackTrace) async {
          await Geolocator.requestPermission();
          print("ERROR" + error.toString());
        }
    );
    return await Geolocator.getCurrentPosition();
  }

/*static const CameraPosition _kLake = CameraPosition(
bearing: 192.8334901395799,
target: LatLng(37.43296265331129, -122.08832357078792),
tilt: 59.440717697143555,
zoom: 19.151926040649414);*/
  /* @override
 void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          GoogleMap(
            compassEnabled: true,
            // mapType: MapType.hybrid,
            markers: markers,
            polylines: Set<Polyline>.of(polylines.values),
            /*{
              Marker(
                infoWindow: InfoWindow(
                  title: 'My Current Location'
                ),
                markerId: const MarkerId("current Loc"),
                position: const LatLng(30.697082, 76.689472),
                draggable: true,
                onDragEnd: (value) {
                  // value is the new position
                },
                // To do: custom marker icon
              ),

              Marker(
                infoWindow: InfoWindow(
                  title:'Mohali Bus Stand'
                ),
                markerId: const MarkerId("Mohali Bus Stand"),
                position: const LatLng(30.732921058514464, 76.70514336371731),
              ),
            },*/
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ]
        ),
       /* floatingActionButton: FloatingActionButton(
          onPressed: () async {
            getUserCurrentLocation().then(
                    (value) async {
                  print(value.latitude.toString() + " " + value.longitude.toString());
                  lat = value.latitude;
                  lng = value.longitude;

                  Coordinates coordinates = Coordinates(lat ,lng);
                  var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
                  var first = address.first;
                  print("Address"+first.featureName.toString() + first.addressLine.toString(),);

                  setState(() {
                    staddres=first.featureName.toString()+" "+first.addressLine.toString();
                  }
                  );

                  // marker added for current users location
                  markers.add(
                      Marker(
                        markerId: MarkerId("1"),
                        position: LatLng(value.latitude, value.longitude),
                        infoWindow: InfoWindow(
                          title: 'My Current Location',
                        ),
                      )
                  );

                  // specified current users location
                  CameraPosition cameraPosition = new CameraPosition(
                    target: LatLng(value.latitude, value.longitude),
                    zoom: 14,
                  );

                  final GoogleMapController controller = await _controller.future;
                  controller.animateCamera(
                      CameraUpdate.newCameraPosition(cameraPosition));
                  setState(() {});
                });
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => GeoCodScreen(
                      addres: staddres,logo: lat,litt: lng,))
            );
          },
          child: Icon(Icons.change_circle_outlined),
        ),*/
      ),
    );
  }

/*Future<void> _goToTheLake() async {
  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
}*/
}

