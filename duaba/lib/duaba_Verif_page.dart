import 'package:flutter/material.dart';

class DuabaVerificationPage extends StatefulWidget {
  const DuabaVerificationPage({Key? key}) : super(key: key);

  @override
  State<DuabaVerificationPage> createState() => _DuabaVerificationPageState();
}

class _DuabaVerificationPageState extends State<DuabaVerificationPage> {
  TextEditingController _controller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
            child: SingleChildScrollView(
              child: verificationPage()
            ),
          )
        ),
      ),
    );
  }
  Widget verificationPage(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30,left: 10),
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
                child:TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back,color: Colors.black,),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25,left: 18),
          child: Text('Verification',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20,left: 19),
          child: Text('Please enter verification code sent to your email account.',style: TextStyle(fontSize: 19,),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20,left: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 45,
                width: 40,
                child: TextField(
                  cursorColor: Colors.black,
                  cursorWidth: 1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1)
                      )
                  ),
                  onChanged: (value) {
                    if (value. length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  onSubmitted:(pin1){ print('code==>$pin1');} ,
                ),
              ),
              SizedBox(
                height: 45,
                width: 40,
                child: TextField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1)
                      )
                  ),
                  onChanged: (value) {
                    if (value. length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  onSubmitted:(pin1){ print('code==>$pin1');} ,
                ),
              ),
              SizedBox(
                height: 45,
                width: 40,
                child: TextField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1)
                      )
                  ),
                  onChanged: (value) {
                    if (value. length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  onSubmitted:(pin1){ print('code==>$pin1');} ,
                ),
              ),
              SizedBox(
                height: 45,
                width: 40,
                child: TextField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1)
                      )
                  ),          onChanged: (value) {
                  if (value. length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                  textAlign: TextAlign.center,
                  onSubmitted:(pin1){ print('code==>$pin1');} ,
                ),
              ),
              SizedBox(
                height: 45,
                width: 40,
                child: TextField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1)
                      )
                  ),
                  onChanged: (value) {
                    if (value. length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  onSubmitted:(pin1){ print('code==>$pin1');} ,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 18),
              child: Text("Didn't recived code ?",
                style: TextStyle(fontSize: 15,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,right: 18),
              child: InkWell(
                  onTap: (){},
                  child: Text('Resend Code',
                    style: TextStyle(fontSize: 15,color: Colors.yellow[800],decoration: TextDecoration.underline),
                  )
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 260),
              child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[600],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    onPressed: (){
                    },
                    child:Text('REGISTER', style: TextStyle(fontSize: 25,color: Colors.white),)
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
