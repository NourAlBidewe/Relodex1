import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'youssef.dart';
// import './reemApp.dart';
class bottomNavigator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _bottomNavigator();
  }
  
}

class _bottomNavigator extends State<bottomNavigator>{
  int indexy = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CurvedNavigationBar(
           initialIndex: 0,
          animationDuration: Duration(milliseconds: 150),
      backgroundColor: Colors.white,
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.add, size: 30),
        Icon(Icons.favorite, size: 30),
      ],
      onTap: (index) {
        
          setState(() {
            if(index ==1){
             Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => MyApp()));
            } 
           
            
             });
         

      },
    );
  }

}