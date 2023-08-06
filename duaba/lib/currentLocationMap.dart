import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocat extends StatefulWidget {
  const CurrentLocat({Key? key}) : super(key: key);

  @override
  State<CurrentLocat> createState() => _CurrentLocatState();
}

class _CurrentLocatState extends State<CurrentLocat> {
  double lat = 0;
  double lng = 0;
  Completer<GoogleMapController> mapController = Completer();

  Uint8List? markerIcon;
  Marker? marker;
  BitmapDescriptor markerIcon2 = BitmapDescriptor.defaultMarker;
  Future<Uint8List> getBytesFromAsset(String path, int width,int height) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width,targetHeight: height);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!.buffer.asUint8List();
  }

  void customMarker() async{
    markerIcon = await getBytesFromAsset('assets/location.png', 150,150);
    marker = Marker(
        markerId: const MarkerId("DriverLocation"),
        position: const  LatLng(30.697082, 76.689472),
        icon: BitmapDescriptor.fromBytes(markerIcon ?? Uint8List(0)));
    setState(() {});
  }
  @override
  void initState() {
    customMarker();
    //addCustomIcon();
    super.initState();
  }
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
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.697082, 76.689472),
    zoom: 14,
  );
  Set<Marker>  markers = {
   /* Marker(
      markerId: MarkerId('1'),
      position: LatLng(30.711442886999272, 76.72129294838996),
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),*/
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          compassEnabled: true,
          // mapType: MapType.hybrid,
          markers: {
            marker ?? const Marker(markerId: MarkerId("noMarker"))

          },
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
          myLocationEnabled: false,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            mapController.complete(controller);
          },
        ),
      ]
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            getUserCurrentLocation().then(
                    (value) async {
                      setState(() {});
                      print('My current location');
                  print(value.latitude.toString() + " " + value.longitude.toString());

                      final GoogleMapController controller = await mapController.future;

                      await controller.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(value.latitude, value.longitude), zoom: 14)));
                      setState(() {});
                 /* lat = value.latitude;
                  lng = value.longitude;*/
                  //
                  // Coordinates coordinates = Coordinates(lat ,lng);
                  // var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
                  // var first = address.first;
                  // print('my address');
                  // print("Address"+first.featureName.toString() + first.addressLine.toString(),);
                  //
                  // setState(() {
                  //  /* staddres=first.featureName.toString()+" "+first.addressLine.toString();*/
                  // }
                  // );
                  //
                  // // marker added for current users location
                   markers.add(
                       Marker(
                         markerId: MarkerId("2"),
                         position: LatLng(value.latitude, value.longitude),
                         infoWindow: InfoWindow(
                           title: 'My Current Location',
                         ),
                           icon: markerIcon2,
                       )
                   );
                });
          /*  Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => GeoCodScreen(
                      addres: staddres,logo: lat,litt: lng,))
            );*/
          },
          child: Icon(Icons.change_circle_outlined),
        )
    );
  }

 /* void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
         ImageConfiguration( devicePixelRatio: 30,), "assets/Location_pin.png",

    ).then(
          (icon) {
        setState(() {
          markerIcon2 = icon;
        });
      },
    );
  }*/
}
