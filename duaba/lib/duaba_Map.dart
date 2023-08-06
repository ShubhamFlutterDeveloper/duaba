import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DuabaSharedPref extends StatefulWidget {
  const DuabaSharedPref({Key? key}) : super(key: key);

  @override
  State<DuabaSharedPref> createState() => _DuabaSharedPrefState();
}

class _DuabaSharedPrefState extends State<DuabaSharedPref> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
  String? namevalue="No value";
  String? passvalue="No Pass";
  @override
  void initState() {
    super.initState();
    getvalue();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Map Place'),
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: TextField(
              textAlign: TextAlign.center,
              controller:namecontroller,

            ),
          ),
         Padding(
            padding: const EdgeInsets.only(top:10,left: 50,right: 50),
            child: TextField(decoration: InputDecoration(),
              controller: passcontroller,
            ),
          ),
          Center(child: ElevatedButton(
              onPressed: ()async{
                var name=namecontroller.text.toString();
               var pass=passcontroller.text.toString();

                var pref=await SharedPreferences.getInstance();
                pref.setString("name",name);
               pref.setString("pass", pass);
              },
              child:Text('Save'))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(namevalue.toString())),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(passvalue.toString())),
          ),
        ],
      )
    );
  }

  void getvalue() async{
        var pref= await SharedPreferences.getInstance();
    var getName=pref.getString("name");
    var getPass=pref.getString("pass");
    setState(() {
      namevalue= getName?? "No value";
      passvalue=getPass??"No pass";
    });
  }
}
