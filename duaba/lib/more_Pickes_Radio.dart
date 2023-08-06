import 'package:flutter/material.dart';

class MorePickRadio extends StatefulWidget {
  const MorePickRadio({Key? key}) : super(key: key);

  @override
  State<MorePickRadio> createState() => _MorePickRadioState();
}

class _MorePickRadioState extends State<MorePickRadio> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More Picks'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            setState(() {
              showAlertDialog();
            });
          },
          child: Text('Click Here'),
        ),
      ),
    );
  }
  showAlertDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return SizedBox(
              //width: 200,
              child: AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                //insetPadding: EdgeInsets.all(5.0),
                contentPadding: EdgeInsets.only(bottom: 5),
                content: SizedBox(
                  height: 380,
                  width:300,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                         IconButton(onPressed: (){
                           Navigator.pop(context);
                         }, icon: Icon(Icons.cancel_outlined,))
                        ],
                      ),
                      Text('Tell Us How You Heard About Us',
                        style: TextStyle(fontSize:15,fontWeight:FontWeight.bold,),),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0,right: 8,left: 20),
                        child: Text('Which MorePicks Expert brought you to the app ?',
                          style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.left,),
                      ),
                      ListTile(
                        title: const Text('Chuck'),
                        leading: Radio(
                          activeColor: Colors.black,
                          value: 'Chuk',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() =>gender =value);
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Lexy'),
                        leading: Radio(
                          activeColor: Colors.black,
                          value: 'Lexy',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() =>gender =value);
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Tony'),
                        leading: Radio(
                          activeColor: Colors.black,
                          value: 'Tony',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() =>gender =value);
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Treb'),
                        leading: Radio(
                          activeColor: Colors.black,
                          value: 'Trebs',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() =>gender =value);
                          },
                        ),
                      ),

                      /*   RadioListTile(
                          activeColor: Colors.black,
                          value: 'Chuck',
                          title: Text('Chuck'),
                          groupValue:gender,
                          onChanged: (val){
                            setState(() => gender = val);
                      }
                      ),
                      RadioListTile(
                          activeColor: Colors.black,
                          value: 'Lexy',
                          title: Text('Lexy'),
                          groupValue:gender,
                          onChanged: (val){
                            setState(() => gender = val);
                          }
                          ),
                      RadioListTile(
                          activeColor: Colors.black,
                          value: 'Tony',
                          title: Text('Tony'),
                          groupValue:gender,
                          onChanged: (val){
                            setState(() => gender = val);}
                      ),
                      RadioListTile(
                          activeColor: Colors.black,
                          value: 'Treb',
                          title: Text('Treb'),
                          groupValue:gender,
                          onChanged: (val){
                            setState(() => gender = val);
                          }
                      ),*/
                     InkWell(
                       onTap: (){},
                       child: Container(
                         height: 50,
                         width: 200,
                    decoration: BoxDecoration(
                        border: Border(top:BorderSide(color: Colors.black,width: 2),
                            right: BorderSide(color: Colors.grey,width: 2),
                            left: BorderSide(color: Colors.black,width: 2),
                            bottom: BorderSide(color: Colors.grey,width: 2))
                    ),
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Submit',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
                           textAlign: TextAlign.center,
                           ),
                         ),
                       ),
                     )
                    ],
                  ),
                ),
              ),
            );
          }
        );
      },
    );
  }
 /* showAlertDialog(BuildContext context) {
    // Create button
    Column(
      children: [
        RadioListTile(
          title: Text("Male"),
          value: "male",
          groupValue: gender,
          onChanged: (value){
            setState(() {
              gender = value.toString();
            });
          },
        ),

        RadioListTile(
          title: Text("Female"),
          value: "female",
          groupValue: gender,
          onChanged: (value){
            setState(() {
              gender = value.toString();
            });
          },
        ),

        RadioListTile(
          title: Text("Other"),
          value: "other",
          groupValue: gender,
          onChanged: (value){
            setState(() {
              gender = value.toString();
            });
          },
        )
      ],
    );
  Widget okButton = TextButton(
      child: Text("ff"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Simple Alert"),
      content: Text("This is an alert message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }*/
}
