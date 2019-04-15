import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'addServiceProvider.dart';
// import 'x.dart';
// import './reemApp.dart';
class bottomNavigator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _bottomNavigator();
  }
  
}

class _bottomNavigator extends State<bottomNavigator>{
  int indexy = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CurvedNavigationBar(
        color: Colors.white,
           initialIndex: 0,
          animationDuration: Duration(milliseconds: 150),
      backgroundColor: Colors.deepPurpleAccent,
      items: <Widget>[
        Icon(Icons.home, size: 30, color: Colors.deepPurpleAccent,),
        Icon(Icons.add, size: 30, color: Colors.deepPurpleAccent),
        //Icon(Icons.favorite, size: 30, color: Colors.white),
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
