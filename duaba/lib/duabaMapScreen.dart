// import 'dart:async';
// import 'dart:developer';
// import 'dart:ui';
// import 'package:flutter/services.dart';
// import 'package:google_place/google_place.dart' as places;
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:sizer/sizer.dart';
//
// class DuabaMapScreen1 extends StatefulWidget {
//   const DuabaMapScreen1({Key? key}) : super(key: key);
//
//   @override
//   State<DuabaMapScreen1> createState() => _DuabaMapScreen1State();
// }
//
// class _DuabaMapScreen1State extends State<DuabaMapScreen1> {
//   Completer<GoogleMapController> _controller = Completer();
//    places.GooglePlace ?googlePlace;
//   List<places.AutocompletePrediction> predictions = [];
//   bool isPlaceListVisible = false, onClickList = false;
//
//   TextEditingController searchScreenController = TextEditingController();
//
//   Uint8List? markerIcon;
//
//   final Set<Marker> _marker = {};
//   String googleApikey = "AIzaSyCrPOCUEMHoOXOacOtMkuQxSbSE1lYzpFA";
//   GoogleMapController? mapController; //controller for Google map
//   CameraPosition? cameraPosition;
//   LatLng startLocation = LatLng(30.6972397, 76.6896764);
//   String location = "";
//
//   Future<Uint8List> getBytesFromAsset(String path, int width) async {
//     ByteData data = await rootBundle.load(path);
//     Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),targetWidth: width);
//     FrameInfo fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ImageByteFormat.png))!.buffer.asUint8List();
//   }
//
//   void customMarker() async {
//     markerIcon = await getBytesFromAsset('assets/location.png', 400);
//     _marker.add(Marker(
//         markerId: const MarkerId("DriverLocation"),
//         position: const LatLng(30.697082, 76.689472),
//         icon: BitmapDescriptor.fromBytes(markerIcon ?? Uint8List(0))));
//     setState(() {});
//   }
//
//   //get mapController => null;
//
//   // get plist => null;
//   @override
//   void initState() {
//     customMarker();
//     super.initState();
//   }
//
//   Future<Position> getUserCurrentLocation() async {
//     await Geolocator.requestPermission().then((value) {})
//         .onError((error, stackTrace) async {
//       await Geolocator.requestPermission();
//       print("ERROR" + error.toString());
//     }
//     );
//     return await Geolocator.getCurrentPosition();
//   }
//
//   // static const LatLng _center = const LatLng(30.7025812, 76.6825109);
//   CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(30.697082, 76.689472),
//     zoom: 14,
//   );
//
//   // void _onMapCreated(GoogleMapController controller) {
//   //   _controller.complete(controller);
//   //
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: SafeArea(
//         child: Scaffold(
//           body: Stack(children: [
//             GoogleMap(
//               mapType: MapType.normal,
//               compassEnabled: true,
//               // mapType: MapType.hybrid,
//               markers: _marker,
//               // polylines: Set<Polyline>.of(polylines.values),
// {
//                   Marker(
//                     infoWindow: InfoWindow(
//                       title: 'My Current Location'
//                     ),
//                     markerId: const MarkerId("current Loc"),
//                     position: const LatLng(30.697082, 76.689472),
//                     draggable: true,
//                     onDragEnd: (value) {
//                       // value is the new position
//                     },
//                     // To do: custom marker icon
//                   ),
//
//                   Marker(
//                     infoWindow: InfoWindow(
//                       title:'Mohali Bus Stand'
//                     ),
//                     markerId: const MarkerId("Mohali Bus Stand"),
//                     position: const LatLng(30.732921058514464, 76.70514336371731),
//                   ),
//                 },
//
//               myLocationEnabled: false,
//               zoomControlsEnabled: false,
//               myLocationButtonEnabled: false,
//               initialCameraPosition: _kGooglePlex,
//               onMapCreated: (GoogleMapController controller) {
//                 _controller.complete(controller);
//               },
//             ),
//             Positioned(
//               top: 17,
//               left: 48,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Select Your Location',
//                     style: TextStyle(
//                         fontSize: 28,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 10.h,
//               left: 8.w,
//               child: SizedBox(
//                 height: 8.h,
//                 width: 85.w,
//                 child: TextFormField(
//                     controller: searchScreenController,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(16)),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(16)),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                         borderSide: BorderSide(color: Colors.grey),
//                       ),
//                       hintText: 'Select destination location',
//                       prefixIcon: Icon(
//                         Icons.location_pin,
//                         color:Colors.orange[300],
//                       ),
//                     ),
//                     onChanged: (text) {
//                       log('confirm text field: $text');
//                       if (text.isEmpty) {
//                         isPlaceListVisible = false;
//                       } else {
//                         if (onClickList) {
//                           isPlaceListVisible = false;
//                           onClickList = false;
//                         } else {
//                           autoCompleteSearch(text);
//                           isPlaceListVisible = true;
//                         }
//                       }
//                     }
//                     ),
//               ),
//             ),
//           ]),
//    floatingActionButton: FloatingActionButton(
//             onPressed: () async {
//               getUserCurrentLocation().then(
//                       (value) async {
//                         print("My Location");
//                     print(value.latitude.toString() + " " + value.longitude.toString());
//
//
//
//    lat = value.latitude;
//                     lng = value.longitude;
//
//                     Coordinates coordinates = Coordinates(lat ,lng);
//                     var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//                     var first = address.first;
//                     print("Address"+first.featureName.toString() + first.addressLine.toString(),);
//
//                     setState(() {
//                       staddres=first.featureName.toString()+" "+first.addressLine.toString();
//                     }
//                     );
//
//
//
//                     // marker added for current users location
//                     markers:
//                         Marker(
//                           markerId: MarkerId("1"),
//                           position: LatLng(value.latitude, value.longitude),
//                           infoWindow: InfoWindow(
//                             title: 'My Current Location',
//                           ),
//                     );
//
//                     // specified current users location
//                     CameraPosition cameraPosition = new CameraPosition(
//                       target: LatLng(value.latitude, value.longitude),
//                       zoom: 14,
//                     );
//
//                     final GoogleMapController controller = await _controller.future;
//                     controller.animateCamera(
//                         CameraUpdate.newCameraPosition(cameraPosition));
//                     setState(() {});
//                   });
//
//
//
//  Navigator.push(context,
//                   MaterialPageRoute(
//                       builder: (context) => GeoCodScreen(
//                         addres: staddres,logo: lat,litt: lng,))
//               );
//
//             },
//             child: Icon(Icons.change_circle_outlined),
//           ),
//
//         ),
//       ),
//     );
//   }
//
//   void autoCompleteSearch(String value) async {
//     var result = await googlePlace?.autocomplete.get(value);
//        print("predictions.length ${result?.predictions?.length}");
//
//     //if (result != null && result.predictions != null) {
//     //   log(result?.predictions!.first.description.toString()??"");
//     //   predictions = result!.predictions!;
//     //   print("predictions.length ${predictions.length}");
//     //   setState(() {});
//     //   log('async');
//     //}
//   }
// }
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class DuabaMapScreen1 extends StatefulWidget {
  const DuabaMapScreen1({Key? key}) : super(key: key);

  @override

  State<DuabaMapScreen1> createState() => _DuabaMapScreen1State();
}

class _DuabaMapScreen1State extends State<DuabaMapScreen1> {

  GoogleMapController? mapController; //controller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = const LatLng(30.6972397, 76.6896764);
  final TextEditingController _controller = TextEditingController();
  var uuid = const Uuid();
  String _sessionToken = '122344';
  List<dynamic> _placesList = [];
  bool isPredictionAvailable = false,onClickList = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion (_controller.text);
  }
  void getSuggestion(String input)async{

    String kplacesApiKey = "AIzaSyCrPOCUEMHoOXOacOtMkuQxSbSE1lYzpFA";
    String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$kplacesApiKey&sessiontoken=$_sessionToken';

    var response =await http.get(Uri.parse(request));
    var data = response.body.toString();
    print('data');
    print(data);
    if (response.statusCode == 200){
      setState(() {
        _placesList = jsonDecode(response.body.toString())['predictions'];
        print("list:::${_placesList.toList()}");
        if(_placesList.isEmpty || _controller.text.isEmpty){
          isPredictionAvailable = false;
        }else{
          isPredictionAvailable = true;
        }
        setState(() {});
      });
    }else {
      throw Exception('Failed');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: Stack(
              children:[
                GoogleMap(
                  zoomGesturesEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: startLocation,
                    zoom: 14.0,
                  ),
                  mapType: MapType.normal,
                  onMapCreated: (controller) {
                    setState(() {
                      mapController = controller;
                    });
                  },
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(90, 50, 0, 0),
                    child: Text('Select Your Location',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.black ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical:15),
                            prefix:  Icon(
                            Icons.location_pin,
                            color:Colors.orange[300],
                          ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search Location',
                            hintStyle: TextStyle(color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(0)
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                        onChanged: (text) {
                          log('confirm text field: $text');
                          if (text.isEmpty) {
                            isPredictionAvailable = false;
                          } else {
                            if (onClickList) {
                              isPredictionAvailable = false;
                              onClickList = false;
                            } else {
                              isPredictionAvailable = true;
                            }
                          }
                        },
                      ),
                      isPredictionAvailable == true
                          ? Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.white,
                        child: ListView.builder(
                            itemCount: _placesList.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                onTap: (){
                                  isPredictionAvailable=false;
                                   _controller.text=_placesList[index]["description"].toString();
                                  setState(() {});
                                },
                                title: Text(_placesList[index]['description']),
                              ) ;
                            }),
                      )
                          : SizedBox.shrink()
                    ],
                  ),
                ),
              ]
          ),
        );
      }
    );
  }
}