import 'package:flutter/material.dart';

class DuabaPageFirst extends StatefulWidget {
  const DuabaPageFirst({Key? key}) : super(key: key);

  @override
  State<DuabaPageFirst> createState() => _DuabaPageFirstState();
}

class _DuabaPageFirstState extends State<DuabaPageFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          style:TextButton.styleFrom(
                              shadowColor: Colors.white
                          ),
                          onPressed: (){},
                          child: Text('Skip',
                            style: TextStyle(fontSize: 17,color: Colors.black),
                          )
                      )
                    ],
                  ),
                  Image
                    (width: 400,height: 300,
                      image: AssetImage('assets/foodboy.png')
                  ),
                  Text("Live tracking of your Food or Groceries",
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                    textAlign:TextAlign.center ,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit maruis sed",
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                      textAlign:TextAlign.center ,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child:Center(child: Text('fdsdsds')),
            ),
            Container(
              child:Center(child: Text('fdsdsds')),
            ),
          ],
        ),
      ),
    );
  }
}
