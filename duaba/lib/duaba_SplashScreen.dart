import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:duaba/date_Picker%20page.dart';
import 'package:duaba/duabaMapScreen.dart';
import 'package:duaba/duaba_Verif_page.dart';
import 'package:duaba/duaba_bottomNavigation.dart';
import 'package:duaba/duaba_login_page.dart';
import 'package:duaba/main.dart';
import 'package:duaba/more_Pickes_Radio.dart';
import 'package:duaba/polyline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'currentLocationMap.dart';
import 'duabaMap2.dart';
import 'duaba_Map.dart';
import 'duaba_Register_page.dart';

class DuabaSplash extends StatefulWidget {
  const DuabaSplash({Key? key, required String title}) : super(key: key);

  @override
  State<DuabaSplash> createState() => DuabaSplashState();
}

class DuabaSplashState extends State<DuabaSplash> {

 //static String keyValue = "name";
 static String tokenkeyValue = "token";
  //Location location = Location();
  //final Completer<GoogleMapController?> _controller = Completer();
 // LocationData? _currentPosition;
  //LatLng? currentLoc = const LatLng(30.6972397, 76.6896764);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getToken().then((newToken){
      //print("FCM token");
      print("FCM token--->:$newToken");
    });
   // getLocation();
    getCurrntValue();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: SvgPicture.asset('assets/splash.svg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              child: Center(
                  child: SvgPicture.asset('assets/logo.svg',
                  )
              ),
            ),
          /*  Positioned(
              left:25.h,
                bottom: 10.h,
                child:CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                color:Colors.black,
                strokeWidth:2,
                )
            ),*/
          ]
      ),
    );
  }

  void getCurrntValue() async {
   var pref = await SharedPreferences.getInstance();
    var istoken = await pref.getString(tokenkeyValue);
    print("istoken $istoken");
   if (istoken!=null) {
     Timer(Duration(seconds:1),()=>Navigator.pushReplacement(context, MaterialPageRoute
       (builder: (context) =>DuabaMapScreen1()),
     )
     );
   }else {
     Timer(Duration(seconds:1),()=>Navigator.pushReplacement(context, MaterialPageRoute
       (builder: (context) =>  MyHomePage(title: 'fsdfsd',)),
     )
     );
   }
  /*  final auth=FirebaseAuth.instance;
    final user= auth.currentUser;

      if (user != null) {
        Timer(Duration(seconds:1),()=>Navigator.pushReplacement(context, MaterialPageRoute
            (builder: (context) =>DuabaMapScreen1()),
          )
        );
      }*//*else if(user!= null){
        Navigator.pushReplacement(context, MaterialPageRoute
            (builder: (context) => DubaLoginPage()));
      }*//*
      else {
        Timer(Duration(seconds:1),()=>Navigator.pushReplacement(context, MaterialPageRoute
          (builder: (context) =>  MyHomePage(title: 'fsdfsd',)),
        )
        );
      }*/
      /*Navigator.pushReplacement(context, MaterialPageRoute
        (builder: (context) =>
      //GoogleMapScreen()
      //CurrentLocat()
      Location1()
      // DuabaSharedPref(),
      //DuabaBottomNavigationBar()
      // DuabaMapScreen1(),
      // DatePickerPage(),
      //MorePickRadio()
      MyHomePage(title: "Home Page"),
      )
      );*/

  }

  /* getCurrentLocation() async {
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
  }*/

  Future<Object> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }


    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition();
    print(position);

    return await Geolocator.getCurrentPosition();
  }

}

