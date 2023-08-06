import 'dart:async';

import 'package:duaba/duabaMapScreen.dart';
import 'package:duaba/duabaPageview.dart';
import 'package:duaba/duaba_SplashScreen.dart';
import 'package:duaba/duaba_login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import 'duabaMap2.dart';
import 'duabaPickupDetails.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return
          MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home://DubaLoginPage()
           // DuabaSplash(title: 'Open',)
              Location1()
            // DuabaMapScreen1(),
          );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
int _currentview=0;
bool islastview=true;
final controller= PageController();
@override
/*  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(milliseconds: 500),
        (){}
    );
  }*/
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
           Container(
           // padding: EdgeInsets.only(bottom: 80),
            //color: Colors.white,
            child:  PageView(
              controller: controller,
              //clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              onPageChanged: (index){
                setState(() {
                  _currentview=index;
                });

              },
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    child:Column(
                      children: [
                        Container(
                          width: 500,
                          height: 300,
                          child: SvgPicture.asset('assets/onboarding1.svg',fit: BoxFit.contain,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Text("Live tracking of your Food or Groceries",
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                            textAlign:TextAlign.center ,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit maruis sed",
                            style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                            textAlign:TextAlign.center ,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child:Column(
                    children: [
                      Container(
                          width: 500,
                          height: 380,
                          child: SvgPicture.asset('assets/onboarding2.svg')),
                      Text("Delivered Your Food or Grocerices On Time",
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                        textAlign:TextAlign.center ,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit maruis sed",
                          style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                          textAlign:TextAlign.center ,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child:Column(
                    children: [
                     Padding(
                       padding: const EdgeInsets.only(top: 50),
                       child: SvgPicture.asset('assets/onboarding3.svg'),
                     ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Text("Your Order is 100% Secure",
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                          textAlign:TextAlign.center ,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit maruis sed",
                          style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                          textAlign:TextAlign.center ,
                        ),
                      ),
                     // row(),
                    ],
                  ),
                ),
              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 InkWell(
                     child: Text('Skip',style: TextStyle(color: Colors.black,fontSize: 18),),
                   onTap:(){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DubaLoginPage(),));
                   } ,)
               ],
             ),
           ),
          ]
        ),
        bottomSheet:Container(
          color: _currentview==0?Colors.orangeAccent:_currentview==1?Colors.limeAccent[700]:Colors.yellow[600],
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: row()
        )
      )
    );
  }
  Widget row(){
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Padding(
         padding: const EdgeInsets.only(left: 20),
         child: Row(
           children: [
             _currentview==0?Container(decoration: ShapeDecoration(color: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),height: 4,width: 28,): SizedBox(width:20,child: Icon(Icons.circle,size: 9,color: Colors.white,)),
             _currentview==1? Container(decoration: ShapeDecoration(color: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),height: 4,width: 28,): SizedBox(width:20,child: Icon(Icons.circle,size: 9,color: Colors.white,)),
             _currentview==2?  Container(decoration: ShapeDecoration(color: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),height: 4,width: 28,): SizedBox(width:20,child: Icon(Icons.circle,size: 9,color: Colors.white,)),
           ],
         ),
       ),
        InkWell(
            onTap: () =>{
              if(_currentview==2){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DubaLoginPage(),))
            }else{
                controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
              },
            },
            child: Text('Next',style: TextStyle(fontSize: 20,color: Colors.white),))
      ],
    );
  }
}
