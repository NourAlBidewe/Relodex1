import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import './serviceProvider.dart';
import './badge.dart';
import 'package:flutter_rating/flutter_rating.dart';
import './crud.dart';
import './displayInfo.dart';
import './displayServiceProvider.dart';

serviceProvider sv;
double raty = 0;
bool badge1 = false;
bool badge2 = false;
bool badge3 = false;
String DiamondPath = 'assets/diamond.png';
String crownPath = 'assets/crown.png';
String handsPath = 'assets/hands.png';

String DiamondYellowPath = 'assets/diamondYellow.png';
String crownYellowPath = 'assets/crownYellow.png';
String handsYellowPath = 'assets/handsYellow.png';

//GIVE RATY TO USER INSTANCE

const double pi = 3.1415926535897932;

class UpdateInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UpdateInfo();
  }

  UpdateInfo(serviceProvider s) {
    sv = s;
  }
}

class _UpdateInfo extends State<UpdateInfo> {
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
                  sv.average_rating = fb.updateServicerStars(sv, rating);
                  //print(sv.average_rating);
                 Display(sv);
                  //Crud.update(s, map)
                  //Firestore.instance.collection('').document(‘Apple’).updateData({ ‘price’: 120, ‘quantity’: 15 });
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
      Row(
        children: <Widget>[
          Badge(
              DiamondPath, sv, 0, DiamondYellowPath, 'btn5', 'شي فاخر عالاخر'),
          Badge(crownPath, sv, 1, crownYellowPath, 'btn6', 'حلى معلم'),
          Badge(handsPath, sv, 2, handsYellowPath, 'btn7', 'يسلموون'),
        ],
      )
    ]);
  }
}
