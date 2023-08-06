import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:duaba/duaba_login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'duaba_Modals/SignUp_Request_Modal.dart';
import 'duaba_Verif_page.dart';

class DuabaRegisterPage extends StatefulWidget {
   DuabaRegisterPage({Key? key}) : super(key: key);
/*  String email;
  String password;
  DuabaRegisterPage(this.email,this.password);*/
  @override
  State<DuabaRegisterPage> createState() => _DuabaRegisterPageState();
}

class _DuabaRegisterPageState extends State<DuabaRegisterPage> {
  Dio dio = new Dio();

  bool loading=false;
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth _auth=FirebaseAuth.instance;
  bool? _firstvalue=false;
  TextEditingController _firstController= new TextEditingController();
  TextEditingController _lastController= new TextEditingController();
  TextEditingController _emailController= new TextEditingController();
  TextEditingController _mobileController= new TextEditingController();
  TextEditingController _passController= new TextEditingController();
  TextEditingController _confirmpassController= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
          child: Scaffold(
            body: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: ImageFiltered(
                        imageFilter:ImageFilter.blur(sigmaX: 200,sigmaY:200) ,
                        child: Image.asset('assets/Login.png',fit: BoxFit.fill,)),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(80)
                        ),
                      color: Colors.white.withOpacity(0.9),
                      ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.3),
                                    ),
                                    child:InkWell(
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.arrow_back)),
                                  )
                                  ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0,top: 6.0),
                                  child: Text('Register',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5.0 ,left:5.0 ,right:5.0 ,bottom:5.0 ),
                              child: TextField(
                                controller: _firstController,
                                //style: TextStyle(fontSize: 15.0, height: 1.0,),
                                decoration: InputDecoration(
                                  hintText: ' First Name',
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(16)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5.0 ,left:5.0 ,right:5.0 ,bottom:5.0 ),
                              child: TextField(
                                controller: _lastController,
                                //style: TextStyle(fontSize: 15.0, height: 1.0,),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                    hintText: ' Last Name',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(16)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5.0 ,left:5.0 ,right:5.0 ,bottom:5.0 ),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (val){
                                },
                                controller: _emailController,
                                //style: TextStyle(fontSize: 15.0, height: 1.0,),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                    hintText: ' Email',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(16)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5.0 ,left:5.0 ,right:5.0 ,bottom:5.0 ),
                              child: TextField(
                                controller: _mobileController,
                                keyboardType: TextInputType.phone,
                               // style: TextStyle(fontSize: 15.0, height: 1.0,),
                                decoration: InputDecoration(
                                  hintText: ' Mobile No',
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5.0 ,left:5.0 ,right:5.0 ,bottom:5.0 ),
                              child: TextFormField(
                                validator: (val){
                                  if (val?.isEmpty == true) {
                                    return 'Enter Correct Password';
                                  }
                                  return null;
                                },
                                controller: _passController,
                                // style: TextStyle(fontSize: 15.0, height: 1.0,),
                                decoration: InputDecoration(
                                    hintText: ' Password',
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(16)),
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5.0 ,left:5.0 ,right:5.0 ,bottom:5.0 ),
                              child: TextField(
                                controller: _confirmpassController,
                                // style: TextStyle(fontSize: 15.0, height: 1.0,),
                                decoration: InputDecoration(
                                    hintText: ' Confirm Password',
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.black,
                                    value:_firstvalue,
                                    onChanged: (val) {
                                      setState(() {
                                        _firstvalue = val;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(spellOut: true,
                                          text: 'I Accept all ',
                                          style: TextStyle(fontSize: 15,color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Terms & Conditions ',
                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration.underline
                                                )
                                            ),
                                            TextSpan(
                                              text: 'and ',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            TextSpan(
                                                text: 'Privacy Polices',
                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration.underline
                                                )
                                            ),
                                          ]
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SizedBox(
                                width: 300,
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow[600],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                  ),
                                    onPressed: (){
                                      postSignIn();
                                      Navigator.pop(context, MaterialPageRoute(
                                        builder: (context) => DubaLoginPage(),));

                                     /* setState(() {
                                        loading=true;
                                      });*/
                                      /*if(_formkey.currentState!.validate()){
                                        _auth.createUserWithEmailAndPassword(
                                            email:_emailController.text.toString(),
                                            password:_passController.text.toString()).then((value){
                                          Navigator.pop(context, MaterialPageRoute(
                                            builder: (context) => DubaLoginPage(),));
                                          setState(() {
                                            loading=false;
                                          });
                                        }).onError((error, stackTrace){
                                          print('Incorrect Email');
                                          setState(() {
                                            loading=false;
                                          });
                                        });
                                      }
                                     ;*/
                                    },
                                    child:/*loading?CircularProgressIndicator(color: Colors.black,strokeWidth: 4,):*/Text('REGISTER', style: TextStyle(fontSize: 25,color: Colors.white),)
                                ),
                              ),
                            )
                          ],
                        ),
                    )
                    ),
                  )
                ],
              ),
            ),
      )
      ),
    );
  }
  Future postSignIn()async {
    try {
      var response = await dio.post('http://duaba.co.uk:95/api/v1/auth/customersignUp',
          data: SignupRequest(
            countryCode: "911",
            firstname: _firstController.text,
            lastname: _lastController.text,
            email:_emailController.text,
            password:_passController.text ,
            deviceType:"oppo",
            deviceToken: "aaaaaaaa",
            mobileNumber: _mobileController.text,
              dob:null ,
              gender: null,
          ),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));
      print(response.data);
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
