import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m3allim/User.dart';
import './ServiceProvider.dart';
import './MenuButton.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './DisplayCards.dart';
import 'youssef.dart';

import './bottomNavigator.dart';

class Myapp extends StatelessWidget {
  List<ServiceProvider> lst;
  User u;
   Myapp(this.lst, this.u);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new _Myapp(lst,u));
  }
}


class _Myapp extends StatelessWidget{
   List<ServiceProvider> lst;
   User u;
   _Myapp(this.lst, this.u);

   int h(){
      return 0;
   }

   @override
 Widget build(BuildContext context) {
    return  Scaffold(

        appBar: AppBar(backgroundColor: Colors.deepPurple, actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 17.0,
            onPressed: () {},
          ),
          
        ],
       
        ),
        
        //backgroundColor: Colors.white,
        body: ListView(children: [
          menubutton(lst, lst),
          ServiceDisplay(lst, u),
        ],
        ),
       bottomNavigationBar: bottomNavigator(),
        );
  }



}
