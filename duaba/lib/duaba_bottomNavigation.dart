import 'package:duaba/duabaMapScreen.dart';
import 'package:duaba/duaba_Register_page.dart';
import 'package:duaba/duaba_Verif_page.dart';
import 'package:flutter/material.dart';

class DuabaBottomNavigationBar extends StatefulWidget {
  const DuabaBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<DuabaBottomNavigationBar> createState() => _DuabaBottomNavigationBarState();
}

class _DuabaBottomNavigationBarState extends State<DuabaBottomNavigationBar> {
  int _selectedIndex = 0;
  final  List<Widget> _widgetOptions = <Widget>[DuabaMapScreen1(),DuabaRegisterPage(),DuabaVerificationPage()
   /* Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),*/
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
        bottomNavigationBar: BottomNavigationBar(
            items:<BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  label: 'Name',
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home),
                 // backgroundColor: Colors.green
              ),
              BottomNavigationBarItem(
                  label: 'Search',
                  icon: Icon(Icons.search),
                 activeIcon: Icon(Icons.search),
                 // backgroundColor: Colors.yellow
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person),
                activeIcon: Icon(Icons.person),
               // backgroundColor: Colors.blue,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            backgroundColor: Colors.orange,
            selectedItemColor: Colors.black,
            iconSize: 40,
            onTap: _onItemTapped,
            elevation: 5
        ),
    );
  }
}
