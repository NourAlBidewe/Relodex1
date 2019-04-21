import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:m3allim/User.dart';
import 'package:m3allim/displayBadges.dart';
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

//GIVE RATY TO USER INSTANCE

const double pi = 3.1415926535897932;

class UpdateInfo extends StatefulWidget {
  ServiceProvider sv;
  User u;

  UpdateInfo(ServiceProvider s, u) {
    this.sv = s;
    this.u = u;
  }

  @override
  State<StatefulWidget> createState() {
    return _UpdateInfo(sv, u);
  }
}

class _UpdateInfo extends State<UpdateInfo> {
  String DiamondPath = 'assets/dnew.png';
  String crownPath = 'assets/cnew.png';
  String handsPath = 'assets/hnew.png';

  String DiamondYellowPath = 'assets/dnewYellow.png';
  String crownYellowPath = 'assets/cnewYellow.png';
  String handsYellowPath = 'assets/hnewYellow.png';

  String pathD = 'assets/dnew.png';
  String pathC = 'assets/cnew.png';
  String pathH = 'assets/hnew.png';

  ServiceProvider sv;
  User u;

  _UpdateInfo(ServiceProvider s, u) {
    this.sv = s;
    this.u = u;
  }

  changeImage() {
    int badge = fb.previous(sv, u, 'badge');
    print(badge);
    if (badge == -1) {}
    if (badge == 1) {
      pathD = DiamondPath;
    }

    if (badge == 2) {
      print('hellooooo');
      pathC = crownPath;
    }

    if (badge == 3) {
      pathH = handsPath;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // Align(alignment: Alignment(0.8, -1),
      Align(
        alignment: Alignment(0, 0),
        child: new Text(
          "اضف تقييما",
          textAlign: TextAlign.right,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      // RaisedButton(child: Text("j"),
      // onPressed: (){
      //   print(sv.average_rating);
      // },),
      //Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/2),
      new StarRating(
        size: 28,
        color: Colors.orange,
        onRatingChanged: (rating) {
          fb.updateServiceProviderStars(sv, u, rating);
          raty = rating;
          setState(() {
            //print(sv.average_rating);
          });
        },
        rating: raty,
      ),

      // Align(alignment: Alignment(0.8, -1),
      Align(
          alignment: Alignment(0, 0),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'انت كريم وهو بيستاهل',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          )),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,
        child: ListView(
          scrollDirection: Axis.horizontal,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/3.3, height: MediaQuery.of(context).size.width/2,
              child: FlatButton(
                //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  setState(() {
                    // changeImage();
                    pathD = DiamondYellowPath;
                    fb.incrementServiceProviderBadges(sv, u, 1);
                  });
                },
                child: Badge(pathD, sv, 1, DiamondYellowPath, 'btn5',
                    'شي فاخر عالاخر', u),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/3.3, height: MediaQuery.of(context).size.width/2,
              child: FlatButton(
                //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  setState(() {
                    // changeImage();
                    pathC = crownYellowPath;
                    fb.incrementServiceProviderBadges(sv, u, 2);
                  });
                },
                child: Badge(
                    pathC, sv, 2, crownYellowPath, 'btn6', 'احلى معلم', u),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/3.3, height: MediaQuery.of(context).size.width/2,
              child: FlatButton(
                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  setState(() {
                    // changeImage();
                    pathH = handsYellowPath;
                    print(pathH);
                    fb.incrementServiceProviderBadges(sv, u, 3);
                  });
                },
                child:
                    Badge(pathH, sv, 3, handsYellowPath, 'btn7', 'يسلّمون', u),
              ),
            ),
          ],
        ),
      )
      // displayBadges(u, sv),

      //ADD THE BADGES
      // displayBadges(u,sv)
    ]);
  }
}
