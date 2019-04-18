import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:m3allim/User.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import './ServiceProvider.dart';
import './badge.dart';
import 'package:flutter_rating/flutter_rating.dart';
import './crud.dart';
import './displayInfo.dart';
import './displayServiceProvider.dart';


double raty = 0;
bool badge1 = false;
bool badge2 = false;
bool badge3 = false;
String DiamondPath = 'assets/dnew.png';
String crownPath = 'assets/cnew.png';
String handsPath = 'assets/hnew.png';

String DiamondYellowPath = 'assets/dnewYellow.png';
String crownYellowPath = 'assets/cnewYellow.png';
String handsYellowPath = 'assets/hnewYellow.png';

//GIVE RATY TO USER INSTANCE

const double pi = 3.1415926535897932;

class UpdateInfo extends StatefulWidget {

  ServiceProvider sv;
  User u;
  
  UpdateInfo(ServiceProvider s,  u) {
    this.sv = s;
    this.u = u;

  }

  @override
  State<StatefulWidget> createState() {
    return _UpdateInfo(sv, u);
  }

  
}

class _UpdateInfo extends State<UpdateInfo> {
     ServiceProvider sv;
  User u; 

   _UpdateInfo(ServiceProvider s,  u) {
    this.sv = s;
    this.u = u;

  }



  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // Align(alignment: Alignment(0.8, -1),
      Align(alignment: Alignment(0, 0),
        child: new Text(
          "اضف تقييما",
          textAlign: TextAlign.right,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      //Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/2),
        new StarRating(
          size: 28,
          color: Colors.orange,
          onRatingChanged: (rating) => setState(
                () {
                  raty = rating;
                  fb.updateServiceProviderStars(sv, u, rating);
                },
              ),
          rating: raty,
        ),
      
      // Align(alignment: Alignment(0.8, -1),
      Align(alignment: Alignment(0, 0),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'انت كريم وهو بيستاهل',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          )),
      //ADD THE BADGES
       Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height/4,
         child: Row(
         
         //scrollDirection: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Badge(
          DiamondPath, sv, 1, DiamondPath, 'btn5', 'شي فاخر عالاخر',u),
          Badge(crownPath, sv, 2, crownPath, 'btn6', 'احلى معلم',u),
          Badge(handsPath, sv, 3, handsPath, 'btn7', 'يسلّمون',u),
          
        ],
      ),)



      // Container(
      //   height: 300,
      //   width: 5000,
      //   child: ListView(
      //     scrollDirection: Axis.horizontal,
      //     children: <Widget>[
      //     Badge(
      //     DiamondPath, sv, 1, DiamondYellowPath, 'btn5', 'شي فاخر عالاخر',u),
      //     Badge(crownPath, sv, 2, crownYellowPath, 'btn6', 'احلى معلم',u),
      //     Badge(handsPath, sv, 3, handsYellowPath, 'btn7', 'يسلموون',u),
      //     //Badge(handsPath, sv, 3, handsYellowPath, 'btn7', 'يسلموون',u),
      //   ]),
        
      // )



      // ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemBuilder: (BuildContext context, int index) {
      //     return new Row(
      //       children: <Widget>[
      //         Badge(
      //     DiamondPath, sv, 1, DiamondYellowPath, 'btn5', 'شي فاخر عالاخر',u),
      //     Badge(crownPath, sv, 2, crownYellowPath, 'btn6', 'احلى معلم',u),
      //     Badge(handsPath, sv, 3, handsYellowPath, 'btn7', 'يسلموون',u),
      //     Badge(handsPath, sv, 3, handsYellowPath, 'btn7', 'يسلموون',u),
      //       ],
      //     );
      //   }
      // )


      // SizedBox(
      //   height: 300,
      //   child: 
      //    ListView.builder(
      //      itemCount: 3,
      //      //shrinkWrap: true,
      //   scrollDirection: Axis.horizontal,
      //   itemBuilder: (BuildContext context, int index) {
      //     return new Row(
      //       children: <Widget>[
      //         Badge(
      //     DiamondPath, sv, 1, DiamondYellowPath, 'btn5', 'شي فاخر عالاخر',u),
      //     Badge(crownPath, sv, 2, crownYellowPath, 'btn6', 'احلى معلم',u),
      //     Badge(handsPath, sv, 3, handsYellowPath, 'btn7', 'يسلموون',u),
      //    // Badge(handsPath, sv, 4, handsYellowPath, 'btn9', 'يسلموون',u),
      //       ],
      //     );
      //   }
      // ),
      // )


    ]);
  }
}
