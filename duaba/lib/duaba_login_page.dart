import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:duaba/duabaMapScreen.dart';
import 'package:duaba/duaba_Register_page.dart';
import 'package:duaba/duaba_bottomNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'duaba_Modals/login_Request_Modal.dart';
import 'duaba_SplashScreen.dart';
import 'duaba_Verif_page.dart';


class DubaLoginPage extends StatefulWidget {
  const DubaLoginPage({Key? key}) : super(key: key);

  @override
  State<DubaLoginPage> createState() => DubaLoginPageState();
}

class DubaLoginPageState extends State<DubaLoginPage> {
  Dio dio = new Dio();
  FirebaseAuth _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();
  TextEditingController _EmailController = new TextEditingController();
  TextEditingController _PassController = new TextEditingController();
  bool obscureText = false;
  bool loading = false;
  String? emailvalue = "No value";
  String? passvalue = "No Pass";
  late SharedPreferences pref;

  @override
  void initState() {
    shared();
    // TODO: implement initState
    super.initState();
  }

  shared() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          /* resizeToAvoidBottomInset :false,*/
          body: Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaY: 100, sigmaX: 100),
                      child: Image.asset(
                        'assets/Login.png',
                        fit: BoxFit.fill,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                      height: double.infinity,
                      child: SvgPicture.asset('assets/logo.svg')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 240),
                  child: Container(
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(50))),
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Welcome Back !',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
                                keyboardType: TextInputType.emailAddress,
                                controller: _EmailController,
                                // obscureText: true,
                                validator: (value) {
                                  if (value?.isEmpty == true) {
                                    return 'Enter Correct Email';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.grey),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(16)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(16)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 1, right: 8, left: 9),
                              child: TextFormField(
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).unfocus(),
                                keyboardType: TextInputType.streetAddress,
                                controller: _PassController,
                                obscureText: obscureText,
                                validator: (value) {
                                  if (value?.isEmpty == true) {
                                    return 'Enter Correct Password';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.grey),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(16)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(16)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: 'password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      obscureText = !obscureText;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      obscureText == true
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 18.0, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Forgot Password ?',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SizedBox(
                                width: 300,
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: ()async{
                                    setState(() {
                                      loading = true;
                                    });
                                    getLogin();
                              /* var tokenGet =  await  pref.getString(DuabaSplashState.tokenkeyValue);
                               print("token get ${tokenGet}");*/
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DuabaVerificationPage(),
                                        ));
                                  }
                                  /* setState(() {
                                      loading = true;
                                    });
                                    var name=_EmailController.text.toString();
                                    pref.setString( DuabaSplashState.keyValue, name);
                                    if (_formkey.currentState!.validate()) {
                                      _auth.signInWithEmailAndPassword(
                                              email: _EmailController.text.toString(),
                                              password: _PassController.text.toString()).then((value) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DuabaMapScreen1(),
                                            ));
                                        setState(() {
                                          loading = false;
                                        });
                                      }).onError((error, stackTrace) {
                                        print('Incorrect Email');
                                        setState(() {
                                          loading = false;
                                        });
                                      });
                                    }
                                  },*/
                                  ,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow[600],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  child: loading
                                      ? CircularProgressIndicator(
                                          color: Colors.black,
                                          strokeWidth: 3,
                                        )
                                      : Text(
                                          'LogIn',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Don't",
                                      style: TextStyle(color: Colors.grey),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' have an account ?',
                                            style: TextStyle(fontSize: 15)),
                                        /*  TextSpan(
                                          text: 'Register',
                                          style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
                                        ),*/
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DuabaRegisterPage(),
                                          ));
                                    },
                                    child: Text('Register',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline)),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              child: Container(
                                width: 50.w,
                                height: 6.h,
                                margin: EdgeInsets.only(top: 25),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.withOpacity(0.2)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/googleImage.png'),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    Text(
                                      'Sign in with Google',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                signup(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await _auth.signInWithCredential(authCredential);
      //User? user = result.user;

      if (result != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DuabaMapScreen1()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  Future getLogin() async {
    try {
      var response = await dio.post('http://duaba.co.uk:95/api/v1/auth/login',
          data: LoginRequest(
            email: _EmailController.text,
            password: _PassController.text,
            deviceToken: "aaaaaaaa",
            deviceType: "oppo",
            role: "1",
          ),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

      print("save token ${response.data["body"]["token"]}");
      await pref.setString(DuabaSplashState.tokenkeyValue, response.data["body"]["token"]);
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }


}
